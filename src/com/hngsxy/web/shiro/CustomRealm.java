package com.hngsxy.web.shiro;


import java.util.ArrayList;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.hngsxy.web.bean.user.ActiveUser;
import com.hngsxy.web.bean.user.Permission;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.bean.usermanagement.GsxyRole;
import com.hngsxy.web.biz.user.impl.UserBizImpl;
import com.hngsxy.web.biz.usermanagement.UserManagementBiz;


public class CustomRealm extends AuthorizingRealm{
	
	
	//注入service
	@Autowired
	private UserBizImpl userBizImpl;
	@Autowired
	private UserManagementBiz userManagementBiz;
	
	
	// 设置realm的名称
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}
	
	//认证方法
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		// token是用户输入的用户名和密码 
		// 第一步从token中取出用户名
		String userCode = (String) token.getPrincipal();

		// 第二步：根据用户输入的userCode从数据库查询
		User sysUser = null;
		
		try {
			sysUser = userBizImpl.findSysUserByUserCode(userCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 如果查询不到返回null
		if(sysUser==null){//
			return null;
		}
		// 从数据库查询到密码
		String password = sysUser.getUserPassword();
		
		//盐
		String salt = sysUser.getSalt();

		// 如果查询到返回认证信息AuthenticationInfo
		
		//activeUser就是用户身份信息
		ActiveUser activeUser = new ActiveUser();
		
		activeUser.setUserId(sysUser.getUserId());
		activeUser.setUserCode(sysUser.getUserCode());
		activeUser.setUserName(sysUser.getUserName());
		activeUser.setDeptno(sysUser.getDeptno());
		//..
		
		//根据用户id取出菜单
		ArrayList<Permission> menus  = null;
		try {
			//通过service取出菜单 
			menus = userBizImpl.findMenuListByUserId(sysUser.getUserId());
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		//将用户菜单 设置到activeUser
		activeUser.setMenus(menus);
		
		//根据用户id取出菜单
		ArrayList<Permission> departments  = null;
		//角色菜单
		ArrayList<GsxyRole> rolemenus = null;
		//部门
		ArrayList<Dept> depts = null;
		
		//取出新闻发布菜单权限
		try {
			departments = userBizImpl.findDepartmentListByUserId(sysUser.getUserId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//放入认证用户中
		activeUser.setDepartments(departments);
		
		//角色菜单
		try {
			rolemenus = userManagementBiz.findGsxyRole();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//放入认证用户中
		activeUser.setRolemenus(rolemenus);
		
		//部门
		try {
			depts = userManagementBiz.findDeptUserMoveDept();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//放入认证用户中
		activeUser.setDepts(depts);
		
		//session 操作
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		//session.start()
		//session.setAttribute("portal.session.id",session.getId());
		
		

		//将activeUser设置simpleAuthenticationInfo
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
				activeUser, password,ByteSource.Util.bytes(salt), this.getName());
		
		return simpleAuthenticationInfo;
		
	}
	
	//授权方法
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		//从 principals获取主身份信息
		//将getPrimaryPrincipal方法返回值转为真实身份类型（在上边的doGetAuthenticationInfo认证通过填充到SimpleAuthenticationInfo中身份类型），
		ActiveUser activeUser =  (ActiveUser) principals.getPrimaryPrincipal();
		
		//根据身份信息获取权限信息
		//从数据库获取到权限数据
		ArrayList<Permission> permissionList = null;
		try {
			permissionList = userBizImpl.findPermissionListByUserId(activeUser.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//单独定一个集合对象 
		ArrayList<String> permissions = new ArrayList<String>();
		if(permissionList!=null){
			for(Permission sysPermission:permissionList){
				//将数据库中的权限标签 符放入集合
				permissions.add(sysPermission.getPermissionPercode());
			}
		}
		
		//查到权限数据，返回授权信息(要包括 上边的permissions)
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		//将上边查询到授权信息填充到simpleAuthorizationInfo对象中
		simpleAuthorizationInfo.addStringPermissions(permissions);

		return simpleAuthorizationInfo;
	}

	//清除缓存
	public void clearCached() {
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
	}

}
