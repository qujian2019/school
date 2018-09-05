package com.hngsxy.web.bean.gsxysunshineservice;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 提供服务实体类
 * @author 屈健
 *
 */
@Component("gsxySunshineService")
@Scope("prototype")
public class GsxySunshineService implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private long sunshineId; //阳光id
	
	private String sunshineNumber;//阳光服务编号
	
	private String sunshineLetter;//阳光服务来信人
	
	private String sunshineLetterTime;//阳光服务来信人时间
	
	private String sunshineServiceType;//阳光服务服务类型
	
	private String sunshineAdmissible;//阳光服务受理单位
	
	private String sunshineState;//阳光服务办理状态
	
	private String sunshineTitle;//阳光服务来信主题
	
	private String sunshineContent;//阳光服务来信内容
	
	private String sunshinePalindrome;//阳光服务回文单位
	
	private String sunshineHandlingTime;//阳光服务办理时间
	
	private String sunshineResults;//阳光服务处理结果
	
	private String sunshineName;//阳光服务姓名
	
	private String sunshinePhone;//阳光服务手机号码
	
	private String sunshineMailbox;//阳光服务电子邮箱
	
	private String sunshineSex;//阳光服务性别
	
	private String sunshineAddress;//阳光服务联系地址
	
	private String sunshineCategory;//阳光服务选择类别
	
	private String sunshinePublic;//阳光服务公开
	
	private String sunshineEnclosure;//阳光服务附件
	
	private String sunshineEnd;//阳光服务结办码

	public long getSunshineId() {
		return sunshineId;
	}

	public void setSunshineId(long sunshineId) {
		this.sunshineId = sunshineId;
	}

	public String getSunshineNumber() {
		return sunshineNumber;
	}

	public void setSunshineNumber(String sunshineNumber) {
		this.sunshineNumber = sunshineNumber;
	}

	public String getSunshineLetter() {
		return sunshineLetter;
	}

	public void setSunshineLetter(String sunshineLetter) {
		this.sunshineLetter = sunshineLetter;
	}

	public String getSunshineLetterTime() {
		return sunshineLetterTime;
	}

	public void setSunshineLetterTime(String sunshineLetterTime) {
		this.sunshineLetterTime = sunshineLetterTime;
	}

	public String getSunshineServiceType() {
		return sunshineServiceType;
	}

	public void setSunshineServiceType(String sunshineServiceType) {
		this.sunshineServiceType = sunshineServiceType;
	}

	public String getSunshineAdmissible() {
		return sunshineAdmissible;
	}

	public void setSunshineAdmissible(String sunshineAdmissible) {
		this.sunshineAdmissible = sunshineAdmissible;
	}

	public String getSunshineState() {
		return sunshineState;
	}

	public void setSunshineState(String sunshineState) {
		this.sunshineState = sunshineState;
	}

	public String getSunshineTitle() {
		return sunshineTitle;
	}

	public void setSunshineTitle(String sunshineTitle) {
		this.sunshineTitle = sunshineTitle;
	}

	public String getSunshineContent() {
		return sunshineContent;
	}

	public void setSunshineContent(String sunshineContent) {
		this.sunshineContent = sunshineContent;
	}

	public String getSunshinePalindrome() {
		return sunshinePalindrome;
	}

	public void setSunshinePalindrome(String sunshinePalindrome) {
		this.sunshinePalindrome = sunshinePalindrome;
	}

	public String getSunshineHandlingTime() {
		return sunshineHandlingTime;
	}

	public void setSunshineHandlingTime(String sunshineHandlingTime) {
		this.sunshineHandlingTime = sunshineHandlingTime;
	}

	public String getSunshineResults() {
		return sunshineResults;
	}

	public void setSunshineResults(String sunshineResults) {
		this.sunshineResults = sunshineResults;
	}

	public String getSunshineName() {
		return sunshineName;
	}

	public void setSunshineName(String sunshineName) {
		this.sunshineName = sunshineName;
	}

	public String getSunshinePhone() {
		return sunshinePhone;
	}

	public void setSunshinePhone(String sunshinePhone) {
		this.sunshinePhone = sunshinePhone;
	}

	public String getSunshineMailbox() {
		return sunshineMailbox;
	}

	public void setSunshineMailbox(String sunshineMailbox) {
		this.sunshineMailbox = sunshineMailbox;
	}

	public String getSunshineSex() {
		return sunshineSex;
	}

	public void setSunshineSex(String sunshineSex) {
		this.sunshineSex = sunshineSex;
	}

	public String getSunshineAddress() {
		return sunshineAddress;
	}

	public void setSunshineAddress(String sunshineAddress) {
		this.sunshineAddress = sunshineAddress;
	}

	public String getSunshineCategory() {
		return sunshineCategory;
	}

	public void setSunshineCategory(String sunshineCategory) {
		this.sunshineCategory = sunshineCategory;
	}

	public String getSunshinePublic() {
		return sunshinePublic;
	}

	public void setSunshinePublic(String sunshinePublic) {
		this.sunshinePublic = sunshinePublic;
	}

	public String getSunshineEnclosure() {
		return sunshineEnclosure;
	}

	public void setSunshineEnclosure(String sunshineEnclosure) {
		this.sunshineEnclosure = sunshineEnclosure;
	}

	public String getSunshineEnd() {
		return sunshineEnd;
	}

	public void setSunshineEnd(String sunshineEnd) {
		this.sunshineEnd = sunshineEnd;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
