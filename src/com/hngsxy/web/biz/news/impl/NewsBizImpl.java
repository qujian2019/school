package com.hngsxy.web.biz.news.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.news.NewsMapper;
import com.hngsxy.web.bean.news.News;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;
import com.hngsxy.web.biz.news.NewsBiz;


@Service
@Transactional
public class NewsBizImpl implements NewsBiz{
	
	@Autowired
	private NewsMapper newsMapper;
	//发布一条新闻
	@Override
	public Integer insertNews(News news) throws Exception {
		Integer temp = newsMapper.insertNews(news);
		return temp;
	}
	//查询新闻 temp_
	@Override
	public ArrayList<News> findNews(News news,int page, int limit,String[] temp0) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	       // condtion.put("userId",news.getUserId());
	        condtion.put("temp0",temp0);
	        condtion.put("newsTitle",news.getNewsTitle());
	        condtion.put("newsReleaseUser",news.getNewsReleaseUser());
	        condtion.put("newType",news.getNewType());
	        condtion.put("limit", limit);
	        condtion.put("page", page);
		
	        ArrayList<News> news1  = newsMapper.findNews(condtion);
		
		return news1;
	}
	//新闻总数
	@Override
	public Integer findNewsTotal(News news,String[] temp0) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	       // condtion.put("userId",news.getUserId());
	        condtion.put("temp0",temp0);
	        condtion.put("newsTitle",news.getNewsTitle());
	        condtion.put("newType",news.getNewType());
	        condtion.put("newsReleaseUser",news.getNewsReleaseUser());
	        Integer temp = newsMapper.findNewsTotal(condtion);
		return temp;
	}
	//校园办公室审核新闻信息
	@Override
	public ArrayList<News> findSchoolOfficeAudit(News news, int page, int limit) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",news.getUserId());
	        condtion.put("newsTitle",news.getNewsTitle());
	        condtion.put("newsReleaseUser",news.getNewsReleaseUser());
	        condtion.put("newType",news.getNewType());
	        condtion.put("newsAuditStatus",news.getNewsAuditStatus());
	        condtion.put("limit", limit);
	        condtion.put("page", page);
		
	        ArrayList<News> news1  = newsMapper.findSchoolOfficeAudit(condtion);
		
		return news1;
	}
	//校园办公室审核新闻信息总数
	@Override
	public Integer findSchoolOfficeAuditTotal(News news) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",news.getUserId());
	        condtion.put("newsTitle",news.getNewsTitle());
	        condtion.put("newsReleaseUser",news.getNewsReleaseUser());
	        condtion.put("newType",news.getNewType());
	        condtion.put("newsAuditStatus",news.getNewsAuditStatus());
	        Integer temp = newsMapper.findSchoolOfficeAuditTotal(condtion);
		return temp;
	}

	//查询一条新闻
	@Override
	public News selectOneNews(News news) throws Exception {
		News newsOne = newsMapper.selectOneNews(news);
		return newsOne;
	}
	//删除一条新闻
	@Override
	public Integer deleteOneNews(News news) throws Exception {
		Integer temp = newsMapper.deleteOneNews(news);
		return temp;
	}
	//批量删除新闻
	@Override
	public Integer updateNewsState(String[] newsIds) throws Exception {
		Integer temp = newsMapper.updateNewsState(newsIds);
		return temp;
	}
	//修改一条新闻
	@Override
	public Integer updateOneNews(News news) throws Exception {
		Integer	temp = newsMapper.updateOneNews(news);
		return temp;
	}
	//查询新闻类型是temp的新闻
	@Override
	public ArrayList<News> selectNewsTypeIs(News news) throws Exception {
		ArrayList<News> news1 = newsMapper.selectNewsTypeIs(news);
		return news1;
	}
	//查询新闻类型是0的新闻
	@Override
	public ArrayList<News> selectNewsTypeIs0(News news) throws Exception {
		ArrayList<News> news1 = newsMapper.selectNewsTypeIs0(news);
		return news1;
	}
	//统计新闻
	@Override
	public Integer updateNewsVisitConut(News news) throws Exception {
		Integer temp = newsMapper.updateNewsVisitConut(news);
		return temp;
	}
	//查询用户部门
	@Override
	public Dept findUserDept(User user) throws Exception {
		Dept dept =	newsMapper.findUserDept(user);
		return dept;
	}
	//修改新闻时间
	@Override
	public Integer updateNewsTime(News news) throws Exception {
		return newsMapper.updateNewsTime(news);
	}
	//审核新闻状态
	@Override
	public Integer updateNewsAuditStatus(News news) throws Exception {
		return newsMapper.updateNewsAuditStatus(news);
	}
	//轮播新闻
	@Override
	public ArrayList<News> findlunBoTuXinWenNews() throws Exception {
		return newsMapper.findlunBoTuXinWenNews();
	}
	//轮播新闻
	@Override
	public ArrayList<News> findTongZhiGongGao() throws Exception {
		return newsMapper.findTongZhiGongGao();
	}
	//轮播新闻
	@Override
	public ArrayList<News> findTongZhiGongGaoJia() throws Exception {
		return newsMapper.findTongZhiGongGaoJia();
	}
	//轮播新闻
	
	public ArrayList<News> findRenShiXinXi() throws Exception {
		return newsMapper.findRenShiXinXi();
	}
	//轮播新闻
	@Override
	public ArrayList<News> findRenShiXinXiJia() throws Exception {
		return newsMapper.findRenShiXinXiJia();
	}
	//首页学院新闻新闻+
	@Override
	public ArrayList<News> findlunBoTuXinWenNewsJia() throws Exception {
		return newsMapper.findlunBoTuXinWenNewsJia();
	}
	//查询所有招生信息
	@Override
	public ArrayList<News> findZhaoshenxinxi() throws Exception {
		return newsMapper.findZhaoshenxinxi();
	}
	//查询所有招生信息+
	@Override
	public ArrayList<News> findZhaoshenxinxiJia() throws Exception {
		return newsMapper.findZhaoshenxinxiJia();
	}
	//查询招生网通知公告
	@Override
	public ArrayList<News> findZSWTongZhiGongGao() throws Exception {
		return newsMapper.findZSWTongZhiGongGao();
	}
	//修改浮游窗广告
	@Override
	public Integer updateNewsAdvertisement(News news) throws Exception {
		return newsMapper.updateNewsAdvertisement(news);
	}
	//查询浮游窗广告
	@Override
	public News findAdvertisement() throws Exception {
		return newsMapper.findAdvertisement();
	}
	//查询新闻可以用新闻的newType 一个或多个
	@Override
	public ArrayList<News> findNewsTypes(String[] newTypes) throws Exception {
		return newsMapper.findNewsTypes(newTypes);
	}
	//查询新闻可以用新闻的newType 一个或多个
	@Override
	public ArrayList<News> findNewsTypes2(String[] newTypes) throws Exception {
		return newsMapper.findNewsTypes2(newTypes);
	}
	//修改排序
	@Override
	public Integer updateNewsSort(News news) throws Exception {
		return newsMapper.updateNewsSort(news);
	}
	//反审核
	@Override
	public Integer updateNewsAntiAudit(News news) throws Exception {
		return newsMapper.updateNewsAntiAudit(news);
	}
	//媒体报道
	@Override
	public ArrayList<News> selectMTBD(News news) throws Exception {
		return newsMapper.selectMTBD(news);
	}

}
