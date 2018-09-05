package com.hngsxy.web.biz.gsxyworklog;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.hngsxy.web.bean.gsxyworklog.GsxyWorkLog;

/**
 * 员工工作日志管理
 * @author 
 *
 */
@Service
public interface GsxyWorkLogBiz {
	//新增一个服务信息
	Integer insertGsxyWorkLog(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询员工日志列表
	ArrayList<GsxyWorkLog> findGsxyWorkLog(GsxyWorkLog gsxyWorkLog,int page, int limit,String time2)throws Exception;
	//查询员工日志列表总数
	Integer findGsxyWorkLogTotal(GsxyWorkLog gsxyWorkLog,String time2)throws Exception;
	//删除一个员工日志
	Integer updateWorkLogStatus(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询一篇日志
	GsxyWorkLog selectGsxyWorkLogOne(GsxyWorkLog gsxyWorkLog)throws Exception;
	//批量删除新闻
	Integer updateGsxyWorkLogState(String[] workLogIds)throws Exception;
	//修改日志信息
	Integer updateGsxyWorkLog(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询选中的多个日志日志信息
	ArrayList<GsxyWorkLog> selectGsxyWorkLogS (String[] workLogIds)throws Exception;
	//新增一个员工日志总结
	Integer insertYGRZZJ(GsxyWorkLog gsxyWorkLog)throws Exception;
	//修改一个员工日志总结
	Integer updateYGRZZJ(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询月周数
	ArrayList<GsxyWorkLog>findyzs()throws Exception;
	//查询工作日志总结table
	ArrayList<GsxyWorkLog>findGsxyWorkLogTable(GsxyWorkLog gsxyWorkLog)throws Exception;
}
