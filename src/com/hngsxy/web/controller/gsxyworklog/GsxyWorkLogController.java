package com.hngsxy.web.controller.gsxyworklog;

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
import com.hngsxy.web.bean.gsxyworklog.GsxyWorkLog;
import com.hngsxy.web.biz.gsxyworklog.GsxyWorkLogBiz;

/**
 * 员工工作日志管理
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping(value = "/GsxyWorkLogController")
public class GsxyWorkLogController {
	
	
	@Autowired
	private GsxyWorkLogBiz gsxyWorkLogBiz;
	
	//新增一条员工工作日志管理
	@RequestMapping(value = "/insertGsxyWorkLog")
	public @ResponseBody Integer insertGsxyWorkLog(GsxyWorkLog gsxyWorkLog) {
		Integer temp = null;

		if(gsxyWorkLog.getWorkLogId() == null) {
			try {
				temp = gsxyWorkLogBiz.insertGsxyWorkLog(gsxyWorkLog);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;
		}else {
			try {
				temp = gsxyWorkLogBiz.updateGsxyWorkLog(gsxyWorkLog);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;
		}


	}
	
	// 查询毕业生
	@RequestMapping(value = "/findGsxyWorkLog")
	public void findGsxyWorkLog(GsxyWorkLog gsxyWorkLog, HttpServletResponse resp, HttpServletRequest req,String time2) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1 = Integer.parseInt(page);
		int limit1 = Integer.parseInt(limit);

		// 分页开始为
		int index = (page1 - 1) * limit1;

		int size = limit1;

		// 2. 查询数据
		ArrayList<GsxyWorkLog> graduateList = null;
		Integer Total = null;
		try {

			graduateList = gsxyWorkLogBiz.findGsxyWorkLog(gsxyWorkLog, index, size, time2);
			Total = gsxyWorkLogBiz.findGsxyWorkLogTotal(gsxyWorkLog,time2);

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
	
	//删除一条员工日志
	@RequestMapping(value = "/updateWorkLogStatus")
	public @ResponseBody Integer updateWorkLogStatus(GsxyWorkLog gsxyWorkLog) {
		Integer temp = null;
			try {
				temp = gsxyWorkLogBiz.updateWorkLogStatus(gsxyWorkLog);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;

	}
	
	//查询一篇员工日志
	@RequestMapping(value = "/selectGsxyWorkLogOne")
	public @ResponseBody GsxyWorkLog selectGsxyWorkLogOne(GsxyWorkLog gsxyWorkLog) {
		GsxyWorkLog temp = null;
			try {
				temp = gsxyWorkLogBiz.selectGsxyWorkLogOne(gsxyWorkLog);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;

	}
	//批量删除日志
	@RequestMapping(value = "/updateGsxyWorkLogState")
	public @ResponseBody Integer updateGsxyWorkLogState(String [] workLogIds) {
		Integer temp = null;
			try {
				temp = gsxyWorkLogBiz.updateGsxyWorkLogState(workLogIds);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;

	}
	
	//查询选中的多个日志日志信息
	@RequestMapping(value = "/selectGsxyWorkLogS")
	public @ResponseBody ArrayList<GsxyWorkLog> selectGsxyWorkLogS(String [] workLogIds) {
		 ArrayList<GsxyWorkLog> temp= null;
			try {
				temp = gsxyWorkLogBiz.selectGsxyWorkLogS(workLogIds);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;

	}
	
	//新增一条员工工作日志管理
	@RequestMapping(value = "/insertYGRZZJ")
	public @ResponseBody Integer insertYGRZZJ(GsxyWorkLog gsxyWorkLog) {
		Integer temp = null;
		if(gsxyWorkLog.getWorkLogId() == null) {
			try {
				temp = gsxyWorkLogBiz.insertYGRZZJ(gsxyWorkLog);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;
		}else {
			try {
				temp = gsxyWorkLogBiz.updateYGRZZJ(gsxyWorkLog);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;
		}

	}
	
	//询月周数
	@RequestMapping(value = "/findyzs")
	public @ResponseBody ArrayList<GsxyWorkLog> findyzs() {
		 ArrayList<GsxyWorkLog> temp= null;
			try {
				temp = gsxyWorkLogBiz.findyzs();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;

	}

	//询月周数
	@RequestMapping(value = "/findGsxyWorkLogTable")
	public @ResponseBody ArrayList<GsxyWorkLog> findGsxyWorkLogTable(GsxyWorkLog gsxyWorkLog) {
		 ArrayList<GsxyWorkLog> temp= null;
			try {
				temp = gsxyWorkLogBiz.findGsxyWorkLogTable(gsxyWorkLog);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return temp;

	}
	
	
	
	
}
