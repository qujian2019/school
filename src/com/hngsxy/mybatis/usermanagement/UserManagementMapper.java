package com.hngsxy.mybatis.usermanagement;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.bean.usermanagement.GsxyRole;

/**
 * 部门DAO
 * @author 屈健
 *
 */
@Repository
public interface UserManagementMapper{

	ArrayList<Dept> findDept()throws Exception;//查询所有部门
	
	ArrayList<Dept> findDeptTable(Map<String, Object> condtion)throws Exception;//查询所有部门用于table
	
	Integer findDeptTableTotal(Map<String, Object> condtion)throws Exception;//查询所有部门用于table总数
	
	Integer insertDept(Dept dept)throws Exception;//新增部门
	
	Integer updateDept(Dept dept)throws Exception;//修改部门信息
	
	Integer deleteDept(Dept dept)throws Exception;//删除部门信息
	
	ArrayList<User> findUserTable(Map<String, Object> condtion)throws Exception;//查询所有用户table
	
	Integer findUserTableTotal(Map<String, Object> condtion)throws Exception;//查询所有部门用于table总数
	
	Integer insertUser(User user)throws Exception;//新增用户
	
	Integer findUserIfExistence(String userCode)throws Exception;//查询用户是否存在
	
	Integer updateUserCode(User user)throws Exception;//修改用户姓名
	
	Integer deleteUser(User user)throws Exception;//删除用户
	
	Integer deleteBatchUser (@Param("userIds") String[] userIds)throws Exception;//批量删除用户
	
	Integer selectDeptInUserIfExistence(String deptno)throws Exception;//查询部门下是否还存在员工
	
	ArrayList<GsxyRole> findGsxyRole()throws Exception;//查询所有角色信息
	
	Integer insertUserRole(Map<String, Object> condtion) throws Exception;//给用户添加角色
	
	ArrayList<Dept> findDeptUserMoveDept()throws Exception;//查询所有部门用于人员调度
	
	Integer updateUserDept(User user)throws Exception;//修改人员部门
	
	ArrayList<GsxyRole> findUserGsxyRole(User user)throws Exception;//查询用户角色
	
	Integer deleteGsxyUserRole(String userId)throws Exception;//删除角色
	
	Dept findUserIdByDept(Dept dept)throws Exception;//用户部门
	
	Integer initializationPassword(User user)throws Exception;//初始化密码
}
