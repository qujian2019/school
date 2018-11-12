package com.hngsxy.web.biz.usermanagement.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.usermanagement.UserManagementMapper;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.bean.usermanagement.GsxyRole;

import com.hngsxy.web.biz.usermanagement.UserManagementBiz;
/**
 * 用户管理实现类
 * @author 屈健
 *
 */
@Service
@Transactional
public class UserManagementBizImpl implements UserManagementBiz{

	@Autowired
	private UserManagementMapper userManagementMapper;
		
	//查询所有部门
	@Override
	public ArrayList<Dept> findDept() throws Exception {
		return userManagementMapper.findDept();
	}
	//查询所有部门用于table
	@Override
	public ArrayList<Dept> findDeptTable(Dept dept,int page, int limit) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("deptno",dept.getDeptno());
	        condtion.put("dname",dept.getDname());
	        condtion.put("limit", limit);
	        condtion.put("page", page);
		
	        ArrayList<Dept> arr = userManagementMapper.findDeptTable(condtion);
	        
		return arr;
	}
	//查询所有部门用于table总数
	@Override
	public Integer findDeptTableTotal(Dept dept) throws Exception {
		 Map<String, Object> condtion = new HashMap<String, Object>();
		 	condtion.put("deptno",dept.getDeptno());
		 	condtion.put("dname",dept.getDname());
		Integer temp = userManagementMapper.findDeptTableTotal(condtion);
		return temp;
	}
	//新增部门
	
	public Integer insertDept(Dept dept) throws Exception {
		Integer temp = userManagementMapper.insertDept(dept);
		return temp;
	}
	//修改部门信息
	
	public Integer updateDept(Dept dept) throws Exception {
		Integer temp = userManagementMapper.updateDept(dept);
		return temp;
	}
	//删除部门
	
	public Integer deleteDept(Dept dept) throws Exception {
		Integer temp = userManagementMapper.deleteDept(dept);
		return temp;
	}
	//用户Usertable
	
	public ArrayList<User> findUserTable(User user,int page, int limit) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("deptno",user.getDeptno());
	        condtion.put("userCode",user.getUserCode());
	        condtion.put("userName",user.getUserName());
	        condtion.put("idCard",user.getIdCard());
	        condtion.put("limit", limit);
	        condtion.put("page", page);
	        ArrayList<User> arr = userManagementMapper.findUserTable(condtion);
	        
		return arr;
	}
	//用户UsertableTotal
	@Override
	public Integer findUserTableTotal(User user) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("deptno",user.getDeptno());
	        condtion.put("userCode",user.getUserCode());
	        condtion.put("userName",user.getUserName());
	        condtion.put("idCard",user.getIdCard());
	        Integer temp  = userManagementMapper.findUserTableTotal(condtion);
		return temp;
	}
	//新增用户
	@Override
	public Integer insertUser(User user) throws Exception {
		Integer temp = userManagementMapper.insertUser(user);
		return temp;
	}
	//查询用户是否被占用
	@Override
	public Integer findUserIfExistence(String userCode) throws Exception {
		Integer temp = userManagementMapper.findUserIfExistence(userCode);
		return temp;
	}
	//修改用户姓名
	@Override
	public Integer updateUserCode(User user) throws Exception {
		Integer temp = userManagementMapper.updateUserCode(user);
		return temp;
	}
	//删除用户
	@Override
	public Integer deleteUser(User user) throws Exception {
		Integer temp = userManagementMapper.deleteUser(user);
		return temp;
	}
	//批量删除用户
	@Override
	public Integer deleteBatchUser(String[] userIds) throws Exception {
		Integer temp = userManagementMapper.deleteBatchUser(userIds);
		return temp;
	}
	//查询要删除的部门下有多少员工
	@Override
	public Integer selectDeptInUserIfExistence(String deptno) throws Exception {
		Integer temp = userManagementMapper.selectDeptInUserIfExistence(deptno);
		return temp;
	}
	//查询所有角色信息
	@Override
	public ArrayList<GsxyRole> findGsxyRole() throws Exception {
		ArrayList<GsxyRole> gsxyRoleList =userManagementMapper.findGsxyRole();
		return gsxyRoleList;
	}
	//给用户角色
	@Override
	public Integer insertUserRole(String userId,String roleId) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",userId);
	        condtion.put("roleId",roleId);
	        
		Integer temp = userManagementMapper.insertUserRole(condtion);
		return temp;
	}
	//查询所有部门用于人员调度
	@Override
	public ArrayList<Dept> findDeptUserMoveDept() throws Exception {
		ArrayList<Dept> tempList = userManagementMapper.findDeptUserMoveDept();
		return tempList;
	}
	//修改人员部门
	@Override
	public Integer updateUserDept(User user) throws Exception {
		Integer temp = userManagementMapper.updateUserDept(user);
		return temp;
	}
	//查询用户角色
	@Override
	public ArrayList<GsxyRole> findUserGsxyRole(User user) throws Exception {
		ArrayList<GsxyRole> tempList = userManagementMapper.findUserGsxyRole(user);
		return tempList;
	}
	//删除角色
	@Override
	public Integer deleteGsxyUserRole(String userId) throws Exception {
		Integer temp =userManagementMapper.deleteGsxyUserRole(userId);
		return temp;
	}
	//用过用户ID查询部门
	@Override
	public Dept findUserIdByDept(Dept dept) throws Exception {
		return userManagementMapper.findUserIdByDept(dept);
	}
	//初始化用户密码
	@Override
	public Integer initializationPassword(User user) throws Exception {
		return userManagementMapper.initializationPassword(user);
	}

	
	
	
}
