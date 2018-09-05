package com.hngsxy.web.controller.gsxysunshineservice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineService;
import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineServiceNews;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.biz.gsxysunshineservice.GsxySunshineServiceBiz;
import com.hngsxy.web.biz.user.UserBiz;
import com.hngsxy.web.biz.usermanagement.UserManagementBiz;

/**
 * 阳光服务控制器
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping(value = "/SunshineServiceController")
public class SunshineServiceController {

	// 阳光服务
	@Autowired
	private GsxySunshineServiceBiz gsxySunshineServiceBiz;
	// 用户
	@Autowired
	private UserBiz userBiz;
	// 部门
	@Autowired
	private UserManagementBiz userManagementBiz;

	// 查询用户文件夹
	@RequestMapping("/findSunshineServiceNews")
	public void findFileFolder(HttpServletResponse resp, HttpServletRequest req,
			GsxySunshineServiceNews gsxySunshineServiceNews) {
		// System.out.println(fileFolder.getFileFolderName());

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为0
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxySunshineServiceNews> list = null;
		Integer Total = null;
		try {
			list = (ArrayList<GsxySunshineServiceNews>) gsxySunshineServiceBiz
					.findSunshineServiceNews(gsxySunshineServiceNews, index, size);
			Total = gsxySunshineServiceBiz.findSunshineServiceNewsTotal(gsxySunshineServiceNews);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":" + code + ",\"count\":" + Total + ",\"data\":" + array + "}";
		// System.out.println(json.toString());
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
	@RequestMapping("/deleteSunshineServiceNews")
	public @ResponseBody Integer deleteSunshineServiceNews(GsxySunshineServiceNews gsxySunshineService) {
		Integer temp = null;
		try {
			temp = gsxySunshineServiceBiz.deleteSunshineServiceNews(gsxySunshineService);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return temp;

	}

	// 修改阳光新闻时间
	@RequestMapping("/updateNewsReleaseTime")
	public @ResponseBody Integer updateNewsReleaseTime(GsxySunshineServiceNews gsxySunshineService) {
		Integer temp = null;
		try {
			temp = gsxySunshineServiceBiz.updateNewsReleaseTime(gsxySunshineService);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return temp;
	}

	// 添加一条阳光服务新闻
	@RequestMapping("/insertGsxySunshineServiceNews")
	public @ResponseBody Integer insertGsxySunshineServiceNews(GsxySunshineServiceNews gsxySunshineServiceNews) {
		Integer temp = null;

		String carouselPath = null;

		String tempNewsContext = gsxySunshineServiceNews.getNewsContext();
		int index1 = tempNewsContext.indexOf("src=\"");
		// http://172.16.1.83:8080/temp/img/20171129_1511946344429089741.jpg
		// http://localhost:8080/temp/img/20171129_1511946344429089741.jpg

		int index2 = tempNewsContext.indexOf("temp");
		int index3 = tempNewsContext.indexOf(".", index2);

		System.out.println("图片的地址截取钱的地址:" + tempNewsContext);
		if (index1 <= 254 && index3 <= 254 && index1 != -1 && index3 != -1) {
			carouselPath = tempNewsContext.substring(index1 + 5, index3 + 4);
			System.out.println("carouselPath:" + carouselPath);
		}
		if (carouselPath != "" && carouselPath != null) {
			if (carouselPath.indexOf(".mkv") != -1) {
				carouselPath = "";
			}
			// if (carouselPath.indexOf("src=\"") == -1) {
			// carouselPath = "";
			// }
			// if (carouselPath.indexOf(".jpg") == -1) {
			// carouselPath = "";
			// }
			// if (carouselPath.indexOf(".png") == -1) {
			// carouselPath = "";
			// }
			// if (carouselPath.indexOf(".gif") == -1) {
			// carouselPath = "";
			// }
			// if (carouselPath.indexOf("temp") == -1) {
			// carouselPath = "";
			// }
		}

		System.out.println("图片的地址:" + carouselPath);
		System.out.println("NewsAuditStatus:" + gsxySunshineServiceNews.getNewsAuditStatus());
		// news.setCarouselPath(carouselPath);
		gsxySunshineServiceNews.setNewsCarouselPath(carouselPath);

		try {
			User user = new User();
			user.setUserId(gsxySunshineServiceNews.getUserId());
			User user1 = userBiz.findUserById(user);
			gsxySunshineServiceNews.setNewsReleaseUser(user1.getUserCode());
			gsxySunshineServiceNews.setDeptId(user1.getDeptno());
			Dept dept = new Dept();
			dept.setDeptno(user1.getDeptno());
			System.out.println("部门ID:" + user1.getDeptno());
			Dept dept1 = userManagementBiz.findUserIdByDept(dept);
			gsxySunshineServiceNews.setNewsSource(dept1.getDname());

			temp = gsxySunshineServiceBiz.insertGsxySunshineServiceNews(gsxySunshineServiceNews);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 批量删除新闻
	@RequestMapping("/updateGsxySunshineServiceNewsState")
	public @ResponseBody Integer updateGsxySunshineServiceNewsState(String[] newsIds) {
		Integer temp = null;
		try {
			temp = gsxySunshineServiceBiz.updateGsxySunshineServiceNewsState(newsIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询阳光服务信息
	@RequestMapping("/findSunshineServiceHear")
	public void findSunshineServiceHear(HttpServletResponse resp, HttpServletRequest req,
			GsxySunshineService gsxySunshineService) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为0
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxySunshineService> list = null;
		Integer Total = null;
		try {
			list = (ArrayList<GsxySunshineService>) gsxySunshineServiceBiz.findSunshineServiceHear(gsxySunshineService,
					index, size);
			Total = gsxySunshineServiceBiz.findSunshineServiceHearTotal(gsxySunshineService);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":" + code + ",\"count\":" + Total + ",\"data\":" + array + "}";
		// System.out.println(json.toString());
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

	// 删除一个阳光服务
	@RequestMapping("/deleteSunshineServiceOne")
	public @ResponseBody Integer deleteSunshineServiceOne(GsxySunshineService gsxySunshineService) {
		Integer temp = null;
		try {
			temp = gsxySunshineServiceBiz.deleteSunshineServiceOne(gsxySunshineService);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return temp;

	}
	
	// 批量删除阳光服务信息
	@RequestMapping("/deleteSunshineServiceBatch")
	public @ResponseBody Integer deleteSunshineServiceBatch(String[] sunshineIds) {
		Integer temp = null;
		try {
			temp = gsxySunshineServiceBiz.deleteSunshineServiceBatch(sunshineIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	//查询一个阳光服务信息
	@RequestMapping("/findSunshineServiceOne")
	public @ResponseBody GsxySunshineService findSunshineServiceOne(GsxySunshineService gsxySunshineService) {
		GsxySunshineService gss= null;
		try {
			gss =	gsxySunshineServiceBiz.findSunshineServiceOne(gsxySunshineService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gss;
	}
	//阳光服务回文信息
	@RequestMapping("/updatePalindromeInformation")
	public @ResponseBody Integer updatePalindromeInformation(GsxySunshineService gsxySunshineService) {
		Integer temp= null;
		try {
			temp =	gsxySunshineServiceBiz.updatePalindromeInformation(gsxySunshineService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

}
