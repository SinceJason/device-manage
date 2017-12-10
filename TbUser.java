package pojo;

import java.io.Serializable;

public class TbUser implements Serializable{
	private Integer userId ;
	private String userName;
	private String userPassword;
	private TbRole role;
	private String userFlag;
	
	public TbUser() {}
	
	public TbUser(Integer userId, String userName, String userPassword,
			TbRole role, String userFlag) {
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.role = role;
		this.userFlag = userFlag;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public TbRole getRole() {
		return role;
	}
	public void setRole(TbRole role) {
		this.role = role;
	}
	public String getUserFlag() {
		return userFlag;
	}
	public void setUserFlag(String userFlag) {
		this.userFlag = userFlag;
	}
	
}
