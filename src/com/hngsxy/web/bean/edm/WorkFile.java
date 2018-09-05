package com.hngsxy.web.bean.edm;
import java.io.Serializable;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 文件实体类
 * @author Administrator
 *
 */
@Component("workFile")
@Scope("prototype")
public class WorkFile implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer fileId;//文件管理ID
	
	private String userId;//用户文件ID
	
	private Integer fileFolderId;//文档文件夹管理ID
	
	private String fileName;//文件名称
	
	private String fileUsers;//文件管理人员
	
	private String fileRemarks;//文件备注
	
	private String fileSize;//文件大小
	
	private String fileCreateUser;//文件创建人
	
	private String fileUploadTime;//文件创建时间
	
	private String fileAddress;//所在文件夹

	private String filePath;//文件路径
	
	private String fileState;//文件状态(逻辑删除)

	public Integer getFileId() {
		return fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileUsers() {
		return fileUsers;
	}

	public void setFileUsers(String fileUsers) {
		this.fileUsers = fileUsers;
	}

	public String getFileRemarks() {
		return fileRemarks;
	}

	public void setFileRemarks(String fileRemarks) {
		this.fileRemarks = fileRemarks;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileCreateUser() {
		return fileCreateUser;
	}

	public void setFileCreateUser(String fileCreateUser) {
		this.fileCreateUser = fileCreateUser;
	}

	public String getFileUploadTime() {
		return fileUploadTime;
	}

	public void setFileUploadTime(String fileUploadTime) {
		this.fileUploadTime = fileUploadTime;
	}

	public String getFileAddress() {
		return fileAddress;
	}

	public void setFileAddress(String fileAddress) {
		this.fileAddress = fileAddress;
	}

	public Integer getFileFolderId() {
		return fileFolderId;
	}

	public void setFileFolderId(Integer fileFolderId) {
		this.fileFolderId = fileFolderId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileState() {
		return fileState;
	}

	public void setFileState(String fileState) {
		this.fileState = fileState;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	
	
}
