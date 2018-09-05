package com.hngsxy.web.bean.mysessions;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 员工工作日志类
 * 
 * @author 屈健
 *
 */
@Component("mysessions")
@Scope("prototype")
public class MySessions implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String session;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
