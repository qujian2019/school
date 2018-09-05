package com.hngsxy.web.bean.usermanagement;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("gsxyRole")
@Scope("prototype")
public class GsxyRole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer roleId;//角色id
	private String roleName;//角色名
	private String available;//角色是否可用
	
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
	public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
