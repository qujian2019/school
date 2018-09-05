package com.hngsxy.web.controller.gsxywskximg;

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
import com.hngsxy.web.bean.gsxywskximg.GsxyWskxImg;
import com.hngsxy.web.biz.gsxywskximg.GsxyWskxImgBiz;


/**
 * 网上看校的控制类
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping(value = "/GsxyWskxImgController")
public class GsxyWskxImgController {
	
	@Autowired
	private GsxyWskxImgBiz gsxyWskxImgBiz;
	
	// 图片信息
	@RequestMapping(value = "/findGsxyWskxImg")
	@RequiresPermissions("wskx:all")
	public void findGraduate(GsxyWskxImg gsxyWskxImg, HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxyWskxImg> gsxyWskxImgList = null;
		Integer Total = null;
		try {

			gsxyWskxImgList = gsxyWskxImgBiz.findGsxyWskxImg(gsxyWskxImg, index, size);
			Total = gsxyWskxImgBiz.findGsxyWskxImgTotal(gsxyWskxImg);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(gsxyWskxImgList);

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
	//新增一条网上看图片信息
	@RequestMapping(value = "/insertGsxyWskxImg")
	@RequiresPermissions("wskx:all")
	public @ResponseBody Integer insertGsxyWskxImg(GsxyWskxImg gsxyWskxImg) {
		Integer temp = null;

		if(gsxyWskxImg.getWskximgId() == null) {
			try {
				temp = gsxyWskxImgBiz.insertGsxyWskxImg(gsxyWskxImg);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;
		}else {
			try {
				temp = gsxyWskxImgBiz.updateGsxyWskxImg(gsxyWskxImg);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;
		}

	}
	
	//删除图片信息
	@RequestMapping(value = "/updateGsxyWskxImgStatus")
	@RequiresPermissions("wskx:all")
	public @ResponseBody Integer updateGsxyWskxImgStatus(GsxyWskxImg gsxyWskxImg) throws Exception {
		Integer temp = null;
		try {
			temp = gsxyWskxImgBiz.updateGsxyWskxImgStatus(gsxyWskxImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//查询一个图片信息
	@RequestMapping(value = "/findGsxyWskxImgOne")
	@RequiresPermissions("wskx:all")
	public @ResponseBody GsxyWskxImg findGsxyWskxImgOne(GsxyWskxImg gsxyWskxImg) throws Exception {
		GsxyWskxImg temp = null;
		try {
			temp = gsxyWskxImgBiz.findGsxyWskxImgOne(gsxyWskxImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	// 删除一个或多个条新闻
	@RequestMapping("/updateGsxyWskxImgStatusBatch")
	@RequiresPermissions("wskx:all") // 执行queryItems需要"item:query"权限
	public @ResponseBody Integer updateGsxyWskxImgStatusBatch(String[] wskximgIds) {
		Integer temp = null;
		try {
			temp = gsxyWskxImgBiz.updateGsxyWskxImgStatusBatch(wskximgIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
}
