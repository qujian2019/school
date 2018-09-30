package com.hngsxy.web.biz.gsxysunshineservice;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineService;
import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineServiceNews;


/**
 * 阳光服务
 * @author 
 *
 */
@Service
public interface GsxySunshineServiceBiz {
	//用户查询新闻
	ArrayList<GsxySunshineServiceNews> findSunshineServiceNews(GsxySunshineServiceNews gsxySunshineServiceNews,int page, int limit) throws Exception;
	//新闻总数
	Integer findSunshineServiceNewsTotal(GsxySunshineServiceNews gsxySunshineServiceNews)throws Exception;
	//新增一个服务信息
	Integer insertGsxySunshineService(GsxySunshineService gsxySunshineService)throws Exception;
	//删除阳光新闻
	Integer deleteSunshineServiceNews(GsxySunshineServiceNews gsxySunshineService)throws Exception;
	//修改阳光新闻时间
	Integer updateNewsReleaseTime(GsxySunshineServiceNews gsxySunshineServiceNews)throws Exception;
	//批量删除新闻
	Integer updateGsxySunshineServiceNewsState(@Param("newsIds") String[] newsIds)throws Exception;
	//添加一条阳光新闻
	Integer insertGsxySunshineServiceNews(GsxySunshineServiceNews gsxySunshineServiceNews)throws Exception;
	//查询一个阳光新闻信息
	GsxySunshineServiceNews findGsxySunshineServiceNewsOne(GsxySunshineServiceNews gsxySunshineServiceNews)throws Exception;
	//根据阳光新闻类型查询
	ArrayList<GsxySunshineServiceNews> findGsxySunshineServiceNewsTypeIs(GsxySunshineServiceNews gsxySunshineServiceNews)throws Exception;
	//阳光咨询
	ArrayList<GsxySunshineServiceNews> selectGsxySunshineServiceNewsTypeIs0(GsxySunshineServiceNews gsxySunshineServiceNews)throws Exception;
	//查询阳光服务信息
	ArrayList<GsxySunshineService> findSunshineServiceHear(GsxySunshineService gsxySunshineService, int page, int limit)throws Exception;
	//查询阳光服务信息总数
	Integer findSunshineServiceHearTotal(GsxySunshineService gsxySunshineService)throws Exception;
	//删除一个阳光服务信息
	Integer deleteSunshineServiceOne(GsxySunshineService gsxySunshineService)throws Exception;
	//批量删除阳光服务信息
	Integer deleteSunshineServiceBatch(@Param("sunshineIds") String[] sunshineIds)throws Exception;
	//查询一个阳光服务新闻
	GsxySunshineService findSunshineServiceOne(GsxySunshineService gsxySunshineService)throws Exception;
	//回文信息
	Integer updatePalindromeInformation(GsxySunshineService gsxySunshineService)throws Exception;
	//通过阳光服务编号 查询阳光服务
	GsxySunshineService findSunshineServiceBySunshineNumber(GsxySunshineService gsxySunshineService)throws Exception;
	//给用户完结阳光服务
	Integer updateSunshineStateBySunshineEnd(GsxySunshineService gsxySunshineService)throws Exception;
	//查询阳光服务信息公布
	ArrayList<GsxySunshineService> selectSunshineServiceByPublish()throws Exception;
	
}
