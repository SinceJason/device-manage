package org.auts.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.auts.bean.EquMessage;
import org.auts.util.DataBase;


public class EquDao {
	ArrayList<EquMessage> list=null;
	EquMessage em=null;
 public ArrayList<EquMessage> getList() {
	 ArrayList<EquMessage> list=new ArrayList<EquMessage>();
	 DataBase db=new DataBase();
	 String sql="select * from equmessage";
	 ResultSet rs=db.selectData(sql);
	 try {
		while(rs.next()){
			em=new EquMessage();
			em.setId(rs.getInt(1));
			em.setName(rs.getString(2));
			em.setPrice(rs.getString(3));
			 list.add(em);
		 }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;	 
}
}
