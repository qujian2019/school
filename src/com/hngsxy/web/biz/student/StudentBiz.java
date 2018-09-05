package com.hngsxy.web.biz.student;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.hngsxy.web.bean.Student.Student;
/**
 * 学生biz
 * @author Administrator
 *
 */
@Service
public interface StudentBiz {
	//新增一个学生
	Integer insertStudent(Student s)throws Exception;
	//查询毕业生
	ArrayList<Student> findGraduate(Student s,int page, int limit)throws Exception;
	//查询毕业生总数
	Integer findGraduateTotal(Student s)throws Exception;
	//删除一个学生信息
	Integer deleteStudentOne(Student s)throws Exception;
	//修改一个学生信息
	Integer updateStudentOne(Student s)throws Exception;
	//批量删除学生
	Integer updateBatchStudent (String[] studentIds)throws Exception;
	//学生报名
	Integer insertOnlineRegistration(Student s)throws Exception;
	//查询一个毕业生
	Student findOneGraduate(Student s)throws Exception;
	//查询报名学生 
	ArrayList<Student> findRegister(Student s,int page, int limit)throws Exception;
	//查询报名学生 总数
	Integer findRegisterTotal(Student s)throws Exception;
	//通过学生ID查询学生
	Student findStudentById(Student s)throws Exception;
	//修改招生审核状态
	Integer updateStudentAuditState(Student s)throws Exception;
	//查询招生审核通过的学生
	Student findStudentRegister(Student s)throws Exception;
	//查询学生 需要身份证和学生姓名
	Student findStudentByIdCardAndStudentName(Student s)throws Exception;
	//Excel 加入单招学生信息
	Integer insertDZXS(Student s)throws Exception;
}
