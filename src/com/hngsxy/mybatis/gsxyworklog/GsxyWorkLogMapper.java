package com.hngsxy.mybatis.gsxyworklog;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hngsxy.web.bean.gsxyworklog.GsxyWorkLog;


/**
 * 湖南工商学院员工工作日志
 * @author 屈健
 *
 */
@Repository
public interface GsxyWorkLogMapper {
	
	//新增一个服务信息
	Integer insertGsxyWorkLog(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询员工日志列表
	ArrayList<GsxyWorkLog> findGsxyWorkLog(Map<String, Object> condtion)throws Exception;
	//查询员工日志列表总数
	Integer findGsxyWorkLogTotal(Map<String, Object> condtion)throws Exception;
	//删除一个员工日志
	Integer updateWorkLogStatus(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询一篇日志
	GsxyWorkLog selectGsxyWorkLogOne(GsxyWorkLog gsxyWorkLog)throws Exception;
	//批量删除新闻
	Integer updateGsxyWorkLogState(@Param("workLogIds") String[] workLogIds)throws Exception;
	//修改日志信息
	Integer updateGsxyWorkLog(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询选中的多个日志日志信息
	ArrayList<GsxyWorkLog> selectGsxyWorkLogS (@Param("workLogIds") String[] workLogIds)throws Exception;
	//新增一个员工日志总结
	Integer insertYGRZZJ(GsxyWorkLog gsxyWorkLog)throws Exception;
	//修改一个员工日志总结
	Integer updateYGRZZJ(GsxyWorkLog gsxyWorkLog)throws Exception;
	//查询月周数
	ArrayList<GsxyWorkLog>findyzs()throws Exception;
	//查询工作日志总结table
	ArrayList<GsxyWorkLog>findGsxyWorkLogTable(GsxyWorkLog gsxyWorkLog)throws Exception;
}
