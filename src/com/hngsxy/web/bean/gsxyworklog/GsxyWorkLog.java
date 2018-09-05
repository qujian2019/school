package com.hngsxy.web.bean.gsxyworklog;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 员工工作日志类
 * 
 * @author 屈健
 *
 */
@Component("gsxyworklog")
@Scope("prototype")
public class GsxyWorkLog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8411683729384922450L;

	private String workLogId;
	private Long userId;
	private String deptId;
	private String writeTime;
	private String week1;
	private String week2;
	private String urgent;
	private String commonly;
	private String timeSlot1;
	private String timeSlot2;
	private String timeSlot3;
	private String timeSlot4;
	private String timeSlot5;
	private String jobContent1;
	private String jobContent2;
	private String jobContent3;
	private String jobContent4;
	private String jobContent5;
	private String completeTime1;
	private String completeTime2;
	private String completeTime3;
	private String completeTime4;
	private String completeTime5;
	private String ratifiedTime1;
	private String ratifiedTime2;
	private String ratifiedTime3;
	private String ratifiedTime4;
	private String ratifiedTime5;
	private String selfVerification;
	private String personnelVerification;
	private String notCompleted;
	private String problem;
	private String Improvement;
	private String leadershipVerification;
	private String deptName;
	private String workName;
	private String workLogStatus;
	
	private String jobKey;
	private String jobOther;
	private String personnelVerification2;
	private String weeks;

	public String getJobKey() {
		return jobKey;
	}
	public void setJobKey(String jobKey) {
		this.jobKey = jobKey;
	}
	public String getJobOther() {
		return jobOther;
	}
	public void setJobOther(String jobOther) {
		this.jobOther = jobOther;
	}
	public String getPersonnelVerification2() {
		return personnelVerification2;
	}
	public void setPersonnelVerification2(String personnelVerification2) {
		this.personnelVerification2 = personnelVerification2;
	}
	public String getWeeks() {
		return weeks;
	}
	public void setWeeks(String weeks) {
		this.weeks = weeks;
	}
	public String getWorkLogStatus() {
		return workLogStatus;
	}
	public void setWorkLogStatus(String workLogStatus) {
		this.workLogStatus = workLogStatus;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getWorkLogId() {
		return workLogId;
	}
	public void setWorkLogId(String workLogId) {
		this.workLogId = workLogId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public String getWeek1() {
		return week1;
	}
	public void setWeek1(String week1) {
		this.week1 = week1;
	}
	public String getWeek2() {
		return week2;
	}
	public void setWeek2(String week2) {
		this.week2 = week2;
	}
	public String getUrgent() {
		return urgent;
	}
	public void setUrgent(String urgent) {
		this.urgent = urgent;
	}
	public String getCommonly() {
		return commonly;
	}
	public void setCommonly(String commonly) {
		this.commonly = commonly;
	}
	public String getTimeSlot1() {
		return timeSlot1;
	}
	public void setTimeSlot1(String timeSlot1) {
		this.timeSlot1 = timeSlot1;
	}
	public String getTimeSlot2() {
		return timeSlot2;
	}
	public void setTimeSlot2(String timeSlot2) {
		this.timeSlot2 = timeSlot2;
	}
	public String getTimeSlot3() {
		return timeSlot3;
	}
	public void setTimeSlot3(String timeSlot3) {
		this.timeSlot3 = timeSlot3;
	}
	public String getTimeSlot4() {
		return timeSlot4;
	}
	public void setTimeSlot4(String timeSlot4) {
		this.timeSlot4 = timeSlot4;
	}
	public String getTimeSlot5() {
		return timeSlot5;
	}
	public void setTimeSlot5(String timeSlot5) {
		this.timeSlot5 = timeSlot5;
	}
	public String getJobContent1() {
		return jobContent1;
	}
	public void setJobContent1(String jobContent1) {
		this.jobContent1 = jobContent1;
	}
	public String getJobContent2() {
		return jobContent2;
	}
	public void setJobContent2(String jobContent2) {
		this.jobContent2 = jobContent2;
	}
	public String getJobContent3() {
		return jobContent3;
	}
	public void setJobContent3(String jobContent3) {
		this.jobContent3 = jobContent3;
	}
	public String getJobContent4() {
		return jobContent4;
	}
	public void setJobContent4(String jobContent4) {
		this.jobContent4 = jobContent4;
	}
	public String getJobContent5() {
		return jobContent5;
	}
	public void setJobContent5(String jobContent5) {
		this.jobContent5 = jobContent5;
	}
	public String getCompleteTime1() {
		return completeTime1;
	}
	public void setCompleteTime1(String completeTime1) {
		this.completeTime1 = completeTime1;
	}
	public String getCompleteTime2() {
		return completeTime2;
	}
	public void setCompleteTime2(String completeTime2) {
		this.completeTime2 = completeTime2;
	}
	public String getCompleteTime3() {
		return completeTime3;
	}
	public void setCompleteTime3(String completeTime3) {
		this.completeTime3 = completeTime3;
	}
	public String getCompleteTime4() {
		return completeTime4;
	}
	public void setCompleteTime4(String completeTime4) {
		this.completeTime4 = completeTime4;
	}
	public String getCompleteTime5() {
		return completeTime5;
	}
	public void setCompleteTime5(String completeTime5) {
		this.completeTime5 = completeTime5;
	}
	public String getRatifiedTime1() {
		return ratifiedTime1;
	}
	public void setRatifiedTime1(String ratifiedTime1) {
		this.ratifiedTime1 = ratifiedTime1;
	}
	public String getRatifiedTime2() {
		return ratifiedTime2;
	}
	public void setRatifiedTime2(String ratifiedTime2) {
		this.ratifiedTime2 = ratifiedTime2;
	}
	public String getRatifiedTime3() {
		return ratifiedTime3;
	}
	public void setRatifiedTime3(String ratifiedTime3) {
		this.ratifiedTime3 = ratifiedTime3;
	}
	public String getRatifiedTime4() {
		return ratifiedTime4;
	}
	public void setRatifiedTime4(String ratifiedTime4) {
		this.ratifiedTime4 = ratifiedTime4;
	}
	public String getRatifiedTime5() {
		return ratifiedTime5;
	}
	public void setRatifiedTime5(String ratifiedTime5) {
		this.ratifiedTime5 = ratifiedTime5;
	}
	public String getSelfVerification() {
		return selfVerification;
	}
	public void setSelfVerification(String selfVerification) {
		this.selfVerification = selfVerification;
	}
	public String getPersonnelVerification() {
		return personnelVerification;
	}
	public void setPersonnelVerification(String personnelVerification) {
		this.personnelVerification = personnelVerification;
	}
	public String getNotCompleted() {
		return notCompleted;
	}
	public void setNotCompleted(String notCompleted) {
		this.notCompleted = notCompleted;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getImprovement() {
		return Improvement;
	}
	public void setImprovement(String improvement) {
		Improvement = improvement;
	}
	public String getLeadershipVerification() {
		return leadershipVerification;
	}
	public void setLeadershipVerification(String leadershipVerification) {
		this.leadershipVerification = leadershipVerification;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
