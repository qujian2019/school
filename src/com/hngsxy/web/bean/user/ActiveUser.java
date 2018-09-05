package com.hngsxy.web.bean.user;

import java.util.ArrayList;

import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.bean.usermanagement.GsxyRole;

public class ActiveUser implements java.io.Serializable{
	/**
	 * 认证后的用户模型
	 */
	private static final long serialVersionUID = 1L;
	private Integer userId;//用户id（主键）
	private String userCode;// 用户账号
	private String userName;// 用户名称
	private String deptno;// 用户名称
	private ArrayList<Permission> menus;// 菜单
	private ArrayList<Permission> permissions;// 权限
	private ArrayList<Permission> departments;//部门发布新闻的权限范围
	private ArrayList<GsxyRole> rolemenus;//角色菜单
	private ArrayList<Dept> depts;//角色菜单
	
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public ArrayList<Permission> getMenus() {
		return menus;
	}
	public void setMenus(ArrayList<Permission> menus) {
		this.menus = menus;
	}
	public ArrayList<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(ArrayList<Permission> permissions) {
		this.permissions = permissions;
	}
	public ArrayList<Permission> getDepartments() {
		return departments;
	}
	public void setDepartments(ArrayList<Permission> departments) {
		this.departments = departments;
	}
	
	public ArrayList<GsxyRole> getRolemenus() {
		return rolemenus;
	}
	public void setRolemenus(ArrayList<GsxyRole> rolemenus) {
		this.rolemenus = rolemenus;
	}
	
	public ArrayList<Dept> getDepts() {
		return depts;
	}
	public void setDepts(ArrayList<Dept> depts) {
		this.depts = depts;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
}
