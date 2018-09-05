package com.hngsxy.web.controller.news;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.hngsxy.web.bean.news.News;
import com.hngsxy.web.bean.user.Permission;
import com.hngsxy.web.biz.news.impl.NewsBizImpl;
import com.hngsxy.web.biz.user.impl.UserBizImpl;

@Controller
@RequestMapping(value = "/NewsController")
public class NewsController {

	@Autowired
	private NewsBizImpl newsBizImpl;
	
	@Autowired
	private UserBizImpl userBizImpl;

	// 查询用户文件夹
	@RequestMapping("/findeNews")
	@RequiresPermissions("news:all") // 执行queryItems需要"item:query"权限
	public void findeNews(HttpServletResponse resp, HttpServletRequest req, News news) {
		 
		 int temp01 = 0;
		 int temp02 = 0;
		 StringBuilder temp_ = new StringBuilder();
		// String temp ="";
		//查询用户的新闻权限信息
		ArrayList<Permission> permission= null;
		try {
			permission = userBizImpl.findDepartmentListByUserId(news.getUserId());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		//用户新闻权限过滤
		for (Permission p: permission) {
			//System.out.println(p.getPermissionUrl());
			
			temp01 = p.getPermissionUrl().indexOf("\"");
			
			temp02 = p.getPermissionUrl().indexOf("\"",temp01+1);
			
			p.getPermissionUrl().substring(temp01+1, temp02);
			
			temp_.append(p.getPermissionUrl().substring(temp01+1, temp02)).append(",");
			  
		}
		//删除最后一个多余的,号
		temp_.delete(temp_.length()-1, temp_.length());
		
		String[] temp0 = temp_.toString().split(",");
		//System.out.println(temp0);

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为0
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<News> list = null;
		Integer Total = null;
		try {
			list = newsBizImpl.findNews(news, index, size,temp0);
			Total = newsBizImpl.findNewsTotal(news,temp0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":" + code + ",\"count\":" + Total + ",\"data\":" + array + "}";

		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			pw.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}
	
	// 查询用户文件夹
	@RequestMapping("/findSchoolOfficeAudit")
	@RequiresPermissions("news_audit:all") // 执行queryItems需要"item:query"权限
	public void findSchoolOfficeAudit(HttpServletResponse resp, HttpServletRequest req, News news) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为0
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<News> list = null;
		Integer Total = null;
		try {
			list = newsBizImpl.findSchoolOfficeAudit(news, index, size);
			Total = newsBizImpl.findSchoolOfficeAuditTotal(news);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":" + code + ",\"count\":" + Total + ",\"data\":" + array + "}";

		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			pw.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}
	
	
	

	// 发布一条新闻
	@RequestMapping("/insertNews")
	@RequiresPermissions("news:all") // 执行queryItems需要"item:query"权限
	public @ResponseBody Integer insertNews(News news) {

		String carouselPath = "";

		String tempNewsContext = news.getNewsContext();
		int index1 = tempNewsContext.indexOf("src=\"");

		int index2 = tempNewsContext.indexOf("temp");
		int index3 = tempNewsContext.indexOf(".", index2);

		//System.out.println("图片的地址截取钱的地址:" + tempNewsContext);
		if (index1 <= 254 && index3 <= 254 && index1 != -1 && index3 != -1) {
			carouselPath = tempNewsContext.substring(index1 + 5, index3 + 4);
			//System.out.println("carouselPath:" + carouselPath);
		}
		if (carouselPath != "" && carouselPath!=null) {
			if (carouselPath.indexOf(".mkv") != -1) {
				carouselPath = "";
			}

		}

		//System.out.println("图片的地址:" + carouselPath);
		//System.out.println("NewsAuditStatus:" + news.getNewsAuditStatus());
		// news.setCarouselPath(carouselPath);
		news.setNewsCarouselPath(carouselPath);
		
		Integer id = news.getNewsId();
		Integer temp = null;
		if (id == null) {
			try {
				temp = newsBizImpl.insertNews(news);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;
		} else {
			try {
				temp = newsBizImpl.updateOneNews(news);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;

		}

	}

	// 删除一条新闻
	@RequestMapping("/deleteOneNews")
	@RequiresPermissions("news:all") // 执行queryItems需要"item:query"权限
	public @ResponseBody Integer deleteOneNews(News news) {
		Integer temp = null;
		try {
			temp = newsBizImpl.deleteOneNews(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 删除一个或多个条新闻
	@RequestMapping("/updateNewsState")
	@RequiresPermissions("news:all") // 执行queryItems需要"item:query"权限
	public @ResponseBody Integer updateNewsState(String[] newsIds) {
		Integer temp = null;
		try {
			temp = newsBizImpl.updateNewsState(newsIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 修改新闻时间
	@RequestMapping("/updateNewsTime")
	@RequiresPermissions("news:all") // 执行queryItems需要"item:query"权限
	public @ResponseBody Integer updateNewsTime(News news) {
		Integer temp = null;
		try {
			temp = newsBizImpl.updateNewsTime(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 修改新闻状态 审核
	@RequestMapping("/updateNewsAuditStatus")
	@RequiresPermissions("news:all") // 执行queryItems需要"item:query"权限
	public @ResponseBody Integer updateNewsAuditStatus(News news) {
		Integer temp = null;
		try {
			temp = newsBizImpl.updateNewsAuditStatus(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	// 修改新闻状态 审核
	@RequestMapping("/updateNewsAdvertisement")
	@RequiresPermissions("zsw:all") // 执行queryItems需要"item:query"权限
	public @ResponseBody Integer updateNewsAdvertisement(News news) {
		Integer temp = null;
		try {
			temp = newsBizImpl.updateNewsAdvertisement(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//反审核
	@RequestMapping("/updateNewsAntiAudit")
	@RequiresPermissions("news_audit:all")
	public @ResponseBody Integer updateNewsAntiAudit(News news) {
		Integer temp = null;
		try {
			temp = newsBizImpl.updateNewsAntiAudit(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	

}
