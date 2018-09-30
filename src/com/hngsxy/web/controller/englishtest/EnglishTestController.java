package com.hngsxy.web.controller.englishtest;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.hngsxy.utils.ExcelUtil;
import com.hngsxy.utils.IdAndTimeCreateUtil;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxyEnglishExaminationTable;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxySemester;
import com.hngsxy.web.biz.englishtest.EnglishTestBiz;

/**
 * 英语考试控制器
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping(value = "/EnglishTestController")
public class EnglishTestController {

	// 依赖文件夹mapper
	@Autowired
	private EnglishTestBiz englishTestBiz;

	// 查询英语三级考试
	@RequestMapping(value = "/findEnglishExamination")
	public void findEnglishExamination(GsxyEnglishExaminationTable gsxyEnglishExaminationTable,
			HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxyEnglishExaminationTable> gsxyWskxImgList = null;
		Integer Total = null;
		try {

			gsxyWskxImgList = englishTestBiz.findEnglishExamination(gsxyEnglishExaminationTable, index, size);
			Total = englishTestBiz.findEnglishExaminationTotal(gsxyEnglishExaminationTable);

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
	
	// 查询普通话测试考试
	@RequestMapping(value = "/findGeneralTest")
	public void findGeneralTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable,
			HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxyEnglishExaminationTable> gsxyWskxImgList = null;
		Integer Total = null;
		try {

			gsxyWskxImgList = englishTestBiz.findGeneralTest(gsxyEnglishExaminationTable, index, size);
			Total = englishTestBiz.findGeneralTestTotal(gsxyEnglishExaminationTable);

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

	// 删除一个学生信息
	@RequestMapping(value = "/updateExaminationStatus")
	public @ResponseBody Integer updateExaminationStatus(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) {
		Integer temp = null;
		try {
			temp = englishTestBiz.updateExaminationStatus(gsxyEnglishExaminationTable);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;

	}

	// 查询一个报考信息
	@RequestMapping(value = "/selectGsxyEnglishExaminationTableOne")
	public @ResponseBody GsxyEnglishExaminationTable selectGsxyEnglishExaminationTableOne(
			GsxyEnglishExaminationTable gsxyEnglishExaminationTable) {
		GsxyEnglishExaminationTable temp = null;
		try {
			temp = englishTestBiz.selectGsxyEnglishExaminationTableOne(gsxyEnglishExaminationTable);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;

	}

	// 查询一个报考信息
	@RequestMapping(value = "/updateEnglishTest")
	public @ResponseBody Integer updateEnglishTest(GsxyEnglishExaminationTable g) {
		Integer temp = null;
		try {
			temp = englishTestBiz.updateEnglishTest(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;

	}
	
	// 查询一个报考信息
	@RequestMapping(value = "/updateGeneralTest")
	public @ResponseBody Integer updateGeneralTest(GsxyEnglishExaminationTable g) {
		Integer temp = null;
		try {
			temp = englishTestBiz.updateGeneralTest(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;

	}

	// 查询一个报考信息
	@RequestMapping(value = "/updateEnglishTestState")
	public @ResponseBody Integer updateEnglishTestState(String[] ids) {
		Integer temp = null;
		try {
			temp = englishTestBiz.updateEnglishTestState(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	// 导出Excel
	@RequestMapping("/export")
	public @ResponseBody String export(HttpServletResponse response, GsxyEnglishExaminationTable g,String st1,String st2) {
			response.setContentType("application/binary;charset=UTF-8");
		try {
			ServletOutputStream out = response.getOutputStream();
			String fileName = new String(
					("UserInfo " + new SimpleDateFormat("yyyy-MM-dd").format(new Date())).getBytes(), "UTF-8");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xls");
			String[] titles = { "身份证号", "姓名", "性别", "校区", "学院", "系别", "班级", "学号", "入学年份", "专业"};
			englishTestBiz.findEnglishExaminationExcel(g, titles, out,st1,st2);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "导出信息失败";
		}
	}

	// 图片信息
	@RequestMapping(value = "/findSemester")
	public void findSemester(GsxySemester gsxySemester,
			HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxySemester> gsxyWskxImgList = null;
		Integer Total = null;
		try {

			gsxyWskxImgList = englishTestBiz.findSemester(gsxySemester, index, size);
			Total = gsxyWskxImgList.size();

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
	
	//新增考期
	@RequestMapping(value = "/insertSemester")
	public @ResponseBody Integer insertSemester(GsxySemester gsxySemester) throws Exception {
		Integer temp = null;
		try {
			temp = englishTestBiz.insertSemester(gsxySemester);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//删除一个考期
	@RequestMapping(value = "/updateSemesterStatus")
	public @ResponseBody Integer updateSemesterStatus(GsxySemester gsxySemester) throws Exception {
		Integer temp = null;
		try {
			temp = englishTestBiz.updateSemesterStatus(gsxySemester);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//修改一个考期
	@RequestMapping(value = "/updateSemesterName")
	public @ResponseBody Integer updateSemesterName(GsxySemester gsxySemester) throws Exception {
		Integer temp = null;
		try {
			temp = englishTestBiz.updateSemesterName(gsxySemester);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//报考通过
	@RequestMapping(value = "/updateEnglishTestStateByAdopt")
	public @ResponseBody Integer updateEnglishTestStateByAdopt(GsxyEnglishExaminationTable g) throws Exception {
		Integer temp = null;

		if("1".equals(g.getExaminationStatus())||"2".equals(g.getExaminationStatus())||"3".equals(g.getExaminationStatus())) {
			g.setExaminationStatus("3");
		}else if("11".equals(g.getExaminationStatus())||"12".equals(g.getExaminationStatus())||"13".equals(g.getExaminationStatus())){
			g.setExaminationStatus("13");
		}
		g.setUnqualifiedReason("通过");
		
		try {
			temp = englishTestBiz.updateEnglishTestStateByAdopt(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//不通过理由
	@RequestMapping(value = "/updateEnglishTestUnqualifiedReason")
	public @ResponseBody Integer updateEnglishTestUnqualifiedReason(GsxyEnglishExaminationTable g) throws Exception {
		Integer temp = null;
		
		if("1".equals(g.getExaminationStatus())||"2".equals(g.getExaminationStatus())||"3".equals(g.getExaminationStatus())) {
			g.setExaminationStatus("2");
		}else if("11".equals(g.getExaminationStatus())||"12".equals(g.getExaminationStatus())||"13".equals(g.getExaminationStatus())){
			g.setExaminationStatus("12");
		}

		try {
			temp = englishTestBiz.updateEnglishTestUnqualifiedReason(g);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//根据身份证修改考试编号,和作为编号
	// 导入excel单招学生信息
	@SuppressWarnings("null")
	@RequestMapping("/updateAdmissionTicket")
	public @ResponseBody Map<String, String> updateAdmissionTicket(MultipartFile myfile, HttpServletRequest request,String st1,String st2,String examination) {
		Map<String, String> map = new HashMap<String, String>();
		String originalFilename = null;
		 Integer tttt = 0;
		//String result = null;
		GsxyEnglishExaminationTable g = new GsxyEnglishExaminationTable();
		//Student s = null;
		if (myfile.isEmpty()) {
			//result = "模板文件为空,请选择文件";
			return null;
		} else {
			originalFilename = myfile.getOriginalFilename();
			System.out.println("文件原名: " + originalFilename);
			System.out.println("文件名称: " + myfile.getName());
			System.out.println("文件长度: " + myfile.getSize());
			System.out.println("文件类型: " + myfile.getContentType());
			System.out.println("========================================");
		}
		//获取项目路径
		String templl = request.getSession().getServletContext().getRealPath("/");
		// 图片名 加了UUID处理
		String savename = IdAndTimeCreateUtil.getUUID() + "_" + originalFilename;
		// 拼接文件名
		File destFile = new File(templl + File.separator + "excelFile");
		destFile.mkdirs();
		File destFilemlm = new File(destFile,savename);
		
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
		}

		InputStream fis = null;

		try {
			fis = myfile.getInputStream();
		} catch (IOException e) {

			e.printStackTrace();
		}
		//String filePath = "D:\\test.xlsx";
		String columns [] = {"身份证号","姓名","性别","校区","学院","系别","班级","学号","入学年份","专业","准考证号","考场编号"};
		// 添加操作
		ArrayList<Map<String, String>> list =ExcelUtil.analysis(originalFilename, columns);
		
        //遍历解析出来的list
      for (Map<String,String> map1 : list) {

          for (Entry<String,String> entry : map1.entrySet()) {
          	//这里可以添加数据到数据库呢~
             // System.out.print(entry.getKey()+":"+entry.getValue()+",");
              
          	if(entry.getKey() == "身份证号") {
        		g.setIdcard(entry.getValue());
        	}
        	if(entry.getKey() == "准考证号") {
        		g.setAdmissionTicket(entry.getValue());
        	}
        	if(entry.getKey() == "考场编号") {
        		g.setCentreNo(entry.getValue());
        	}
          }
        
          try {
        	  //通过身份证修改准考号，考试编号信息
        	  tttt =  englishTestBiz.updateAdmissionTicket(g,st1,st2,examination);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

      }

		try {
			fis.close();
		} catch (IOException e) {

			e.printStackTrace();
		}
		map.put("result","上传成功");
		
		return map;

	}
	
	
}
