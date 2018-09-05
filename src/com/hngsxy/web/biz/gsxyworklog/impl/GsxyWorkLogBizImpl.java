package com.hngsxy.web.biz.gsxyworklog.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hngsxy.mybatis.gsxyworklog.GsxyWorkLogMapper;
import com.hngsxy.web.bean.gsxyworklog.GsxyWorkLog;
import com.hngsxy.web.biz.gsxyworklog.GsxyWorkLogBiz;

/**
 * 员工工作日志管理
 * @author 屈健
 *
 */
@Service
public class GsxyWorkLogBizImpl implements GsxyWorkLogBiz{

	@Autowired
	private GsxyWorkLogMapper gsxyWorkLogMapper;
	//添加一个员工日子
	@Override
	public Integer insertGsxyWorkLog(GsxyWorkLog gsxyWorkLog) throws Exception {
		return gsxyWorkLogMapper.insertGsxyWorkLog(gsxyWorkLog);
	}
	//查询员工日志列表Student s,int page, int limit writeTime weeks
	@Override
	public ArrayList<GsxyWorkLog> findGsxyWorkLog(GsxyWorkLog gsxyWorkLog,int page, int limit,String time2) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("userId", gsxyWorkLog.getUserId());
		condtion.put("writeTime", gsxyWorkLog.getWriteTime());
		condtion.put("deptName", gsxyWorkLog.getDeptName());
		condtion.put("workName", gsxyWorkLog.getWorkName());
		condtion.put("workLogStatus", gsxyWorkLog.getWorkLogStatus());
		condtion.put("weeks", gsxyWorkLog.getWeeks());
		condtion.put("time2",time2);
		condtion.put("limit", limit);
		condtion.put("page", page);
		return gsxyWorkLogMapper.findGsxyWorkLog(condtion);
	}
	//查询员工日志列表总数
	@Override
	public Integer findGsxyWorkLogTotal(GsxyWorkLog gsxyWorkLog,String time2) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("userId", gsxyWorkLog.getUserId());
		condtion.put("writeTime", gsxyWorkLog.getWriteTime());
		condtion.put("workName", gsxyWorkLog.getWorkName());
		condtion.put("deptName", gsxyWorkLog.getDeptName());
		condtion.put("workLogStatus", gsxyWorkLog.getWorkLogStatus());
		condtion.put("weeks", gsxyWorkLog.getWeeks());
		condtion.put("time2",time2);
		return gsxyWorkLogMapper.findGsxyWorkLogTotal(condtion);
	}
	//删除一个员工日志
	@Override
	public Integer updateWorkLogStatus(GsxyWorkLog gsxyWorkLog) throws Exception {
		return gsxyWorkLogMapper.updateWorkLogStatus(gsxyWorkLog);
	}
	//查询一篇日志
	@Override
	public GsxyWorkLog selectGsxyWorkLogOne(GsxyWorkLog gsxyWorkLog) throws Exception {
		return gsxyWorkLogMapper.selectGsxyWorkLogOne(gsxyWorkLog);
	}
	//批量删除日志
	@Override
	public Integer updateGsxyWorkLogState(String[] workLogIds) throws Exception {
		return gsxyWorkLogMapper.updateGsxyWorkLogState(workLogIds);
	}
	//修改日志
	@Override
	public Integer updateGsxyWorkLog(GsxyWorkLog gsxyWorkLog) throws Exception {
		return gsxyWorkLogMapper.updateGsxyWorkLog(gsxyWorkLog);
	}
	//查询选中的多个日志日志信息
	@Override
	public ArrayList<GsxyWorkLog> selectGsxyWorkLogS(String[] workLogIds) throws Exception {
		return gsxyWorkLogMapper.selectGsxyWorkLogS(workLogIds);
	}
	//新增一个员工日志总结
	@Override
	public Integer insertYGRZZJ(GsxyWorkLog gsxyWorkLog) throws Exception {
		return gsxyWorkLogMapper.insertYGRZZJ(gsxyWorkLog);
	}
	//修改一个员工日志总结
	@Override
	public Integer updateYGRZZJ(GsxyWorkLog gsxyWorkLog) throws Exception {
		return gsxyWorkLogMapper.updateYGRZZJ(gsxyWorkLog);
	}
	//查询月周数
	@Override
	public ArrayList<GsxyWorkLog> findyzs() throws Exception {
		return gsxyWorkLogMapper.findyzs();
	}
	//查询工作日志总结table
	@Override
	public ArrayList<GsxyWorkLog> findGsxyWorkLogTable(GsxyWorkLog gsxyWorkLog) throws Exception {
		return gsxyWorkLogMapper.findGsxyWorkLogTable(gsxyWorkLog);
	}

}
