package com.hngsxy.web.biz.student.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.student.StudentMapper;
import com.hngsxy.web.bean.Student.Student;
import com.hngsxy.web.biz.student.StudentBiz;

@Service
@Transactional
public class StudentBizImpl implements StudentBiz {

	@Autowired
	private StudentMapper studentMapper;

	// 添加一个学生
	
	public Integer insertStudent(Student s) throws Exception {
		return studentMapper.insertStudent(s);
	}

	// 查询毕业生
	@Override
	public ArrayList<Student> findGraduate(Student s, int page, int limit) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("studentName", s.getStudentName());
		condtion.put("idCard", s.getIdCard());
		condtion.put("limit", limit);
		condtion.put("page", page);

		ArrayList<Student> arr = studentMapper.findGraduate(condtion);

		return arr;
	}

	// 查询毕业生总数
	@Override
	public Integer findGraduateTotal(Student s) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("studentName", s.getStudentName());
		condtion.put("idCard", s.getIdCard());
		Integer temp = studentMapper.findGraduateTotal(condtion);

		return temp;
	}

	// 删除一个学生
	@Override
	public Integer deleteStudentOne(Student s) throws Exception {
		return studentMapper.deleteStudentOne(s);
	}

	// 修改一个学生信息
	@Override
	public Integer updateStudentOne(Student s) throws Exception {
		return studentMapper.updateStudentOne(s);
	}

	// 批量删除学生
	@Override
	public Integer updateBatchStudent(String[] studentIds) throws Exception {
		return studentMapper.updateBatchStudent(studentIds);
	}

	// 新增一个报名学生
	@Override
	public Integer insertOnlineRegistration(Student s) throws Exception {
		return studentMapper.insertOnlineRegistration(s);
	}

	// 查询一个毕业的学生
	@Override
	public Student findOneGraduate(Student s) throws Exception {
		return studentMapper.findOneGraduate(s);
	}
	//查询招生审核通过的学生
	@Override
	public Student findStudentRegister(Student s) throws Exception {
		return studentMapper.findStudentRegister(s);
	}

	// 查询报名学生
	@Override
	public ArrayList<Student> findRegister(Student s, int page, int limit) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("idCard", s.getIdCard());
		condtion.put("limit", limit);
		condtion.put("page", page);
		ArrayList<Student> arr = studentMapper.findRegister(condtion);
		return arr;
	}

	// 查询报名学生总数
	@Override
	public Integer findRegisterTotal(Student s) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("number", s.getNumber());
		Integer temp = studentMapper.findGraduateTotal(condtion);
		return temp;
	}
	//通过ID查询学生
	@Override
	public Student findStudentById(Student s) throws Exception {
		return studentMapper.findStudentById(s);
	}
	//修改招生审核状态
	@Override
	public Integer updateStudentAuditState(Student s) throws Exception {
		return studentMapper.updateStudentAuditState(s);
	}
	//查询学生 需要身份证和学生姓名
	@Override
	public Student findStudentByIdCardAndStudentName(Student s) throws Exception {
		return studentMapper.findStudentByIdCardAndStudentName(s);
	}
	//Excel 加入单招学生信息
	@Override
	public Integer insertDZXS(Student s) throws Exception {
		return studentMapper.insertDZXS(s);
	}

}
