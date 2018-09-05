package com.hngsxy.web.bean.gsxywskximg;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 学生类
 * 
 * @author 屈健
 *
 */
@Component("gsxywskximg")
@Scope("prototype")
public class GsxyWskxImg implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3317642185481057074L;
	
	private Long wskximgId;//图片ID
	private String wskximgName;// 图片名
	private String wskximgUrl;// 图片URL
	private String wskximgTime;// 图片时间
	private String wskximgType;// 图片类型
	private String wskximgStatus;// 图片状态
	private int wskximgCurr;//排序
	
	public int getWskximgCurr() {
		return wskximgCurr;
	}
	public void setWskximgCurr(int wskximgCurr) {
		this.wskximgCurr = wskximgCurr;
	}
	public String getWskximgType() {
		return wskximgType;
	}
	public void setWskximgType(String wskximgType) {
		this.wskximgType = wskximgType;
	}
	public Long getWskximgId() {
		return wskximgId;
	}
	public void setWskximgId(Long wskximgId) {
		this.wskximgId = wskximgId;
	}
	public String getWskximgName() {
		return wskximgName;
	}
	public void setWskximgName(String wskximgName) {
		this.wskximgName = wskximgName;
	}
	public String getWskximgUrl() {
		return wskximgUrl;
	}
	public void setWskximgUrl(String wskximgUrl) {
		this.wskximgUrl = wskximgUrl;
	}
	public String getWskximgTime() {
		return wskximgTime;
	}
	public void setWskximgTime(String wskximgTime) {
		this.wskximgTime = wskximgTime;
	}
	public String getWskximgStatus() {
		return wskximgStatus;
	}
	public void setWskximgStatus(String wskximgStatus) {
		this.wskximgStatus = wskximgStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
