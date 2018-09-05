package com.hngsxy.web.bean.zs;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

//系别
@Component("GsxyFactions")
@Scope("prototype")
public class GsxyFactions implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String name;
	private String status;
	private String insertTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(String insertTime) {
		this.insertTime = insertTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

}
