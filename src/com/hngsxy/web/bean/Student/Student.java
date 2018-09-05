package com.hngsxy.web.bean.Student;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 学生类
 * 
 * @author 屈健
 *
 */
@Component("student")
@Scope("prototype")
public class Student implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long studentId;
	private String studentName;// 姓名
	private String number;// 学号
	private String studentClass;// 学生班级
	private String idCard;// 身份证
	private Integer age;// 年龄
	private String sex;// 性别
	private String entranceTime;// 入学时间
	private String graduationTime;// 毕业时间
	private String major;// 专业
	private String studentState;// 学生状态
	private String studentRemarks;// 学生备注
	private String studentBirthday;// 学生出生年月日
	private String studentNation;// 学生民族
	private String studentPlace;// 学生籍贯
	private String studentEducation;// 学生文化程度
	private String studentSpecialty;// 学生特长
	private String studentPolitics;// 学生政治面貌
	private String studentMedia;// 通过何种媒体得知本校
	private String studentPicture;// 学生图片
	private String studentCategory;// 考生类别
	private String studentGraduationSchool;// 毕业学校地址及名称
	private String studentEmail;// '学生电子信箱
	private String studentQq;// '学生QQ
	private String studentAddress;// 学生家庭地址
	private String studentPostal;// 学生邮政编码
	private String studentPhone;// 学生电话
	private String studentResumea;// 简历c
	private String studentResumeb;// 简历c
	private String studentResumec;// 简历c
	private String studentFamilya;// 家庭成员c
	private String studentFamilyb;// 家庭成员c
	private String studentFamilyc;// 家庭成员c
	private String studentMajor;// 学生备注
	private String studentTeacher;// 报名指导人老师
	private String studentAdmissionMajor;// '经审定录取专业
	private String examineeNumber;//考生号
	private String dataInputTime;//用户输入时间



	public String getDataInputTime() {
		return dataInputTime;
	}

	public void setDataInputTime(String dataInputTime) {
		this.dataInputTime = dataInputTime;
	}

	public String getExamineeNumber() {
		return examineeNumber;
	}

	public void setExamineeNumber(String examineeNumber) {
		this.examineeNumber = examineeNumber;
	}

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getStudentClass() {
		return studentClass;
	}

	public void setStudentClass(String studentClass) {
		this.studentClass = studentClass;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEntranceTime() {
		return entranceTime;
	}

	public void setEntranceTime(String entranceTime) {
		this.entranceTime = entranceTime;
	}

	public String getGraduationTime() {
		return graduationTime;
	}

	public void setGraduationTime(String graduationTime) {
		this.graduationTime = graduationTime;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getStudentState() {
		return studentState;
	}

	public void setStudentState(String studentState) {
		this.studentState = studentState;
	}

	public String getStudentRemarks() {
		return studentRemarks;
	}

	public void setStudentRemarks(String studentRemarks) {
		this.studentRemarks = studentRemarks;
	}

	public String getStudentBirthday() {
		return studentBirthday;
	}

	public void setStudentBirthday(String studentBirthday) {
		this.studentBirthday = studentBirthday;
	}

	public String getStudentNation() {
		return studentNation;
	}

	public void setStudentNation(String studentNation) {
		this.studentNation = studentNation;
	}

	public String getStudentPlace() {
		return studentPlace;
	}

	public void setStudentPlace(String studentPlace) {
		this.studentPlace = studentPlace;
	}

	public String getStudentEducation() {
		return studentEducation;
	}

	public void setStudentEducation(String studentEducation) {
		this.studentEducation = studentEducation;
	}

	public String getStudentSpecialty() {
		return studentSpecialty;
	}

	public void setStudentSpecialty(String studentSpecialty) {
		this.studentSpecialty = studentSpecialty;
	}

	public String getStudentPolitics() {
		return studentPolitics;
	}

	public void setStudentPolitics(String studentPolitics) {
		this.studentPolitics = studentPolitics;
	}

	public String getStudentMedia() {
		return studentMedia;
	}

	public void setStudentMedia(String studentMedia) {
		this.studentMedia = studentMedia;
	}

	public String getStudentPicture() {
		return studentPicture;
	}

	public void setStudentPicture(String studentPicture) {
		this.studentPicture = studentPicture;
	}

	public String getStudentCategory() {
		return studentCategory;
	}

	public void setStudentCategory(String studentCategory) {
		this.studentCategory = studentCategory;
	}

	public String getStudentGraduationSchool() {
		return studentGraduationSchool;
	}

	public void setStudentGraduationSchool(String studentGraduationSchool) {
		this.studentGraduationSchool = studentGraduationSchool;
	}

	public String getStudentEmail() {
		return studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	public String getStudentQq() {
		return studentQq;
	}

	public void setStudentQq(String studentQq) {
		this.studentQq = studentQq;
	}

	public String getStudentAddress() {
		return studentAddress;
	}

	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}

	public String getStudentPostal() {
		return studentPostal;
	}

	public void setStudentPostal(String studentPostal) {
		this.studentPostal = studentPostal;
	}

	public String getStudentPhone() {
		return studentPhone;
	}

	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}

	public String getStudentResumea() {
		return studentResumea;
	}

	public void setStudentResumea(String studentResumea) {
		this.studentResumea = studentResumea;
	}

	public String getStudentResumeb() {
		return studentResumeb;
	}

	public void setStudentResumeb(String studentResumeb) {
		this.studentResumeb = studentResumeb;
	}

	public String getStudentResumec() {
		return studentResumec;
	}

	public void setStudentResumec(String studentResumec) {
		this.studentResumec = studentResumec;
	}

	public String getStudentFamilya() {
		return studentFamilya;
	}

	public void setStudentFamilya(String studentFamilya) {
		this.studentFamilya = studentFamilya;
	}

	public String getStudentFamilyb() {
		return studentFamilyb;
	}

	public void setStudentFamilyb(String studentFamilyb) {
		this.studentFamilyb = studentFamilyb;
	}

	public String getStudentFamilyc() {
		return studentFamilyc;
	}

	public void setStudentFamilyc(String studentFamilyc) {
		this.studentFamilyc = studentFamilyc;
	}

	public String getStudentMajor() {
		return studentMajor;
	}

	public void setStudentMajor(String studentMajor) {
		this.studentMajor = studentMajor;
	}

	public String getStudentTeacher() {
		return studentTeacher;
	}

	public void setStudentTeacher(String studentTeacher) {
		this.studentTeacher = studentTeacher;
	}

	public String getStudentAdmissionMajor() {
		return studentAdmissionMajor;
	}

	public void setStudentAdmissionMajor(String studentAdmissionMajor) {
		this.studentAdmissionMajor = studentAdmissionMajor;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
