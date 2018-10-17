package com.hngsxy.web.biz.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hngsxy.web.bean.user.Permission;
import com.hngsxy.web.bean.user.User;

/**
 * 用户biz
 * @author 屈健
 *
 */
@Service
//@Transactional
public interface UserBiz {
	
	List<User> findUser()throws Exception;//查询所有用户
	
	User findUserOne(User user)throws Exception;//查询一个用户
	
	User findUserById(User user)throws Exception;//查询一个用户

	User findSysUserByUserCode(String userCode) throws Exception;
	
	List<Permission> findMenuListByUserId(Integer userId)throws Exception;//根据用户ID查询菜单
	
	List<Permission> findPermissionListByUserId(Integer userId)throws Exception;//根据用户ID查询权限
	
	ArrayList<Permission> findDepartmentListByUserId(Integer userId)throws Exception;//根据用户ID查询新闻权限菜单
	
	Integer updateUserInfo(User user)throws Exception;//用户修改信息
	
	User findMobileUser(String userCode,String userPassword)throws Exception;//移动用户
	
	
}
