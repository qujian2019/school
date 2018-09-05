package com.hngsxy.mybatis.news;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hngsxy.web.bean.news.News;
import com.hngsxy.web.bean.user.User;
import com.hngsxy.web.bean.usermanagement.Dept;

/**
 * 新闻发布
 * @author 屈健
 *
 */
@Repository
public interface NewsMapper {
	
	//用户查询新闻
	ArrayList<News> findNews(Map<String, Object> condtion)throws Exception;
	//新闻总数
	Integer findNewsTotal(Map<String, Object> condtion)throws Exception;
	//校园办公室审核新闻信息
	ArrayList<News> findSchoolOfficeAudit(Map<String, Object> condtion)throws Exception;
	//校园办公室审核新闻信息
	Integer findSchoolOfficeAuditTotal(Map<String, Object> condtion)throws Exception;
	//发布新闻
	Integer insertNews(News news)throws Exception;
	//查询一条新闻
	News selectOneNews(News news)throws Exception;
	//删除一条新闻
	Integer deleteOneNews(News news)throws Exception;
	//批量删除新闻
	Integer updateNewsState(@Param("newsIds") String[] newsIds)throws Exception;
	//修改一条新闻
	Integer updateOneNews(News news)throws Exception;
	//查询新闻类型是temp的新闻
	ArrayList<News> selectNewsTypeIs(News news)throws Exception;
	//查询新闻类型是0的新闻
	ArrayList<News> selectNewsTypeIs0(News news)throws Exception;
	//统计新闻访问数量
	Integer updateNewsVisitConut(News news)throws Exception;
	//查询用户部门
	Dept findUserDept(User user)throws Exception;	
	//修改新闻时间
	Integer updateNewsTime(News news)throws Exception;
	//审核新闻
	Integer updateNewsAuditStatus(News news)throws Exception;
	//首页学院新闻新闻
	ArrayList<News> findlunBoTuXinWenNews()throws Exception;
	//首页学院新闻新闻+
	ArrayList<News> findlunBoTuXinWenNewsJia()throws Exception;
	//查询所有通知公告
	ArrayList<News> findTongZhiGongGao()throws Exception;
	//查询所有通知公告+
	ArrayList<News> findTongZhiGongGaoJia()throws Exception;
	//查询所有人事信息
	ArrayList<News> findRenShiXinXi()throws Exception;
	//查询所有人事信息+
	ArrayList<News> findRenShiXinXiJia()throws Exception;
	//查询所有招生信息
	ArrayList<News> findZhaoshenxinxi()throws Exception;
	//查询所有招生信息+
	ArrayList<News> findZhaoshenxinxiJia()throws Exception;
	//查询招生网通知公告
	ArrayList<News> findZSWTongZhiGongGao()throws Exception;
	//修改浮游窗广告
	Integer updateNewsAdvertisement(News news)throws Exception;
	//查询浮游窗广告
	News findAdvertisement()throws Exception;
	//查询新闻可以用新闻的newType 一个或多个
	ArrayList<News> findNewsTypes(@Param("newTypes") String[] newTypes)throws Exception;
	//查询新闻可以用新闻的newType 一个或多个
	ArrayList<News> findNewsTypes2(@Param("newTypes") String[] newTypes)throws Exception;
	//修改排序
	Integer updateNewsSort(News news)throws Exception;
	//反审核
	Integer updateNewsAntiAudit(News news)throws Exception;
	//媒体报道
	ArrayList<News> selectMTBD(News news)throws Exception;
}
