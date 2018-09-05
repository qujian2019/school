package com.hngsxy.web.biz.gsxysunshineservice.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.gsxysunshineservice.GsxySunshineServiceMapper;
import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineService;
import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineServiceNews;

import com.hngsxy.web.biz.gsxysunshineservice.GsxySunshineServiceBiz;

/**
 * 阳光服务
 * @author 屈健
 *
 */
@Service
@Transactional
public class GsxySunshineServiceBizImpl implements GsxySunshineServiceBiz{
	
	@Autowired
	private GsxySunshineServiceMapper gsxySunshineServiceMapper;
	//查询阳光新闻
	@Override
	public ArrayList<GsxySunshineServiceNews> findSunshineServiceNews(GsxySunshineServiceNews gsxySunshineServiceNews, int page, int limit) throws Exception {
			    Map<String, Object> condtion = new HashMap<String, Object>();
			    condtion.put("userId",gsxySunshineServiceNews.getUserId());
			    condtion.put("newsTitle",gsxySunshineServiceNews.getNewsTitle());
			    condtion.put("newsReleaseUser",gsxySunshineServiceNews.getNewsReleaseUser());
			    condtion.put("limit", limit);
			    condtion.put("page", page);
			
			    ArrayList<GsxySunshineServiceNews> news1 = null;
					news1 = gsxySunshineServiceMapper.findSunshineServiceNews(condtion);

			return news1;
	}
	//查询阳光新闻总数
	@Override
	public Integer findSunshineServiceNewsTotal(GsxySunshineServiceNews gsxySunshineServiceNews) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",gsxySunshineServiceNews.getUserId());
	        condtion.put("newsTitle",gsxySunshineServiceNews.getNewsTitle());
	        condtion.put("newsReleaseUser",gsxySunshineServiceNews.getNewsReleaseUser());
	        Integer temp = gsxySunshineServiceMapper.findSunshineServiceNewsTotal(condtion);
		return temp;
	}
	
	//添加一条阳光服务信息
	@Override
	public Integer insertGsxySunshineService(GsxySunshineService gsxySunshineService) throws Exception {
		return gsxySunshineServiceMapper.insertGsxySunshineService(gsxySunshineService);
	}
	//删除阳光新闻
	@Override
	public Integer deleteSunshineServiceNews(GsxySunshineServiceNews gsxySunshineServiceNews) throws Exception {
		// TODO Auto-generated method stub
		return gsxySunshineServiceMapper.deleteSunshineServiceNews(gsxySunshineServiceNews);
	}
	//修改阳光新闻时间
	@Override
	public Integer updateNewsReleaseTime(GsxySunshineServiceNews gsxySunshineServiceNews) throws Exception {
		// TODO Auto-generated method stub
		return gsxySunshineServiceMapper.updateNewsReleaseTime(gsxySunshineServiceNews);
	}
	//批量删除阳光新闻
	@Override
	public Integer updateGsxySunshineServiceNewsState(String[] newsIds) throws Exception {
		return gsxySunshineServiceMapper.updateGsxySunshineServiceNewsState(newsIds);
	}
	//添加一条阳光服务新闻
	@Override
	public Integer insertGsxySunshineServiceNews(GsxySunshineServiceNews gsxySunshineServiceNews) throws Exception {
		return gsxySunshineServiceMapper.insertGsxySunshineServiceNews(gsxySunshineServiceNews);
	}
	//查询一个阳光新闻信息
	@Override
	public GsxySunshineServiceNews findGsxySunshineServiceNewsOne(GsxySunshineServiceNews gsxySunshineServiceNews)
			throws Exception {
		return gsxySunshineServiceMapper.findGsxySunshineServiceNewsOne(gsxySunshineServiceNews);
	}
	// 根据阳光新闻类型查询
	@Override
	public ArrayList<GsxySunshineServiceNews> findGsxySunshineServiceNewsTypeIs(
			GsxySunshineServiceNews gsxySunshineServiceNews) throws Exception {
		return gsxySunshineServiceMapper.findGsxySunshineServiceNewsTypeIs(gsxySunshineServiceNews);
	}
	// 查询阳光咨询
	@Override
	public ArrayList<GsxySunshineServiceNews> selectGsxySunshineServiceNewsTypeIs0(
			GsxySunshineServiceNews gsxySunshineServiceNews) throws Exception {
		return gsxySunshineServiceMapper.selectGsxySunshineServiceNewsTypeIs0(gsxySunshineServiceNews);
	}
	//查询阳光服务信息
	@Override
	public ArrayList<GsxySunshineService> findSunshineServiceHear(GsxySunshineService gsxySunshineService, int page, int limit) throws Exception {
	    Map<String, Object> condtion1 = new HashMap<String, Object>();
	    condtion1.put("sunshineTitle",gsxySunshineService.getSunshineTitle());
	    condtion1.put("limit", limit);
	    condtion1.put("page", page);
	   // ArrayList<GsxySunshineService> news1 = null;
	    ArrayList<GsxySunshineService> news1 = gsxySunshineServiceMapper.findSunshineServiceHear(condtion1);
	return news1;
	}
	//查询阳光服务信息总数
	@Override
	public Integer findSunshineServiceHearTotal(GsxySunshineService gsxySunshineService) throws Exception {
	    Map<String, Object> condtion1 = new HashMap<String, Object>();
	    condtion1.put("sunshineTitle",gsxySunshineService.getSunshineTitle());
	    Integer temp = gsxySunshineServiceMapper.findSunshineServiceHearTotal(condtion1);
		return temp;
	}
	//删除一个阳光服务信息
	@Override
	public Integer deleteSunshineServiceOne(GsxySunshineService gsxySunshineService) throws Exception {
		return gsxySunshineServiceMapper.deleteSunshineServiceOne(gsxySunshineService);
	}
	//批量删除阳光服务信息
	@Override
	public Integer deleteSunshineServiceBatch(String[] sunshineIds) throws Exception {
		return gsxySunshineServiceMapper.deleteSunshineServiceBatch(sunshineIds);
	}
	//查询一个阳光服务新闻
	@Override
	public GsxySunshineService findSunshineServiceOne(GsxySunshineService gsxySunshineService) throws Exception {
		GsxySunshineService gss = null;
		gss = gsxySunshineServiceMapper.findSunshineServiceOne(gsxySunshineService);
		return gss;
	}
	//阳光服务回文信息
	@Override
	public Integer updatePalindromeInformation(GsxySunshineService gsxySunshineService) throws Exception {
		return gsxySunshineServiceMapper.updatePalindromeInformation(gsxySunshineService);
	}
	//通过阳光服务编号 查询阳光服务
	@Override
	public GsxySunshineService findSunshineServiceBySunshineNumber(GsxySunshineService gsxySunshineService)
			throws Exception {
		return gsxySunshineServiceMapper.findSunshineServiceBySunshineNumber(gsxySunshineService);
	}
	//给用户完结阳光服务
	@Override
	public Integer updateSunshineStateBySunshineEnd(GsxySunshineService gsxySunshineService)
			throws Exception {
		return gsxySunshineServiceMapper.updateSunshineStateBySunshineEnd(gsxySunshineService);
	}
	//查询阳光服务信息公布
	@Override
	public ArrayList<GsxySunshineService> selectSunshineServiceByPublish() throws Exception {
		return gsxySunshineServiceMapper.selectSunshineServiceByPublish();
	}


	
	
}
