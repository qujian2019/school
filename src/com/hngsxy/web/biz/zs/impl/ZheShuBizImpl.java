package com.hngsxy.web.biz.zs.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.hngsxy.mybatis.zs.ZheShuMapper;
import com.hngsxy.web.bean.zs.GsxyFactions;
import com.hngsxy.web.bean.zs.GsxyZsMajorTable;
import com.hngsxy.web.bean.zs.ZhenShu;
import com.hngsxy.web.biz.zs.ZheShuBiz;

@Service
@Transactional
public class ZheShuBizImpl implements ZheShuBiz{
	
	@Autowired
	private ZheShuMapper zheShuMapper;
	
	//添加证书
	@Override
	public Integer insertZheShu(ZhenShu zhenShu) throws Exception {
		return zheShuMapper.insertZheShu(zhenShu);
	}
	//查询证书
	@Override
	public ZhenShu selectZS(ZhenShu zhenShu) throws Exception {
		return zheShuMapper.selectZS(zhenShu);
	}
	//查询证书列表
	@Override
	public ArrayList<ZhenShu> findZhenShu(ZhenShu zhenShu,int page, int limit) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("title", zhenShu.getTitle());
		condtion.put("content", zhenShu.getContent());
		condtion.put("idcard", zhenShu.getIdcard());
		condtion.put("limit", limit);
		condtion.put("page", page);
		
		return zheShuMapper.findZhenShu(condtion);
	}
	//查询证书列表总数
	@Override
	public Integer findZhenShuTotal(ZhenShu zhenShu) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		return zheShuMapper.findZhenShuTotal(condtion);
	}
	//证书专业查询
	@Override
	public ArrayList<GsxyZsMajorTable> findZhenShuMajor(GsxyZsMajorTable gsxyZsMajorTable,int page, int limit) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("limit", limit);
		condtion.put("page", page);
		
		return zheShuMapper.findZhenShuMajor(condtion);
	}
	//证书专业查询总数
	@Override
	public Integer findZhenShuMajorTotal(GsxyZsMajorTable gsxyZsMajorTable) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();

		return zheShuMapper.findZhenShuMajorTotal(condtion);
	}
	//新增专业
	@Override
	public Integer insertMajor(GsxyZsMajorTable gsxyZsMajorTable) throws Exception {
		return zheShuMapper.insertMajor(gsxyZsMajorTable);
	}
	//删除一个专业
	@Override
	public Integer updateMajorZsMajorStatus(GsxyZsMajorTable gsxyZsMajorTable) throws Exception {
		return zheShuMapper.updateMajorZsMajorStatus(gsxyZsMajorTable);
	}
	//修改专业名称
	@Override
	public Integer updateMajorZsMajorTitle(GsxyZsMajorTable gsxyZsMajorTable) throws Exception {
		return zheShuMapper.updateMajorZsMajorTitle(gsxyZsMajorTable);
	}
	//查询专业名称
	@Override
	public ArrayList<GsxyZsMajorTable> selectMajor(GsxyZsMajorTable gsxyZsMajorTable) throws Exception {
		return zheShuMapper.selectMajor(gsxyZsMajorTable);
	}
	//删除一个证书信息
	@Override
	public Integer updateZhenShuStatus(ZhenShu zhenShu) throws Exception {
		return zheShuMapper.updateZhenShuStatus(zhenShu);
	}
	//修改一个证书
	@Override
	public Integer updateZhenShu(ZhenShu zhenShu) throws Exception {
		return zheShuMapper.updateZhenShu(zhenShu);
	}
	//查询一个证书信息
	@Override
	public ZhenShu selectZsById(ZhenShu zhenShu) throws Exception {
		return zheShuMapper.selectZsById(zhenShu);
	}
	//查询系别信息
	@Override
	public ArrayList<GsxyFactions> findGsxyFactions(int page, int limit) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("limit", limit);
		condtion.put("page", page);
		return zheShuMapper.findGsxyFactions(condtion);
	}
	//新增系别
	@Override
	public Integer insertFactions(GsxyFactions gsxyFactions) throws Exception {
		return zheShuMapper.insertFactions(gsxyFactions);
	}
	//删除系别
	@Override
	public Integer updateStatus(GsxyFactions gsxyFactions) throws Exception {
		return zheShuMapper.updateStatus(gsxyFactions);
	}
	//修改系别名称
	@Override
	public Integer updateFactionsName(GsxyFactions gsxyFactions) throws Exception {
		return zheShuMapper.updateFactionsName(gsxyFactions);
	}
	//查询给学生选择系别
	@Override
	public ArrayList<GsxyFactions> selectFactions() throws Exception {
		return zheShuMapper.selectFactions();
	}
	//查询所有专业
	@Override
	public ArrayList<GsxyZsMajorTable> findAllZhenShuMajor() throws Exception {
		return zheShuMapper.findAllZhenShuMajor();
	}

}
