package com.hngsxy.web.controller.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ThreadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.biz.user.impl.UserBizImpl;
/**
 * 用户类控制器
 * @author Administrator
 *
 */
@Controller
//@RequestMapping("/UserController")
public class UserController {
	
	@Autowired
	private UserBizImpl userBizImpl;

	//查询一个用户对象
	@RequestMapping("/findUserOne")
	public String findUserOne(User user,HttpSession session,HttpServletRequest req,HttpServletResponse httpResponse){
//		httpResponse.addHeader("Cache-Control", "no-cache");
//		httpResponse.addHeader("Pragma", "no-cache");
//		httpResponse.addDateHeader("Expires", 0);
		
		//------
		Subject currentUser = SecurityUtils.getSubject();
		if(!currentUser.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(user.getUserCode(),user.getUserPassword());
			//rememberme
			token.setRememberMe(true);

			try {
				//执行登录
				currentUser.login(token);
				//session.setAttribute("isLogin", "1");
				return "backstagemanage/ackstagepage";
			}catch(AuthenticationException ae) {
				req.setAttribute("msg", "登录失败");
			}
			//req.setAttribute("msg", "登录失败");
		}
		

		
		//------

		
		//如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
		String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");

		//根据shiro返回的异常类路径判断，抛出指定异常信息
		if(exceptionClassName!=null){
			if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
				//最终会抛给异常处理器
				//throw new CustomException("账号不存在");
				req.setAttribute("msg", "账号不存在");
				
				return "login";
			} else if (IncorrectCredentialsException.class.getName().equals(
					exceptionClassName)) {
				//throw new CustomException("用户名/密码错误");
				req.setAttribute("msg", "用户名/密码错误");
				
				return "login";
			}else {
				//throw new Exception();//最终在异常处理器生成未知错误
				req.setAttribute("msg", "未知错误");
				//登录失败继续回到登录页面
				return "login";

				
			}
		}

		//return "backstagemanage/backstagepage";
		return "login";
	}
	

	//退出
//	@RequestMapping("/logout")
//	public String loginOut(HttpSession session){
//
//		//session.invalidate();
//		return "redirect:/pages/login.jsp";
//	}
	
	//查看新闻
	@RequestMapping("/goNews")
	public String goNews(Model model){
		return "redirect:/pages/news/newRelease.jsp";
	}

	//查询一个用户对象
	@RequestMapping("/findUserById")
	public @ResponseBody User findUserById(User user){
		User userOne  = null;
		try {
			userOne = userBizImpl.findUserById(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userOne;
		
	}
	
	//修改用户信息
	@RequestMapping("/updateUserInfo")
	public @ResponseBody Integer updateUserInfo(User user) {
		Integer temp = null;
		try {
			temp = userBizImpl.updateUserInfo(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	
}
