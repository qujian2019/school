package com.hngsxy.web.controller.anon;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.hngsxy.utils.IdAndTimeCreateUtil;
import com.hngsxy.utils.RegexUtils;
import com.hngsxy.web.bean.Student.Student;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxyEnglishExaminationTable;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxySemester;
import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineService;
import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineServiceNews;
import com.hngsxy.web.bean.gsxywskximg.GsxyWskxImg;
import com.hngsxy.web.bean.news.News;
import com.hngsxy.web.bean.user.ActiveUser;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.bean.zs.GsxyFactions;
import com.hngsxy.web.bean.zs.GsxyZsMajorTable;
import com.hngsxy.web.bean.zs.ZhenShu;
import com.hngsxy.web.biz.englishtest.EnglishTestBiz;
import com.hngsxy.web.biz.gsxysunshineservice.GsxySunshineServiceBiz;
import com.hngsxy.web.biz.gsxywskximg.impl.GsxyWskxImgBizImpl;
import com.hngsxy.web.biz.news.impl.NewsBizImpl;
import com.hngsxy.web.biz.student.StudentBiz;
import com.hngsxy.web.biz.user.UserBiz;
import com.hngsxy.web.biz.zs.ZheShuBiz;

/**
 * 这个类的内容不受权限 公开
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping("/anon")
public class Anon {

	@Autowired
	private NewsBizImpl newsBizImpl;

	@Autowired
	private StudentBiz studentBiz;

	@Autowired
	private GsxySunshineServiceBiz gsxySunshineServiceBiz;

	@Autowired
	private GsxyWskxImgBizImpl gsxyWskxImgBizImpl;

	@Autowired
	private ZheShuBiz zheShuBiz;

	@Autowired
	private EnglishTestBiz englishTestBiz;
	
	@Autowired
	private UserBiz userBiz;

	// 查询一个新闻对象
	@RequestMapping("/selectNewsTypeIs0")
	public @ResponseBody ArrayList<News> selectNewsTypeIs0(HttpServletRequest req, HttpServletResponse resp,
			News news) {

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.selectNewsTypeIs0(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	// 查询一个新闻对象
	@RequestMapping("/selectNewsTypeIs")
	public @ResponseBody void selectNewsTypeIs(HttpServletRequest req, HttpServletResponse resp, News news) {

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.selectNewsTypeIs(news);

			//
			String temp01 = IdAndTimeCreateUtil.getTime();
			// 当前时间 并 转化成了数字
			int a = Integer.parseInt(temp01);
			String temp02 = "";
			int b;
			String c = "";

			for (News news2 : list) {

				temp02 = news2.getNewsReleaseTime().substring(0, 10);
				c = temp02.replace("-", "");
				b = Integer.parseInt(c);

				if (7 > a - b || 70 == a - b || 71 == a - b || 72 == a - b || 73 == a - b || 74 == a - b || 75 == a - b
						|| 76 == a - b) {
					// 信息还在7天之内
					news2.setNewsNew("1");
				} else {
					news2.setNewsNew("0");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		String json = "{\"list\":" + array + "}";

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

	// 查询一个新闻对象图片
	@RequestMapping("/selectNewsTypeIsImg")
	public @ResponseBody List<News> selectNewsTypeIsImg(News news, HttpServletRequest request) {

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.selectNewsTypeIs(news);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 查询一个新闻对象 并 统计新闻访问量
	@RequestMapping("/updateNewsVisitConut")
	public @ResponseBody Integer updateNewsVisitConut(News news) {
		Integer temp = null;
		try {
			News newsOne = newsBizImpl.selectOneNews(news);
			Integer temp0 = newsOne.getNewsVisitConut();
			if (temp0 == null) {
				temp0 = 1;
			} else {
				temp0++;
			}
			newsOne.setNewsVisitConut(temp0);
			temp = newsBizImpl.updateNewsVisitConut(newsOne);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询一个新闻对象
	@RequestMapping("/selectOneNews")
	public @ResponseBody News selectOneNews(News news, HttpServletRequest request) {
		News newsOne = null;
		try {
			newsOne = newsBizImpl.selectOneNews(news);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 获取当前端口 现在是 80
		// int port = request.getLocalPort();

		// News temp = IdAndTimeCreateUtil.replacePortNews(newsOne, port);

		return newsOne;
	}

	// 查询一个新闻对象
	@RequestMapping("/findUserDept")
	public @ResponseBody Dept findUserDept(User user) {
		Dept newsOne = null;
		try {
			newsOne = newsBizImpl.findUserDept(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newsOne;
	}

	// 在线报名上次学生照片 需要的地址
	// http://localhost:8080/temp/img/def3adbad0f64f91aa0ffbfc8ecb819f_53232.png
	@RequestMapping(value = "/studentUploadPhotos", method = { RequestMethod.POST })
	public @ResponseBody Map<String, String> studentUploadPhotos(@RequestParam("myfile") MultipartFile myfile,
			HttpServletRequest request, HttpServletResponse response) {

		// 文件名
		String originalFilename = null;

		if (myfile.isEmpty()) {
			return null;
		} else {
			originalFilename = myfile.getOriginalFilename();
			System.out.println("文件原名: " + originalFilename);
			System.out.println("文件名称: " + myfile.getName());
			System.out.println("文件长度: " + myfile.getSize());
			System.out.println("文件类型: " + myfile.getContentType());
			System.out.println("========================================");
		}
		// 图片名 加了UUID处理
		String savename = IdAndTimeCreateUtil.getUUID() + "_" + originalFilename;

		// 拼接文件名
		File destFile = new File("E:" + File.separator + "Program Files" + File.separator + "apache-tomcat-8.5.20"
				+ File.separator + "webapps" + File.separator + "temp" + File.separator + "img", savename);

		// 写入
		try {
			String courseFile = destFile.getCanonicalPath();
			/*
			 * 5. 保存
			 */
			System.out.println("保存路径:" + courseFile);

			FileUtils.copyInputStreamToFile(myfile.getInputStream(), destFile);
		} catch (IOException e) {
			System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
			e.printStackTrace();
			return null;
		}
		// 创建map 接受结果 D:\Program
		// Files\apache-tomcat-8.5.20\webapps\temp\img\def3adbad0f64f91aa0ffbfc8ecb819f_53232.png
		Map<String, String> map = new HashMap<String, String>();
		String temp01 = request.getScheme();// 协议名
		// http:\localhost:8080\temp\img\def3adbad0f64f91aa0ffbfc8ecb819f_53232.png
		// http://www.hngsxy.com:80/temp/img/1ebdfaeb076f44caafad7ecd7be21441_zyimg10.jpg
		String temp02 = request.getServerName();// 服务器名
		// int temp03 = request.getServerPort();// 端口号
		String path = temp01 + "://" + temp02 + "/" + "temp/img/";
		System.out.println("图片路径:" + path + savename);
		map.put("studentTuPian", path + savename);

		return map;

	}

	// 添加一个报名的学生
	@RequestMapping(value = "/insertOnlineRegistration")
	public @ResponseBody Integer insertOnlineRegistration(Student s) {
		Integer temp = null;

		if (StringUtils.isBlank(s.getStudentName()) || StringUtils.isBlank(s.getSex())
				|| StringUtils.isBlank(s.getStudentPlace())) {
			return 0;
		}

		try {
			temp = studentBiz.insertOnlineRegistration(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询一个毕业的学生
	@RequestMapping(value = "/findOneGraduate")
	public @ResponseBody Student findOneGraduate(Student s) {

		Student temp = null;
		try {
			temp = studentBiz.findOneGraduate(s);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return temp;
	}

	// 查询一个毕业的学生
	@RequestMapping(value = "/findStudentByIdCardAndStudentName")
	public @ResponseBody Student findStudentByIdCardAndStudentName(Student s) {

		Student temp = null;

		// 如果什么都没输入就不查询
		if (StringUtils.isBlank(s.getStudentName()) && StringUtils.isBlank(s.getExamineeNumber())) {
			return null;
		}

		String studentName = s.getStudentName().trim();
		String examineeNumber = s.getExamineeNumber().trim();
		s.setStudentName(studentName);
		s.setExamineeNumber(examineeNumber);

		try {
			temp = studentBiz.findStudentByIdCardAndStudentName(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询一个报名审核通过学生
	@RequestMapping(value = "/findStudentRegister")
	public @ResponseBody Student findStudentRegister(Student s) {

		Student temp = null;
		try {
			temp = studentBiz.findStudentRegister(s);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return temp;
	}

	// --------------------------------阳光服务Controller
	// 添加一条阳光服务信息
	@RequestMapping(value = "/insertGsxySunshineService")
	public @ResponseBody Integer insertGsxySunshineService(GsxySunshineService g) {
		Integer temp = null;
		// StringUtils.isBlank()
		if (StringUtils.isBlank(g.getSunshineName()) || StringUtils.isBlank(g.getSunshineName())
				|| StringUtils.isBlank(g.getSunshinePhone()) || StringUtils.isBlank(g.getSunshineServiceType())
				|| StringUtils.isBlank(g.getSunshineTitle()) || StringUtils.isBlank(g.getSunshineContent())) {
			return 0;
		}

		g.getSunshineName().trim();

		try {
			temp = gsxySunshineServiceBiz.insertGsxySunshineService(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询一条阳光新闻信息
	@RequestMapping(value = "/findGsxySunshineServiceNewsOne")
	public @ResponseBody GsxySunshineServiceNews findGsxySunshineServiceNewsOne(GsxySunshineServiceNews g,
			HttpServletRequest request) {
		GsxySunshineServiceNews temp = null;
		try {
			temp = gsxySunshineServiceBiz.findGsxySunshineServiceNewsOne(g);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int port = request.getLocalPort();

		GsxySunshineServiceNews news = IdAndTimeCreateUtil.replacePortGsxySunshineServiceNews(temp, port);

		return news;
	}

	// 根据阳光新闻类型查询新闻
	@RequestMapping(value = "/findGsxySunshineServiceNewsTypeIs")
	public void findGsxySunshineServiceNewsTypeIs(HttpServletRequest req, HttpServletResponse resp,
			GsxySunshineServiceNews g) {
		ArrayList<GsxySunshineServiceNews> temp = null;
		try {
			temp = gsxySunshineServiceBiz.findGsxySunshineServiceNewsTypeIs(g);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(temp);

		String json = "{\"list\":" + array + "}";

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

	// 查询一个新闻对象图片
	@RequestMapping("/selectGsxySunshineServiceTypeIsImg")
	public @ResponseBody List<GsxySunshineServiceNews> selectGsxySunshineServiceTypeIsImg(GsxySunshineServiceNews g,
			HttpServletRequest request) {

		// 发送的是UTF-8
		// resp.setContentType("text/html;charset=utf-8");

		ArrayList<GsxySunshineServiceNews> list = null;
		try {
			list = gsxySunshineServiceBiz.findGsxySunshineServiceNewsTypeIs(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 还是线判断端口还
		// int port = request.getLocalPort();
		// int temp01 = 0;
		// String temp02 = "";
		// if (port == 80) {
		// } else {
		// for (GsxySunshineServiceNews news1 : list) {
		// temp01 = news1.getNewsCarouselPath().indexOf("124.228.83.236");
		// if (temp01 == -1) {
		// } else {
		// temp02 = news1.getNewsCarouselPath().replace("124.228.83.236",
		// "124.228.83.236:" + port);
		// news1.setNewsCarouselPath(temp02);
		// }
		// }
		// }

		return list;

	}

	// 查询一个新闻对象图片
	@RequestMapping("/selectGsxySunshineServiceNewsTypeIs0")
	public @ResponseBody List<GsxySunshineServiceNews> selectGsxySunshineServiceTypeIs0(GsxySunshineServiceNews g) {

		// 发送的是UTF-8
		// resp.setContentType("text/html;charset=utf-8");

		ArrayList<GsxySunshineServiceNews> list = null;
		try {
			list = gsxySunshineServiceBiz.selectGsxySunshineServiceNewsTypeIs0(g);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	// 通过阳光服务编号 查询阳光服务
	@RequestMapping("/findSunshineServiceBySunshineNumber")
	public @ResponseBody GsxySunshineService findSunshineServiceBySunshineNumber(
			GsxySunshineService gsxySunshineService) {
		GsxySunshineService temp = null;
		try {
			temp = gsxySunshineServiceBiz.findSunshineServiceBySunshineNumber(gsxySunshineService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 给用户完结阳光服务
	@RequestMapping("/updateSunshineStateBySunshineEnd")
	public @ResponseBody Integer updateSunshineStateBySunshineEnd(GsxySunshineService gsxySunshineService) {
		Integer temp = null;
		try {
			temp = gsxySunshineServiceBiz.updateSunshineStateBySunshineEnd(gsxySunshineService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;

	}

	// 给用户完结阳光服务
	@RequestMapping("/selectSunshineServiceByPublish")
	public void selectSunshineServiceByPublish(HttpServletResponse resp) {
		ArrayList<GsxySunshineService> temp = null;
		try {
			temp = gsxySunshineServiceBiz.selectSunshineServiceByPublish();
		} catch (Exception e) {

			e.printStackTrace();
		}
		String array = JSON.toJSONString(temp);

		String json = "{\"list\":" + array + "}";

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

	@RequestMapping("/selectSunshineServiceByPublish1")
	public @ResponseBody ArrayList<GsxySunshineService> selectSunshineServiceByPublish1(HttpServletResponse resp) {
		ArrayList<GsxySunshineService> temp = null;
		try {
			temp = gsxySunshineServiceBiz.selectSunshineServiceByPublish();
		} catch (Exception e) {

			e.printStackTrace();
		}

		// for(ArrayList<GsxySunshineService> t :temp) {
		//
		// }

		return temp;
	}

	// --------------------------------阳光服务Controller

	// --------------------------------学院官网新首页

	// 首页学院新闻
	@RequestMapping("/findlunBoTuXinWenNews")
	public @ResponseBody void lunBoTuXinWenNews(HttpServletResponse resp) {

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.findlunBoTuXinWenNews();
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		String temp01 = IdAndTimeCreateUtil.getTime();
		// 当前时间 并 转化成了数字
		int a = Integer.parseInt(temp01);
		String temp02 = "";
		int b;
		String c = "";

		for (News news2 : list) {

			temp02 = news2.getNewsReleaseTime().substring(0, 10);
			c = temp02.replace("-", "");
			b = Integer.parseInt(c);

			if (7 > a - b || 70 == a - b || 71 == a - b || 72 == a - b || 73 == a - b || 74 == a - b || 75 == a - b
					|| 76 == a - b) {
				// 信息还在7天之内
				news2.setNewsNew("1");
			} else {
				news2.setNewsNew("0");
			}
		}

		String array = JSON.toJSONString(list);

		String json = "{\"list\":" + array + "}";

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

	// 首页学院新闻+
	@RequestMapping("/findlunBoTuXinWenNewsJia")
	public @ResponseBody ArrayList<News> findlunBoTuXinWenNewsJia(HttpServletResponse resp) {
		ArrayList<News> temp = null;
		try {
			temp = newsBizImpl.findlunBoTuXinWenNewsJia();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 首页轮播通知公告
	@RequestMapping(value = { "/findTongZhiGongGao" }, method = { RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody ArrayList<News> findTongZhiGongGao(HttpServletResponse resp, HttpServletRequest request) {

		// 跨域
		// String toPath = request.getHeader("Origin");

		// 1.IP地址
		// resp.setHeader("Access-control-Allow-Origin",toPath);
		// resp.setHeader("Access-Control-Allow-Methods", "GET,POST");
		// resp.setHeader("Access-Control-Allow-Credentials", "true");
		// resp.setHeader("Access-Control-Allow-Headers","origin,
		// content-type,accept,x-requested-with,ticket");

		ArrayList<News> temp = null;
		try {
			temp = newsBizImpl.findTongZhiGongGao();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 首页轮播通知公告+
	@RequestMapping("/findTongZhiGongGaoJia")
	public @ResponseBody ArrayList<News> findTongZhiGongGaoJia() {
		ArrayList<News> temp = null;
		try {
			temp = newsBizImpl.findTongZhiGongGaoJia();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 首页轮播通知公告
	@RequestMapping("/findRenShiXinXi")
	public @ResponseBody void findRenShiXinXi(HttpServletResponse resp) {
		// 发送的是UTF-8
		// resp.setContentType("text/html;charset=utf-8");

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.findRenShiXinXi();
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		String temp01 = IdAndTimeCreateUtil.getTime();
		// 当前时间 并 转化成了数字
		int a = Integer.parseInt(temp01);
		String temp02 = "";
		int b;
		String c = "";

		for (News news2 : list) {

			temp02 = news2.getNewsReleaseTime().substring(0, 10);
			c = temp02.replace("-", "");
			b = Integer.parseInt(c);

			if (7 > a - b || 70 == a - b || 71 == a - b || 72 == a - b || 73 == a - b || 74 == a - b || 75 == a - b
					|| 76 == a - b) {
				// 信息还在7天之内
				news2.setNewsNew("1");
			} else {
				news2.setNewsNew("0");
			}
		}

		String array = JSON.toJSONString(list);

		String json = "{\"list\":" + array + "}";

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

	// 首页轮播通知公告+
	@RequestMapping("/findRenShiXinXiJia")
	public @ResponseBody ArrayList<News> findRenShiXinXiJia() {
		ArrayList<News> temp = null;
		try {
			temp = newsBizImpl.findRenShiXinXiJia();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 首页轮播通知公告
	@RequestMapping("/findZhaoshenxinxi")
	public @ResponseBody void findZhaoshenxinxi(HttpServletResponse resp) {
		// 发送的是UTF-8
		// resp.setContentType("text/html;charset=utf-8");

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.findZhaoshenxinxi();
		} catch (Exception e) {
			e.printStackTrace();
		}

		//
		String temp01 = IdAndTimeCreateUtil.getTime();
		// 当前时间 并 转化成了数字
		int a = Integer.parseInt(temp01);
		String temp02 = "";
		int b;
		String c = "";

		for (News news2 : list) {

			temp02 = news2.getNewsReleaseTime().substring(0, 10);
			c = temp02.replace("-", "");
			b = Integer.parseInt(c);

			if (7 > a - b || 70 == a - b || 71 == a - b || 72 == a - b || 73 == a - b || 74 == a - b || 75 == a - b
					|| 76 == a - b) {
				// 信息还在7天之内
				news2.setNewsNew("1");
			} else {
				news2.setNewsNew("0");
			}
		}

		String array = JSON.toJSONString(list);

		String json = "{\"list\":" + array + "}";

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

	// 首页轮播通知公告+
	@RequestMapping("/findZhaoshenxinxiJia")
	public @ResponseBody ArrayList<News> findZhaoshenxinxiJia() {
		ArrayList<News> temp = null;
		try {
			temp = newsBizImpl.findZhaoshenxinxiJia();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// --------------------------------学院官网新首页

	// ---------------------------------招生网借口
	// 招生网轮播通知公告
	@RequestMapping("/findZSWTongZhiGongGao")
	public @ResponseBody ArrayList<News> findZSWTongZhiGongGao() {
		ArrayList<News> temp = null;
		try {
			temp = newsBizImpl.findZSWTongZhiGongGao();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 招生网轮播通知公告
	@RequestMapping("/findAdvertisement")
	public @ResponseBody News findAdvertisement() {
		News temp = null;
		try {
			temp = newsBizImpl.findAdvertisement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// ---------------------------------招生网借口

	// 查询新闻可以用新闻的newType 一个或多个
	@RequestMapping("/findNewsTypes")
	public @ResponseBody void findNewsTypes(HttpServletRequest req, HttpServletResponse resp, String[] newTypes) {

		// 发送的是UTF-8
		// resp.setContentType("text/html;charset=utf-8");

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.findNewsTypes(newTypes);

			//
			String temp01 = IdAndTimeCreateUtil.getTime();
			// 当前时间 并 转化成了数字
			int a = Integer.parseInt(temp01);
			String temp02 = "";
			int b;
			String c = "";

			for (News news2 : list) {

				temp02 = news2.getNewsReleaseTime().substring(0, 10);
				c = temp02.replace("-", "");
				b = Integer.parseInt(c);

				if (7 > a - b || 70 == a - b || 71 == a - b || 72 == a - b || 73 == a - b || 74 == a - b || 75 == a - b
						|| 76 == a - b) {
					// 信息还在7天之内
					news2.setNewsNew("1");
				} else {
					news2.setNewsNew("0");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		String json = "{\"list\":" + array + "}";

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

	// 查询新闻可以用新闻的newType 一个或多个2
	@RequestMapping("/findNewsTypes2")
	public @ResponseBody ArrayList<News> findNewsTypes2(HttpServletRequest req, HttpServletResponse resp,
			String[] newTypes) {
		ArrayList<News> temp = null;
		try {
			temp = newsBizImpl.findNewsTypes2(newTypes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询一个新闻对象
	@RequestMapping("/selectMTBD")
	public @ResponseBody void selectMTBD(HttpServletRequest req, HttpServletResponse resp, News news) {

		ArrayList<News> list = null;
		try {
			list = newsBizImpl.selectMTBD(news);

			//
			String temp01 = IdAndTimeCreateUtil.getTime();
			// 当前时间 并 转化成了数字
			int a = Integer.parseInt(temp01);
			String temp02 = "";
			int b;
			String c = "";

			for (News news2 : list) {

				temp02 = news2.getNewsReleaseTime().substring(0, 10);
				c = temp02.replace("-", "");
				b = Integer.parseInt(c);

				if (7 > a - b || 70 == a - b || 71 == a - b || 72 == a - b || 73 == a - b || 74 == a - b || 75 == a - b
						|| 76 == a - b) {
					// 信息还在7天之内
					news2.setNewsNew("1");
				} else {
					news2.setNewsNew("0");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		for (News n : list) {
			if (n.getNewsHyperlink() == null || n.getNewsHyperlink() == "") {
				n.setNewsHyperlink("1");
			}
		}

		String array = JSON.toJSONString(list);

		String json = "{\"list\":" + array + "}";

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

	// 根据图片类型查询信息_网上看校
	@RequestMapping("/findGsxyWskxImgByType")
	public @ResponseBody ArrayList<GsxyWskxImg> findGsxyWskxImgByType(GsxyWskxImg gsxyWskxImg) {
		ArrayList<GsxyWskxImg> temp = null;
		try {
			temp = gsxyWskxImgBizImpl.findGsxyWskxImgByType(gsxyWskxImg);
		} catch (Exception e) {

			e.printStackTrace();
		}
		int curr = 1;
		// 添加角标curr
		for (GsxyWskxImg g : temp) {
			g.setWskximgCurr(curr);
			curr++;
		}

		return temp;

	}

	// 查询证书信息
	@RequestMapping(value = "/selectZS")
	public @ResponseBody ZhenShu selectZS(ZhenShu zheShu) {
		ZhenShu temp = null;
		try {
			temp = zheShuBiz.selectZS(zheShu);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return temp;
	}

	// 英语三级考试图片上传
	@RequestMapping(value = "/englishTestPhotos", method = { RequestMethod.POST })
	public @ResponseBody synchronized Map<String, String> englishTestPhotos(@RequestParam("myfile") MultipartFile myfile,
			HttpServletRequest request, HttpServletResponse response, String idcard, String textState) {

		// 文件名
		String originalFilename = null;
		String temporiginalFilename = null;
		String idcard_ = idcard.toLowerCase();
		if (myfile.isEmpty()) {
			return null;
		} else {
			originalFilename = myfile.getOriginalFilename();
			// 文件原名: sxzx_yyks.png
			
			originalFilename = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
			 temporiginalFilename = originalFilename.toLowerCase();
			// System.out.println("文件原名: " + idcard+originalFilename);
			// System.out.println("文件名称: " + myfile.getName());
			// System.out.println("文件长度: " + myfile.getSize());
			// System.out.println("文件类型: " + myfile.getContentType());
			// System.out.println("========================================");
		}
		// 图片名 加了UUID处理

		String year = IdAndTimeCreateUtil.getTime1();

		if ("1".equals(textState)) {
			// 拼接文件名
			File destFile = new File("E:" + File.separator + "Program Files" + File.separator + "apache-tomcat-8.5.20"
					+ File.separator + "webapps" + File.separator + "pretco" + File.separator + "pretcoYY"
					+ File.separator + "img" + year);
			destFile.mkdirs();

			File destFilemlm = new File(destFile, idcard_ + temporiginalFilename);

			// 写入
			try {
				String courseFile = destFilemlm.getCanonicalPath();
				/*
				 * 5. 保存
				 */
				System.out.println("保存路径:" + courseFile);

				FileUtils.copyInputStreamToFile(myfile.getInputStream(), destFilemlm);
			} catch (IOException e) {
				System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
				e.printStackTrace();
				return null;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}

			Map<String, String> map = new HashMap<String, String>();
			String temp01 = request.getScheme();// 协议名

			String temp02 = request.getServerName();// 服务器名
			// int temp03 = request.getServerPort();// 端口号
			String path = temp01 + "://" + temp02 + "/pretco/" + "pretcoYY/img" + year + "/";
			// System.out.println("图片路径:" + path + idcard);
			map.put("studentTuPian", path + idcard_ + temporiginalFilename);

			return map;
		} else if ("2".equals(textState)) {
			// 拼接文件名
			File destFile = new File("E:" + File.separator + "Program Files" + File.separator + "apache-tomcat-8.5.20"
					+ File.separator + "webapps" + File.separator + "pretco" + File.separator + "pretcoPTH"
					+ File.separator + "img" + year);
			destFile.mkdirs();

			File destFilemlm = new File(destFile, idcard_ + temporiginalFilename);

			// 写入
			try {
				String courseFile = destFilemlm.getCanonicalPath();
				/*
				 * 5. 保存
				 */
				System.out.println("保存路径:" + courseFile);

				FileUtils.copyInputStreamToFile(myfile.getInputStream(), destFilemlm);
			} catch (IOException e) {
				System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
				e.printStackTrace();
				return null;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}

			Map<String, String> map = new HashMap<String, String>();
			String temp01 = request.getScheme();// 协议名

			String temp02 = request.getServerName();// 服务器名
			// int temp03 = request.getServerPort();// 端口号
			String path = temp01 + "://" + temp02 + "/pretco/" + "pretcoPTH/img" + year + "/";
			// System.out.println("图片路径:" + path + idcard);
			map.put("studentTuPian", path + idcard_ + temporiginalFilename);

			return map;
		}
		return null;
	}

	// 查询专业信息
	@RequestMapping(value = "/selectMajor")
	public @ResponseBody ArrayList<GsxyZsMajorTable> selectMajor(GsxyZsMajorTable gsxyZsMajorTable) {
		ArrayList<GsxyZsMajorTable> temp = null;
		try {
			temp = zheShuBiz.selectMajor(gsxyZsMajorTable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询系别信息
	@RequestMapping(value = "/selectFactions")
	public @ResponseBody ArrayList<GsxyFactions> selectFactions() {
		ArrayList<GsxyFactions> temp = null;
		try {
			temp = zheShuBiz.selectFactions();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 新增英语三级报考信息
	@RequestMapping(value = "/insertEnglishTest")
	public @ResponseBody Integer insertEnglishTest(GsxyEnglishExaminationTable g, String ztm) {
			
		String textPassword = g.getTextPassword().trim();
		g.setTextPassword(textPassword);
		
		Integer temp = null;
		GsxyEnglishExaminationTable temp1 = null;
		// 判断是否是空
		if (StringUtils.isBlank(g.getStudentName()) || StringUtils.isBlank(g.getIdcard())) {
			return 0;
		}
		// 判断是否是身份证号码
		if (RegexUtils.checkIdCard(g.getIdcard())) {

		} else {
			return 0;
		}

		// 1是判断英语考试的学生
		if ("1".equals(ztm)) {
			// 判断身份证号码是否存在
			try {
				temp1 = englishTestBiz.selectEnglishTestIdCard(g);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 2是判断普通话等级考试的学生
		} else if ("2".equals(ztm)) {
			// 判断身份证号码是否存在
			try {
				temp1 = englishTestBiz.selectEnglishTestIdCard1(g);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} else {
			return 2;
		}

		try {
			// 判断这个学生是否存在
			// System.out.println(temp1);
			if (temp1 != null) {
				if (temp1.getTextPassword().equals(g.getTextPassword().trim())) {

					if ("1".equals(ztm)) {
						temp = englishTestBiz.updateEnglishTestqt(g);
					} else if ("2".equals(ztm)) {
						temp = englishTestBiz.updateGeneralTestqt(g);
					}

				} else {
					return 3;
				}
			} else {

				// if(temp1 != null) {}
				// 判断是添加英语考试还是普通话考试
				if ("2".equals(ztm)) {
					temp = englishTestBiz.insertGeneralTest(g);
				} else if ("1".equals(ztm)) {
					temp = englishTestBiz.insertEnglishTest(g);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return temp;

	}

	// 查询2个考期名称
	@RequestMapping(value = "/selectSemesterByTow")
	public @ResponseBody ArrayList<GsxySemester> selectSemesterByTow() throws Exception {
		ArrayList<GsxySemester> temp = null;
		try {
			temp = englishTestBiz.selectSemesterByTow();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询2个考期名称
	@RequestMapping(value = "/findEnglishTestByIdCard")
	public @ResponseBody GsxyEnglishExaminationTable findEnglishTestByIdCard(GsxyEnglishExaminationTable g)
			throws Exception {
		GsxyEnglishExaminationTable temp = null;
		try {
			temp = englishTestBiz.findEnglishTestByIdCard(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询2个考期名称
	@RequestMapping(value = "/findEnglishTestByIdCard1")
	public @ResponseBody GsxyEnglishExaminationTable findEnglishTestByIdCard1(GsxyEnglishExaminationTable g)
			throws Exception {
		GsxyEnglishExaminationTable temp = null;
		try {
			temp = englishTestBiz.findEnglishTestByIdCard1(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	//查询所有专业
	@RequestMapping(value = "/findAllZhenShuMajor")
	public @ResponseBody ArrayList<GsxyZsMajorTable> findAllZhenShuMajor(){
		ArrayList<GsxyZsMajorTable> temp = null;
		try {
			temp = zheShuBiz.findAllZhenShuMajor();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//用于移动端查询
	@SuppressWarnings("null")
	@RequestMapping(value = "/findMobileUser")
	public @ResponseBody ActiveUser findMobileUser(String userCode,String userPassword){
		ActiveUser temp = new ActiveUser();
		User u = null;
		try {
			u = userBiz.findMobileUser(userCode, userPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(u!=null) {
			//封住到认证用户
			temp.setUserId(u.getUserId());
			temp.setUserCode(u.getUserCode());
			temp.setDeptno(u.getDeptno());
			temp.setUserName(u.getUserName());
	/*		temp.setDepts();
			temp.setDepartments(departments);
			temp.setMenus(menus);
			temp.setPermissions(permissions);
			temp.setRolemenus(rolemenus);*/
		}else {
			return null;
		}

		return temp;
	}	
}
