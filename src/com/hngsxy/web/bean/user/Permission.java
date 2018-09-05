package com.hngsxy.web.bean.user;
/**
 * 权限类
 * @author 屈健
 *
 */
public class Permission implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long permissionId;
	private String permissionName;
	private String permissionType;
	private String permissionUrl;
	private String permissionPercode;
	private String permissionParentid;
	private String permissionParentids;
	private String permissionSortstring;
	private String permissionAvailable;
	public Long getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}
	public String getPermissionName() {
		return permissionName;
	}
	public void setPermissionName(String permissionName) {
		 this.permissionName = permissionName == null ? null : permissionName.trim();
	}
	public String getPermissionType() {
		return permissionType;
	}
	public void setPermissionType(String permissionType) {
		 this.permissionType = permissionType == null ? null : permissionType.trim();
	}
	public String getPermissionUrl() {
		return permissionUrl;
	}
	public void setPermissionUrl(String permissionUrl) {
		this.permissionUrl = permissionUrl;
	}
	public String getPermissionPercode() {
		return permissionPercode;
	}
	public void setPermissionPercode(String permissionPercode) {
		this.permissionPercode = permissionPercode;
	}
	public String getPermissionParentid() {
		return permissionParentid;
	}
	public void setPermissionParentid(String permissionParentid) {
		this.permissionParentid = permissionParentid;
	}
	public String getPermissionParentids() {
		return permissionParentids;
	}
	public void setPermissionParentids(String permissionParentids) {
		this.permissionParentids = permissionParentids;
	}
	public String getPermissionSortstring() {
		return permissionSortstring;
	}
	public void setPermissionSortstring(String permissionSortstring) {
		this.permissionSortstring = permissionSortstring;
	}
	public String getPermissionAvailable() {
		return permissionAvailable;
	}
	public void setPermissionAvailable(String permissionAvailable) {
		 this.permissionAvailable = permissionAvailable == null ? null : permissionAvailable.trim();
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
