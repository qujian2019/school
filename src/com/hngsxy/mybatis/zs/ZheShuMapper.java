package com.hngsxy.mybatis.zs;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hngsxy.web.bean.zs.GsxyFactions;
import com.hngsxy.web.bean.zs.GsxyZsMajorTable;
import com.hngsxy.web.bean.zs.ZhenShu;


/**
 * 部门DAO
 * @author 屈健
 *
 */
@Repository
public interface ZheShuMapper{
	//添加证书
	Integer insertZheShu(ZhenShu zhenShu)throws Exception;
	//查询证书
	ZhenShu selectZS(ZhenShu zhenShu)throws Exception;
	//查询证书列表
	ArrayList<ZhenShu> findZhenShu(Map<String, Object> condtion)throws Exception;
	//查询证书列表总数
	Integer findZhenShuTotal(Map<String, Object> condtion)throws Exception;
	//证书专业查询
	ArrayList<GsxyZsMajorTable> findZhenShuMajor(Map<String, Object> condtion)throws Exception;
	//证书专业查询总数
	Integer findZhenShuMajorTotal(Map<String, Object> condtion)throws Exception;
	//新增专业
	Integer insertMajor(GsxyZsMajorTable gsxyZsMajorTable)throws Exception;
	//删除一个专业名称
	Integer updateMajorZsMajorStatus(GsxyZsMajorTable gsxyZsMajorTable)throws Exception;
	//修改专业名称
	Integer updateMajorZsMajorTitle(GsxyZsMajorTable gsxyZsMajorTable)throws Exception;
	//查询专业名称
	ArrayList<GsxyZsMajorTable>selectMajor(GsxyZsMajorTable gsxyZsMajorTable)throws Exception;
	//删除一个证书信息
	Integer updateZhenShuStatus(ZhenShu zhenShu)throws Exception;
	//修改一个证书信息
	Integer updateZhenShu(ZhenShu zhenShu)throws Exception;
	//通过id查询证书信息
	ZhenShu selectZsById(ZhenShu zhenShu)throws Exception;
	//查询系别信息
	ArrayList<GsxyFactions> findGsxyFactions(Map<String, Object> condtion)throws Exception;
	//新增系别
	Integer insertFactions(GsxyFactions gsxyFactions)throws Exception;
	//删除系别
	Integer updateStatus(GsxyFactions gsxyFactions)throws Exception;
	//修改系别名称
	Integer updateFactionsName(GsxyFactions gsxyFactions)throws Exception;
	//查询给学生选择系别
	ArrayList<GsxyFactions>selectFactions()throws Exception;
}
