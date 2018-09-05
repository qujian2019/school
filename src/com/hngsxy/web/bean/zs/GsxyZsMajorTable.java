package com.hngsxy.web.bean.zs;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

//证书专业
@Component("GsxyZsMajorTable")
@Scope("prototype")
public class GsxyZsMajorTable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String title;
	
	private String zsMajorStatus;
	
	private String addTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getZsMajorStatus() {
		return zsMajorStatus;
	}

	public void setZsMajorStatus(String zsMajorStatus) {
		this.zsMajorStatus = zsMajorStatus;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
