package dao;

import pojo.TbUser;

public interface IUserDao {
	public TbUser login(String userName,String password);
}
