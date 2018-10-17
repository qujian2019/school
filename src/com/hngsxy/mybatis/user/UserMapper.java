package com.hngsxy.mybatis.user;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.hngsxy.web.bean.user.Permission;
import com.hngsxy.web.bean.user.User;

/**
 * 用户DAO
 * @author 屈健
 *
 */
//@MapperScan
@Repository
public interface UserMapper{

	ArrayList<User> findUser()throws Exception;//查询所有用户
	
	User findUserOne(User user)throws Exception;//查询一个用户
	
	User findUserById(User user)throws Exception;//查询一个用户
	
	User findSysUserByUserCode(String userCode)throws Exception;//根据用户名
	
	ArrayList<Permission> findMenuListByUserId(Integer userId)throws Exception;//根据用户ID查询菜单
	
	ArrayList<Permission> findPermissionListByUserId(Integer userId)throws Exception;//根据用户ID查询权限
	
	ArrayList<Permission> findDepartmentListByUserId(Integer userId)throws Exception;//根据用户ID查询新闻权限菜单
	
	Integer updateUserInfo(User user)throws Exception;//用户修改信息
	
	User findMobileUser(@Param("userCode")String userCode,@Param("userPassword")String userPassword)throws Exception;//移动用户
}
