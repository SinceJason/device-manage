package pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class TbRight implements Serializable{
	private String rightCode;
	private String rightParent_code;
	private String rightType;
	private String rightText;
	private String rightUrl;
	private String rightTip;
	private Set<TbRole> roles=new HashSet<TbRole>();
	
	public TbRight() {}
	public TbRight(String rightCode, String rightType, String rightText,
			String rightUrl, String rightTip) {
		this.rightCode = rightCode;
		this.rightType = rightType;
		this.rightText = rightText;
		this.rightUrl = rightUrl;
		this.rightTip = rightTip;
	}
	public String getRightCode() {
		return rightCode;
	}
	public void setRightCode(String rightCode) {
		this.rightCode = rightCode;
	}
	public String getRightParent_code() {
		return rightParent_code;
	}
	public void setRightParent_code(String rightParent_code) {
		this.rightParent_code = rightParent_code;
	}
	public String getRightType() {
		return rightType;
	}
	public void setRightType(String rightType) {
		this.rightType = rightType;
	}
	public String getRightText() {
		return rightText;
	}
	public void setRightText(String rightText) {
		this.rightText = rightText;
	}
	public String getRightUrl() {
		return rightUrl;
	}
	public void setRightUrl(String rightUrl) {
		this.rightUrl = rightUrl;
	}
	public String getRightTip() {
		return rightTip;
	}
	public void setRightTip(String rightTip) {
		this.rightTip = rightTip;
	}
	public Set<TbRole> getRoles() {
		return roles;
	}
	public void setRoles(Set<TbRole> roles) {
		this.roles = roles;
	}
}
