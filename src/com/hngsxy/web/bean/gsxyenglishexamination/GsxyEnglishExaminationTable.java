package com.hngsxy.web.bean.gsxyenglishexamination;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
/**
 * 英语三级考试
 * @author 屈健
 *
 */
@Component("GsxyEnglishExaminationTable")
@Scope("prototype")
public class GsxyEnglishExaminationTable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String idcard;
	private String studentName;
	private String studentsex;
	private String campus;
	private String factions;
	private String classNumber;
	private String schoolNumber;
	private String enrollmentYear;
	private String major;
	private String admissionTicket;
	private String centreNo;
	private String examinationStatus;
	private String photo;
	private String photoPth;
	private String insertTime;
	private String unqualifiedReason;
	private String charge;
	private String college;
	private String examination;
	private String textPassword;
	private String nation;
	private String classType;//学制
	private String telePhone;//学生电话
	
	public String getTelePhone() {
		return telePhone;
	}
	public void setTelePhone(String telePhone) {
		this.telePhone = telePhone;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public String getPhotoPth() {
		return photoPth;
	}
	public void setPhotoPth(String photoPth) {
		this.photoPth = photoPth;
	}
	public String getTextPassword() {
		return textPassword;
	}
	public void setTextPassword(String textPassword) {
		this.textPassword = textPassword;
	}
	public String getExamination() {
		return examination;
	}
	public void setExamination(String examination) {
		this.examination = examination;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getUnqualifiedReason() {
		return unqualifiedReason;
	}
	public void setUnqualifiedReason(String unqualifiedReason) {
		this.unqualifiedReason = unqualifiedReason;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentsex() {
		return studentsex;
	}
	public void setStudentsex(String studentsex) {
		this.studentsex = studentsex;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public String getFactions() {
		return factions;
	}
	public void setFactions(String factions) {
		this.factions = factions;
	}
	public String getClassNumber() {
		return classNumber;
	}
	public void setClassNumber(String classNumber) {
		this.classNumber = classNumber;
	}
	public String getSchoolNumber() {
		return schoolNumber;
	}
	public void setSchoolNumber(String schoolNumber) {
		this.schoolNumber = schoolNumber;
	}
	public String getEnrollmentYear() {
		return enrollmentYear;
	}
	public void setEnrollmentYear(String enrollmentYear) {
		this.enrollmentYear = enrollmentYear;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getAdmissionTicket() {
		return admissionTicket;
	}
	public void setAdmissionTicket(String admissionTicket) {
		this.admissionTicket = admissionTicket;
	}
	public String getCentreNo() {
		return centreNo;
	}
	public void setCentreNo(String centreNo) {
		this.centreNo = centreNo;
	}
	public String getExaminationStatus() {
		return examinationStatus;
	}
	public void setExaminationStatus(String examinationStatus) {
		this.examinationStatus = examinationStatus;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getInsertTime() {
		return insertTime;
	}
	public void setInsertTime(String insertTime) {
		this.insertTime = insertTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
