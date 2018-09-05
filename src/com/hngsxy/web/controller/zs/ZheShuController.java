package com.hngsxy.web.controller.zs;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.hngsxy.utils.IdAndTimeCreateUtil;
import com.hngsxy.web.bean.zs.GsxyFactions;
import com.hngsxy.web.bean.zs.GsxyZsMajorTable;
import com.hngsxy.web.bean.zs.ZhenShu;
import com.hngsxy.web.biz.zs.ZheShuBiz;

/**
 * 证书的控制类
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping(value = "/ZheShuController")
public class ZheShuController {
	
	@Autowired
	private ZheShuBiz zheShuBiz;
	
	// 添加一个证书信息
	@RequestMapping(value = "/insertZheShu")
	@RequiresPermissions("zsgl:all")
	public @ResponseBody Integer insertZheShu(ZhenShu zheShu) {
		Integer temp = null;
		
		if(zheShu.getId() == null) {
			try {
				temp = zheShuBiz.insertZheShu(zheShu);
			} catch (Exception e) {

				e.printStackTrace();
			}
			return temp;
		}else {
			try {
				temp = zheShuBiz.updateZhenShu(zheShu);
			} catch (Exception e) {

				e.printStackTrace();
			}
			return temp;
		}
		

	}

	// 查询证书信息
	@RequestMapping(value = "/findZhenShu")
	@RequiresPermissions("zsgl:all")
	public void findZhenShu(ZhenShu zhenShu, HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<ZhenShu> zhenShuList = null;
		Integer Total = null;
		try {

			zhenShuList = zheShuBiz.findZhenShu(zhenShu, index, size);
			Total = zheShuBiz.findZhenShuTotal(zhenShu);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(zhenShuList);

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
	
	// 查询专业信息
	@RequestMapping(value = "/findZhenShuMajor")
	public void findZhenShuMajor(GsxyZsMajorTable gsxyZsMajorTable, HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxyZsMajorTable> zhenShuList = null;
		Integer Total = null;
		try {

			zhenShuList = zheShuBiz.findZhenShuMajor(gsxyZsMajorTable, index, size);
			Total = zheShuBiz.findZhenShuMajorTotal(gsxyZsMajorTable);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(zhenShuList);

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
	
	// 添加一个专业名称信息
	@RequestMapping(value = "/insertMajor")
	public @ResponseBody Integer insertMajor(GsxyZsMajorTable zheShu) {
		Integer temp = null;
		try {
			temp = zheShuBiz.insertMajor(zheShu);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return temp;
	}
	
	// 删除一个专业名称信息
	@RequestMapping(value = "/updateMajorZsMajorStatus")
	public @ResponseBody Integer updateMajorZsMajorStatus(GsxyZsMajorTable zheShu) {
		Integer temp = null;
		try {
			temp = zheShuBiz.updateMajorZsMajorStatus(zheShu);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return temp;
	}
	
	//修改一个专业名称信息
	@RequestMapping(value = "/updateMajorZsMajorTitle")
	public @ResponseBody Integer updateMajorZsMajorTitle(GsxyZsMajorTable zheShu) {
		Integer temp = null;
		try {
			temp = zheShuBiz.updateMajorZsMajorTitle(zheShu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	// 在线报名上次学生照片 需要的地址
	// http://localhost:8080/temp/img/def3adbad0f64f91aa0ffbfc8ecb819f_53232.png
	@RequestMapping(value = "/insertZhenshuTuPian", method = { RequestMethod.POST })
	public @ResponseBody Map<String, String> insertZhenshuTuPian(@RequestParam("myfile") MultipartFile myfile,
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
				+ File.separator + "webapps" + File.separator + "apiuppic" + File.separator + "img", savename);
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
		// Files\apache-tomcat-8.5.20\webapps\temp\img\def3adbad0f64f91aa0ffbfc8ecb819f_53232.png
		Map<String, String> map = new HashMap<String, String>();
		String temp01 = request.getScheme();// 协议名
		// http://www.hngsxy.com:80/temp/img/1ebdfaeb076f44caafad7ecd7be21441_zyimg10.jpg
		String temp02 = request.getServerName();// 服务器名
		//int temp03 = request.getServerPort();// 端口号
		String path = temp01 + "://" + temp02 + "/" + "apiuppic/img/";
		//System.out.println("图片路径:" + path + savename);
		map.put("studentTuPian", path + savename);

		return map;

	}
	
	//查询专业信息
	@RequestMapping(value = "/selectMajor")
	@RequiresPermissions("zsgl:all")
	public @ResponseBody ArrayList<GsxyZsMajorTable> selectMajor(GsxyZsMajorTable gsxyZsMajorTable) {
		ArrayList<GsxyZsMajorTable> temp = null;
		try {
			temp = zheShuBiz.selectMajor(gsxyZsMajorTable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//删除一个学生信息
	@RequestMapping(value = "/updateZhenShuStatus")
	@RequiresPermissions("zsgl:all")
	public @ResponseBody Integer updateZhenShuStatus(ZhenShu zhenShu) {
		Integer temp = null;
		try {
			temp = zheShuBiz.updateZhenShuStatus(zhenShu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	
	//通过id查询证书信息
	@RequestMapping(value = "/selectZsById")
	@RequiresPermissions("zsgl:all")
	public @ResponseBody ZhenShu selectZsById(ZhenShu zhenShu) {
		ZhenShu temp = null;
		try {
			temp = zheShuBiz.selectZsById(zhenShu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	// 查询专业信息
	@RequestMapping(value = "/findGsxyFactions")
	public void findGsxyFactions(HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxyFactions> zhenShuList = null;
		Integer Total = null;
		try {

			zhenShuList = zheShuBiz.findGsxyFactions(index, size);
			Total = zhenShuList.size();
			//Total = zheShuBiz.findZhenShuMajorTotal(gsxyZsMajorTable);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(zhenShuList);

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
	
	//新增系别
	@RequestMapping(value = "/insertFactions")
	public @ResponseBody Integer insertFactions(GsxyFactions gsxyFactions) {
		Integer temp = null;
		try {
			temp = zheShuBiz.insertFactions(gsxyFactions);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	//删除系别
	@RequestMapping(value = "/updateStatus")
	public @ResponseBody Integer updateStatus(GsxyFactions gsxyFactions) {
		Integer temp = null;
		try {
			temp = zheShuBiz.updateStatus(gsxyFactions);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	//修改系别名称
	@RequestMapping(value = "/updateFactionsName")
	public @ResponseBody Integer updateFactionsName(GsxyFactions gsxyFactions) {
		Integer temp = null;
		try {
			temp = zheShuBiz.updateFactionsName(gsxyFactions);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
}
