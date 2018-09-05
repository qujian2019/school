package com.hngsxy.web.bean.zs;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 * 证书类
 */
@Component("ZhenShu")
@Scope("prototype")
public class ZhenShu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2712378075871593556L;
	//
	private String id;
	//
	private String title;
	//
	private String pic;
	//
	private String content;	
	//
	private String classid;	
	//
	private String adddate;	
	//
	private String idcard;
	//
	private String data;	
	//
	private String rank;	
	//
	private String sex;	
	//
	private String yy;
	//
	private String mm;
	//
	private String dd;
	//
	private String culture;
	//
	private String theory;
	//
	private String work;
	//
	private String zsStatus;
	//
	private String birthday;
	
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
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
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getAdddate() {
		return adddate;
	}
	public void setAdddate(String adddate) {
		this.adddate = adddate;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public String getCulture() {
		return culture;
	}
	public void setCulture(String culture) {
		this.culture = culture;
	}
	public String getTheory() {
		return theory;
	}
	public void setTheory(String theory) {
		this.theory = theory;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getZsStatus() {
		return zsStatus;
	}
	public void setZsStatus(String zsStatus) {
		this.zsStatus = zsStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
