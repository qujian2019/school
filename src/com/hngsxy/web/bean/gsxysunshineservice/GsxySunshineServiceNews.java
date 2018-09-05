package com.hngsxy.web.bean.gsxysunshineservice;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 阳光新闻
 * @author 屈健
 *
 */
@Component("hsxySunshineServiceNews")
@Scope("prototype")
public class GsxySunshineServiceNews implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer newsId;
	private Integer userId;
	private String deptId;
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
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
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
	public String getNewTypeText() {
		return newTypeText;
	}
	public void setNewTypeText(String newTypeText) {
		this.newTypeText = newTypeText;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
	
}
