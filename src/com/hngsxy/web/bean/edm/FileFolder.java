package com.hngsxy.web.bean.edm;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 文件管理 文件夹实体类
 * @author 屈健
 *
 */
@Component("fileFolder")
@Scope("prototype")
public class FileFolder implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer fileFolderId;//文档文件夹id
	
	private Integer UserId;//文档文件夹用户ID
	
	private String fileFolderName;//文件夹名称
	
	private String fileFolderUserRoleIds;//#文档文件夹管理角色id
	
	private String fileFolderReminderMode;//文档文件夹提醒方式
	
	private String fileFolderReminderUser;//文档文件夹提醒人员
	
	private String fileFolderRemarks;//文档文件夹备注
	
	private String fileFolderOccupiedSpace;//文档文件夹占用空间
	
	private String fileFolderCreateUser;//文档创建人
	
	private String fileFolderCreateTime;//文档创建时间
	
	private String fileFolderAddress;//所在地址
	
	private String fileFolderState;//文件夹状态 默认是0

	public Integer getFileFolderId() {
		return fileFolderId;
	}

	public void setFileFolderId(Integer fileFolderId) {
		this.fileFolderId = fileFolderId;
	}

	public Integer getUserId() {
		return UserId;
	}

	public void setUserId(Integer userId) {
		UserId = userId;
	}

	public String getFileFolderName() {
		return fileFolderName;
	}

	public void setFileFolderName(String fileFolderName) {
		this.fileFolderName = fileFolderName;
	}

	public String getFileFolderUserRoleIds() {
		return fileFolderUserRoleIds;
	}

	public void setFileFolderUserRoleIds(String fileFolderUserRoleIds) {
		this.fileFolderUserRoleIds = fileFolderUserRoleIds;
	}

	public String getFileFolderReminderMode() {
		return fileFolderReminderMode;
	}

	public void setFileFolderReminderMode(String fileFolderReminderMode) {
		this.fileFolderReminderMode = fileFolderReminderMode;
	}

	public String getFileFolderReminderUser() {
		return fileFolderReminderUser;
	}

	public void setFileFolderReminderUser(String fileFolderReminderUser) {
		this.fileFolderReminderUser = fileFolderReminderUser;
	}

	public String getFileFolderRemarks() {
		return fileFolderRemarks;
	}

	public void setFileFolderRemarks(String fileFolderRemarks) {
		this.fileFolderRemarks = fileFolderRemarks;
	}

	public String getFileFolderOccupiedSpace() {
		return fileFolderOccupiedSpace;
	}

	public void setFileFolderOccupiedSpace(String fileFolderOccupiedSpace) {
		this.fileFolderOccupiedSpace = fileFolderOccupiedSpace;
	}

	public String getFileFolderCreateUser() {
		return fileFolderCreateUser;
	}

	public void setFileFolderCreateUser(String fileFolderCreateUser) {
		this.fileFolderCreateUser = fileFolderCreateUser;
	}

	public String getFileFolderCreateTime() {
		return fileFolderCreateTime;
	}

	public void setFileFolderCreateTime(String fileFolderCreateTime) {
		this.fileFolderCreateTime = fileFolderCreateTime;
	}

	public String getFileFolderAddress() {
		return fileFolderAddress;
	}

	public void setFileFolderAddress(String fileFolderAddress) {
		this.fileFolderAddress = fileFolderAddress;
	}

	public String getFileFolderState() {
		return fileFolderState;
	}

	public void setFileFolderState(String fileFolderState) {
		this.fileFolderState = fileFolderState;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
