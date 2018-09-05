package com.hngsxy.web.controller.Student;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

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
import com.hngsxy.web.bean.Student.Student;
import com.hngsxy.web.bean.zs.ZhenShu;
import com.hngsxy.web.biz.student.StudentBiz;
import com.hngsxy.web.biz.zs.ZheShuBiz;

/**
 * 学生的控制类
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping(value = "/StudentController")
public class StudentController {

	@Autowired
	private StudentBiz studentBiz;
	@Autowired
	private ZheShuBiz zheShuBiz;
	

	// 添加一个毕业学生
	@RequestMapping(value = "/insertStudent")
	public @ResponseBody Integer insertStudent(Student s) {
		Integer temp = null;
		try {
			temp = studentBiz.insertStudent(s);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return temp;
	}

	// 查询毕业生
	@RequestMapping(value = "/findGraduate")
	public void findGraduate(Student s, HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<Student> graduateList = null;
		Integer Total = null;
		try {

			graduateList = studentBiz.findGraduate(s, index, size);
			Total = studentBiz.findGraduateTotal(s);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(graduateList);

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

	// 删除一个学生类
	@RequestMapping(value = "/deleteStudentOne")
	public @ResponseBody Integer deleteStudentOne(Student s) {
		Integer temp = null;
		try {
			temp = studentBiz.deleteStudentOne(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 修改一个学生类
	@RequestMapping(value = "/updateStudentOne")
	public @ResponseBody Integer updateStudentOne(Student s) {
		Integer temp = null;
		try {
			temp = studentBiz.updateStudentOne(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 删除批量学生类
	@RequestMapping(value = "/deleteBatchStudent")
	public @ResponseBody Integer deleteBatchStudent(String[] studentIds) {
		Integer temp = null;
		try {
			temp = studentBiz.updateBatchStudent(studentIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 查询报名学生
	@RequestMapping(value = "/findRegister")
	public void findRegister(Student s, HttpServletResponse resp, HttpServletRequest req) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<Student> registerList = null;
		Integer Total = null;
		try {
			registerList = studentBiz.findRegister(s, index, size);
			Total = studentBiz.findRegisterTotal(s);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(registerList);

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

	// 通过ID查询学生
	@RequestMapping(value = "/findStudentById")
	public @ResponseBody Student findStudentById(Student s) {
		Student temp = null;
		try {
			temp = studentBiz.findStudentById(s);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return temp;

	}

	// 修改招生类状态
	@RequestMapping(value = "/studentAuditState")
	public @ResponseBody Integer studentAuditState(Student s) {
		Integer temp = null;
		try {
			temp = studentBiz.updateStudentAuditState(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 导入excel单招学生信息
	@SuppressWarnings("null")
	@RequestMapping("/insertStudentExcel")
	public @ResponseBody Map<String, String> insertStudentExcel(MultipartFile myfile, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		String originalFilename = null;
		//String result = null;
		Student s = new Student();
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

		// 图片名 加了UUID处理
		String savename = IdAndTimeCreateUtil.getUUID() + "_" + originalFilename;
		// 拼接文件名
		File destFile = new File("E:" + File.separator + "excelFile", savename);
		
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

		InputStream fis = null;

		try {
			fis = myfile.getInputStream();
		} catch (IOException e) {

			e.printStackTrace();
		}

		
		// 添加操作
		ArrayList<Map<Object, String>> data = IdAndTimeCreateUtil.parseExcel(fis);
		for (Map<Object, String> student : data) {
			s.setStudentName(student.get("姓名"));
			s.setExamineeNumber(student.get("考生号"));
			s.setStudentGraduationSchool(student.get("毕业中学"));
			s.setMajor(student.get("专业名称"));

			try {
				studentBiz.insertDZXS(s);
			} catch (Exception e) {
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
	
	// 导入excel单招学生信息
	@SuppressWarnings("null")
	@RequestMapping("/insertZs")
	public @ResponseBody Map<String, String> insertZs(MultipartFile myfile, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		String originalFilename = null;
		//String result = null;
		ZhenShu zhenShu = new ZhenShu();
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

		// 图片名 加了UUID处理
		String savename = IdAndTimeCreateUtil.getUUID() + "_" + originalFilename;
		// 拼接文件名
		File destFile = new File("E:" + File.separator + "excelFile", savename);
		
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

		InputStream fis = null;

		try {
			fis = myfile.getInputStream();
		} catch (IOException e) {

			e.printStackTrace();
		}
		//String filePath = "D:\\test.xlsx";
		String columns [] = {"id","title","pic","content","classid","adddate","idcard","data","rank","sex","yy","mm","dd","culture"};
		// 添加操作
		ArrayList<Map<String, String>> list =ExcelUtil.analysis(originalFilename, columns);
		
        //遍历解析出来的list
      for (Map<String,String> map1 : list) {

          for (Entry<String,String> entry : map1.entrySet()) {
          	//这里可以添加数据到数据库呢~
             // System.out.print(entry.getKey()+":"+entry.getValue()+",");
              
          	if(entry.getKey() == "id") {
        		zhenShu.setId(entry.getValue());
        	}
        	if(entry.getKey() == "title") {
        		zhenShu.setTitle(entry.getValue());
        	}
        	if(entry.getKey() == "pic") {
        		zhenShu.setPic(entry.getValue());
        	}
        	if(entry.getKey() == "content") {
        		zhenShu.setContent(entry.getValue());
        	}
        	if(entry.getKey() == "classid") {
        		zhenShu.setClassid(entry.getValue());
        	}
        	if(entry.getKey() == "adddate") {
        		zhenShu.setAdddate(entry.getValue());
        	}
        	if(entry.getKey() == "idcard") {
        		zhenShu.setIdcard(entry.getValue());
        	}
        	if(entry.getKey() == "data") {
        		zhenShu.setData(entry.getValue());
        	}
        	if(entry.getKey() == "rank") {
        		zhenShu.setRank(entry.getValue());
        	}
        	if(entry.getKey() == "sex") {
        		zhenShu.setSex(entry.getValue());
        	}
        	if(entry.getKey() == "yy") {
        		zhenShu.setYy(entry.getValue());
        	}
        	if(entry.getKey() == "mm") {
        		zhenShu.setMm(entry.getValue());
        	}
        	if(entry.getKey() == "dd") {
        		zhenShu.setDd(entry.getValue());
        	}
        	if(entry.getKey() == "culture") {
        		zhenShu.setCulture(entry.getValue());
        	}
        	zhenShu.setWork("1");
        	zhenShu.setTheory("1");
        	zhenShu.setZsStatus("1");

          }
          
        
          try {
			zheShuBiz.insertZheShu(zhenShu);
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
