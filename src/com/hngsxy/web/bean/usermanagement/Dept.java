package com.hngsxy.web.bean.usermanagement;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("dept")
@Scope("prototype")
public class Dept implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String deptno;//部门id
	
	private String dname;//部门名字或描述
	
	private String pId;//父节点
	
	private boolean noShow;//父节点
	
	private String showv;//用于显示页面
	
	private Integer deptSort;//部门排序用

	public String getDeptno() {
		return deptno;
	}

	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public boolean isNoShow() {
		return noShow;
	}

	public void setNoShow(boolean noShow) {
		this.noShow = noShow;
	}

	public String getShowv() {
		return showv;
	}

	public void setShowv(String showv) {
		this.showv = showv;
	}

	public Integer getDeptSort() {
		return deptSort;
	}

	public void setDeptSort(Integer deptSort) {
		this.deptSort = deptSort;
	}
	
	
	
}
