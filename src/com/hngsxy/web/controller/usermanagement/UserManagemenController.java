package com.hngsxy.web.controller.usermanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.bean.usermanagement.GsxyRole;
import com.hngsxy.web.bean.usermanagement.ZtreeOrganiza;
import com.hngsxy.web.biz.user.UserBiz;
import com.hngsxy.web.biz.usermanagement.UserManagementBiz;

@Controller
@RequestMapping(value = "/UserManagemenController")
public class UserManagemenController {
	
	@Autowired
	private UserManagementBiz userManagementBiz;
	@Autowired
	private UserBiz userBiz;
	
	//查询组织架构
	@RequestMapping("/findZtreeOrganiza")
	@RequiresPermissions("management:all")
	public @ResponseBody List<ZtreeOrganiza> findZtreeOrganiza(HttpServletRequest req,HttpServletResponse resp){
		
		List<Dept> list= null;
		List<User> listu= null;
		try {
			 list = userManagementBiz.findDept();
			 listu = userBiz.findUser();
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<ZtreeOrganiza> listZtreeOrganiza = new ArrayList<ZtreeOrganiza>();
		
		//将部门元素给返回list
		for (int i = 0; i < list.size(); i++) {
			ZtreeOrganiza zo = new ZtreeOrganiza();
			
			zo.setId(list.get(i).getDeptno());
			zo.setpId(list.get(i).getpId());
			zo.setName(list.get(i).getDname());
			zo.setShowv(list.get(i).getShowv());

			if(list.get(i).getDeptno().equals("hngszyxy")){
				zo.setOpen(true);
			}else {
				zo.setOpen(false);
			}
			zo.setIsParent(true);
			
			if(list.get(i).getShowv().equals("1")||list.get(i).getShowv().equals("0")){
				listZtreeOrganiza.add(zo);
			}

		}
		
		//将用户元素给返回list
		for (int i = 0; i < listu.size(); i++) {
			ZtreeOrganiza zo = new ZtreeOrganiza();
			
			zo.setId(listu.get(i).getUserId()+"");
			zo.setpId(listu.get(i).getDeptno());
			zo.setName(listu.get(i).getUserCode());
			zo.setShowv(listu.get(i).getShowv());
			listZtreeOrganiza.add(zo);
			
		}
		return listZtreeOrganiza;

	}
	
	//查询部门table
	@RequestMapping("/findDeptTable")
	@RequiresPermissions("management:all")
	public void findDeptTable(HttpServletResponse resp,HttpServletRequest req,Dept dept) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1=Integer.parseInt(page);
		int limit1=Integer.parseInt(limit);

        // 分页开始为0
        int index = (page1 - 1) * limit1;

        int size = limit1;

		// 2. 查询数据
		ArrayList<Dept> deptList = null;
		Integer Total = null;
		try {
			
			deptList= userManagementBiz.findDeptTable(dept, index, size);
			Total = userManagementBiz.findDeptTableTotal(dept);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(deptList);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":"+code+",\"count\":" + Total + ",\"data\":" + array + "}";

		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		pw.print(json);

	}
	
	//查询用户table
	@RequestMapping("/findUserTable")
	@RequiresPermissions("management:all")
	public void findUserTable(HttpServletResponse resp,HttpServletRequest req,User user) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1=Integer.parseInt(page);
		int limit1=Integer.parseInt(limit);

        // 分页开始为0
        int index = (page1 - 1) * limit1;

        int size = limit1;

		// 2. 查询数据
		ArrayList<User> deptList = null;
		Integer Total = null;
		try {
			
			deptList= userManagementBiz.findUserTable(user, index, size);
			Total = userManagementBiz.findUserTableTotal(user);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(deptList);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":"+code+",\"count\":" + Total + ",\"data\":" + array + "}";

		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		pw.print(json);

	}

	//部门新增
	@RequestMapping("/insertDept")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer insertDept(Dept dept) {
		Integer temp = null;
		try {
			temp = userManagementBiz.insertDept(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//修改部门信息
	@RequestMapping("/updateDept")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer updateDept(Dept dept) {
		Integer temp = null;
		try {
			temp = userManagementBiz.updateDept(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	//删除部门(待修改)
	@RequestMapping("/deleteDept")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer deleteDept(Dept dept) {
		Integer temp = null;
		
		try {
			temp = userManagementBiz.selectDeptInUserIfExistence(dept.getDeptno());
			if(temp>0) {
				return 0;
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			temp = userManagementBiz.deleteDept(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//新增用户
	@RequestMapping("/insertUser")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer insertUser(User user) {
		Integer temp = null;

		try {
			temp = userManagementBiz.findUserIfExistence(user.getUserCode());
			if(temp>=1) {
				return 0;
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			temp = userManagementBiz.insertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return temp;
	}
	
	//修改用户姓名
	@RequestMapping("/updateUserCode")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer updateUserCode(User user) {
		Integer temp = null;
		try {
			temp = userManagementBiz.findUserIfExistence(user.getUserCode());
			if(temp>=1) {
				return 0;
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			temp = userManagementBiz.updateUserCode(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//删除用户
	@RequestMapping("/deleteUser")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer deleteUser(User user) {
		Integer temp = null;
		try {
			temp = userManagementBiz.deleteUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	//批量删除用户
	@RequestMapping("/deleteBatchUser")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer deleteBatchUser(String [] userIds) {
		Integer temp = null;
		try {
			temp = userManagementBiz.deleteBatchUser(userIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	//查询所有角色信息 2018.4.1
	@RequestMapping("/findGsxyRole")
	@RequiresPermissions("management:all")
	public @ResponseBody void findGsxyRole(HttpServletRequest req){
		ArrayList<GsxyRole> gsxyRoleList = null;
		try {
			gsxyRoleList = userManagementBiz.findGsxyRole();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//req.setAttribute("msg1", "测试数据1");
		// 
		req.setAttribute("gsxyRoleList", gsxyRoleList);

		//return gsxyRoleList;
	}
	
	//给用户角色
	@RequestMapping("/insertUserRole")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer insertUserRole(String [] gsxyRole,String userId) {
		Integer temp = null;
		
		//可能是一个角色 可能是多个角色
		 if(gsxyRole!=null&&gsxyRole.length>0){ 
			for (int i = 0; i < gsxyRole.length; i++) {
				try {
					if(gsxyRole[i].isEmpty()) {
						return temp;
					}
					temp=userManagementBiz.insertUserRole(userId,gsxyRole[i]);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		 }
		return temp;
	}
	//查询所有部门用于人员调度
	@RequestMapping("/findDeptUserMoveDept")
	public @ResponseBody ArrayList<Dept> findDeptUserMoveDept(){
		ArrayList<Dept> tempList = null;
		try {
			tempList = userManagementBiz.findDeptUserMoveDept();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return tempList;
	}
	//修改人员部门
	@RequestMapping("/updateUserDept")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer updateUserDept(User user){
		Integer temp = null;
		try {
			temp = userManagementBiz.updateUserDept(user);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return temp;
	}
	
	//查询所有角色信息
	@RequestMapping("/findUserGsxyRole")
	@RequiresPermissions("management:all")
	public @ResponseBody ArrayList<GsxyRole> findUserGsxyRole(User user){
		ArrayList<GsxyRole> gsxyRoleList = null;
		try {
			gsxyRoleList = userManagementBiz.findUserGsxyRole(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gsxyRoleList;
	}
	
	//用于角色删除
	@RequestMapping("/deleteGsxyUserRole")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer deleteGsxyUserRole(String userId){
		Integer temp = null;
		try {
			temp = userManagementBiz.deleteGsxyUserRole(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return temp;
	}
	
	//初始化用户密码
	@RequestMapping("/initializationPassword")
	@RequiresPermissions("management:all")
	public @ResponseBody Integer initializationPassword(User user) {
		Integer temp = null;
		try {
			temp = userManagementBiz.initializationPassword(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
		
	}
	
	//初始化用户密码
	@RequestMapping("/findUserIdByDept")
	public @ResponseBody Dept findUserIdByDept(Dept dept) {
		Dept temp = null;
		try {
			temp = userManagementBiz.findUserIdByDept(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
		
	}
	
	//查询部门名称
	@RequestMapping("/findDept")
	public @ResponseBody ArrayList<Dept> findDept(Dept dept) {
		ArrayList<Dept> temp = null;
		try {
			temp  = userManagementBiz.findDept();;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

}
