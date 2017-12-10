package pojo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.context.ContextLoaderListener;

public class TbRole implements Serializable{
	private Integer roleId;
	private String roleName;
	private String roleDesc;
	private String roleFlag;
	private Set<TbRight> rights=new HashSet<TbRight>();
	
	public TbRole() {}
	
	public TbRole(Integer roleId, String roleName, String roleDesc,
			String roleFlag) {
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.roleFlag = roleFlag;
	}


	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	public String getRoleFlag() {
		return roleFlag;
	}
	public void setRoleFlag(String roleFlag) {
		this.roleFlag = roleFlag;
	}

	public Set<TbRight> getRights() {
		return rights;
	}

	public void setRights(Set<TbRight> rights) {
		this.rights = rights;
	}

}
