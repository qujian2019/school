package com.hngsxy.web.controller.page;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hngsxy.web.bean.user.ActiveUser;

@Controller
public class PageController {
	//系统首页
	@RequestMapping("/backstagepage")
	public String first(Model model,HttpSession session)throws Exception{
		
		//从shiro的session中取activeUser
		Subject subject = SecurityUtils.getSubject();
		//取身份信息
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		//通过model传到页面
		session.setAttribute("activeUser", activeUser);
		return "redirect:/pages/backstagemanage/backstagepage.jsp";
		
	}
}
