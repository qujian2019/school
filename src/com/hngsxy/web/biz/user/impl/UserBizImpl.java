package com.hngsxy.web.biz.user.impl;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.user.UserMapper;
import com.hngsxy.web.bean.user.Permission;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.biz.user.UserBiz;


/**
 * 用户实现类
 * @author 屈健
 *
 */
@Service
@Transactional
public class UserBizImpl implements UserBiz{

	@Autowired
	private UserMapper userMapper;
	//查询所有用户
	@Override
	public List<User> findUser() throws Exception {

		return userMapper.findUser();
	}
	//查询一个用户
	@Override
	public User findUserOne(User user) throws Exception {
		return userMapper.findUserOne(user);
	}
	//查询一个用户
	@Override
	public User findUserById(User user) throws Exception {
		return userMapper.findUserById(user);
	}
	
	
	//用户名查询用户
	@Override
	public User findSysUserByUserCode(String userCode) throws Exception {
		
		return userMapper.findSysUserByUserCode(userCode);
	}
	//根据用户ID查询用户菜单
	@Override
	public ArrayList<Permission> findMenuListByUserId(Integer userId) throws Exception {
		return userMapper.findMenuListByUserId(userId);
	}
	//根据用户ID查询用户权限
	@Override
	public ArrayList<Permission> findPermissionListByUserId(Integer userId) throws Exception {
		return userMapper.findPermissionListByUserId(userId);
	}
	//修改用户名或密码
	@Override
	public Integer updateUserInfo(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.updateUserInfo(user);
	}
	//根据用户ID查询用户新闻权限
	@Override
	public ArrayList<Permission> findDepartmentListByUserId(Integer userId) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.findDepartmentListByUserId(userId);
	}
	
	
	
	
	
	

}
