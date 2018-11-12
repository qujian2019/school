package com.hngsxy.web.bean.user;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 * 用户模型
 * @author 屈健
 *
 */
@Component("user")
@Scope("prototype")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer userId;//用户id
	
	private String userName;//用户名称
	
	private String userPassword;//用户密码
	
	private String userGender;//用户性别
	
	private String userCode;//用户账号
	
	private String salt;//盐
	
	private String userAge;//用户年龄
	
	private String userEntryTime;//用户入职时间
	
	private String userLoginTime;//用户登录时间
	
	private String userPermissions;//用户权限
	
	private String locked;//账号是否锁定，1：锁定，0未锁定
	
	private String deptno;//部门id
	
	private String showv;//用于显示页面
	
	private String userPhone;//用户手机号码
	
	private String idCard;//身份证
	
	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
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

	public String getUserAccount() {
		return userCode;
	}

	public void setUserAccount(String userAccount) {
		this.userCode = userAccount;
	}

	public String getUserLoginTime() {
		return userLoginTime;
	}

	public void setUserLoginTime(String userLoginTime) {
		this.userLoginTime = userLoginTime;
	}

	public String getUserPermissions() {
		return userPermissions;
	}

	public void setUserPermissions(String userPermissions) {
		this.userPermissions = userPermissions;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getUserAge() {
		return userAge;
	}

	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}

	public String getUserEntryTime() {
		return userEntryTime;
	}

	public void setUserEntryTime(String userEntryTime) {
		this.userEntryTime = userEntryTime;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getLocked() {
		return locked;
	}

	public void setLocked(String locked) {
		this.locked = locked;
	}

	public String getDeptno() {
		return deptno;
	}

	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}

	public String getShowv() {
		return showv;
	}

	public void setShowv(String showv) {
		this.showv = showv;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
}
