package com.hngsxy.web.bean.usermanagement;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("ztreeOrganiza")
@Scope("prototype")
public class ZtreeOrganiza implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String pId;
	private String name;
	private boolean open;
	private boolean isParent;
	private boolean noShow;
	private String showv;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public boolean isParent() {
		return isParent;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
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
	public void setParent(boolean isParent) {
		this.isParent = isParent;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
