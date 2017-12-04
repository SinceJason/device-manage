package dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pojo.TbUser;

public class UserDaoImpl extends HibernateDaoSupport implements IUserDao{

	public TbUser login(String userName, String password) {
		System.out.println("进入 UserDaoImpl 的 login 方法....");
		Session session= getSession();
		Query query=null;
		try {
			 query=session.createQuery(" select tu from TbUser tu where tu.userName='"+userName+"' and tu.userPassword='"+password+"' ");
			//.setParameter("userName", userName)
			//.setParameter("userPassword", password);
		} catch (Exception e) {
			System.out.println("UserDaoImpl:Query query=....");
			e.printStackTrace();
		}
		
		List<TbUser> list=null;
		try {
			list = query.list();
		} catch (Exception e) {
			System.out.println("UserDaoImpl:  list =");
			e.printStackTrace();
		}
		
		session.close();
		
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				TbUser tu1=(TbUser)list.get(i);
				System.out.println(tu1.getUserName());
			}			
			return list.get(0);
		}
		return null;
	}
	
}
