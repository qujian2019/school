package com.hngsxy.web.bean.news;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 新闻类
 * @author 屈健
 *
 */
@Component("news")
@Scope("prototype")
public class News implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer newsId;
	private Integer userId;
	private Integer deptId;
	private String newsTitle;
	private String newsSource;
	private String newsReleaseUser;
	private String newType;
	private String newTypeText;
	private String newsReleaseTime;
	private Integer newsVisitConut;
	private String newsAuditStatus;
	private String newsContext;
	private String newsCarouselPath;//轮播图地址    carouselPath
	private String newsNew;//用于标记日期 对比是否是新信息
	private String newsAdvertisementTime;//招生网浮游广告更新时间
	private String newsAdvertisementText;//招生网浮游广告字幕
	private String newsAuthor;//文章作者个一个或多个
	private String newsPush;//推送部门
	private Integer newsSort;//新闻排序
	private String newsHyperlink;//超链接URL
	

	public String getNewsHyperlink() {
		return newsHyperlink;
	}
	public void setNewsHyperlink(String newsHyperlink) {
		this.newsHyperlink = newsHyperlink;
	}
	public Integer getNewsSort() {
		return newsSort;
	}
	public void setNewsSort(Integer newsSort) {
		this.newsSort = newsSort;
	}
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsSource() {
		return newsSource;
	}
	public void setNewsSource(String newsSource) {
		this.newsSource = newsSource;
	}
	public String getNewsReleaseUser() {
		return newsReleaseUser;
	}
	public void setNewsReleaseUser(String newsReleaseUser) {
		this.newsReleaseUser = newsReleaseUser;
	}
	public String getNewType() {
		return newType;
	}
	public void setNewType(String newType) {
		this.newType = newType;
	}
	public String getNewsReleaseTime() {
		return newsReleaseTime;
	}
	public void setNewsReleaseTime(String newsReleaseTime) {
		this.newsReleaseTime = newsReleaseTime;
	}
	public Integer getNewsVisitConut() {
		return newsVisitConut;
	}
	public void setNewsVisitConut(Integer newsVisitConut) {
		this.newsVisitConut = newsVisitConut;
	}
	public String getNewsAuditStatus() {
		return newsAuditStatus;
	}
	public void setNewsAuditStatus(String newsAuditStatus) {
		this.newsAuditStatus = newsAuditStatus;
	}
	public String getNewsContext() {
		return newsContext;
	}
	public void setNewsContext(String newsContext) {
		this.newsContext = newsContext;
	}
	public String getNewsCarouselPath() {
		return newsCarouselPath;
	}
	public void setNewsCarouselPath(String newsCarouselPath) {
		this.newsCarouselPath = newsCarouselPath;
	}
	public String getNewTypeText() {
		return newTypeText;
	}
	public void setNewTypeText(String newTypeText) {
		this.newTypeText = newTypeText;
	}
	public String getNewsNew() {
		return newsNew;
	}
	public void setNewsNew(String newsNew) {
		this.newsNew = newsNew;
	}
	public String getNewsAdvertisementTime() {
		return newsAdvertisementTime;
	}
	public void setNewsAdvertisementTime(String newsAdvertisementTime) {
		this.newsAdvertisementTime = newsAdvertisementTime;
	}
	public String getNewsAdvertisementText() {
		return newsAdvertisementText;
	}
	public void setNewsAdvertisementText(String newsAdvertisementText) {
		this.newsAdvertisementText = newsAdvertisementText;
	}
	public String getNewsAuthor() {
		return newsAuthor;
	}
	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}
	public String getNewsPush() {
		return newsPush;
	}
	public void setNewsPush(String newsPush) {
		this.newsPush = newsPush;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
