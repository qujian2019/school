package com.hngsxy.mybatis.englishtest;


import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hngsxy.web.bean.gsxyenglishexamination.GsxyEnglishExaminationTable;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxySemester;

/**
 * 英语考试
 * @author 屈健
 *
 */
@Repository
public interface EnglishTestMapper {
	//新增考生信息
	Integer insertEnglishTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//普通话考试
	Integer insertGeneralTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//修改考生信息
	Integer updateEnglishTestYY(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//考生录入信息查询
	ArrayList<GsxyEnglishExaminationTable>findEnglishExamination(Map<String, Object> condtion)throws Exception;
	Integer findEnglishExaminationTotal(Map<String, Object> condtion)throws Exception;
	Integer findGeneralTestTotal(Map<String, Object> condtion)throws Exception;
	//普通话等级考试
	ArrayList<GsxyEnglishExaminationTable>findGeneralTest(Map<String, Object> condtion)throws Exception;
	//考生导出Excel
	ArrayList<GsxyEnglishExaminationTable> findEnglishExaminationExcel(Map<String, Object> condtion)throws Exception;
	//删除一个学生信息
	Integer updateExaminationStatus(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//查询一个报考信息
	GsxyEnglishExaminationTable selectGsxyEnglishExaminationTableOne(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//批量删除报考信息
	Integer updateEnglishTestState(@Param("ids") String[] ids)throws Exception;
	//查询英语考试身份证是否用过
	GsxyEnglishExaminationTable selectEnglishTestIdCard(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//查询普通话考试身份证是否用过
	GsxyEnglishExaminationTable selectEnglishTestIdCard1(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//查询考期
	ArrayList<GsxySemester>findSemester(Map<String, Object> condtion)throws Exception;
	//新增考期
	Integer insertSemester(GsxySemester gsxySemester)throws Exception;
	//删除一个考期
	Integer updateSemesterStatus(GsxySemester gsxySemester)throws Exception;
	//修改一个考期名称
	Integer updateSemesterName(GsxySemester gsxySemester)throws Exception;
	//查询考期
	ArrayList<GsxySemester>selectSemesterByTow()throws Exception;
	//报考通过
	Integer updateEnglishTestStateByAdopt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//不通过理由
	Integer updateEnglishTestUnqualifiedReason(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//通过身份证查询考生状态
	GsxyEnglishExaminationTable findEnglishTestByIdCard(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//通过身份证查询普通话考生状态
	GsxyEnglishExaminationTable findEnglishTestByIdCard1(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//根据身份证修改考试编号,和作为编号
	Integer updateAdmissionTicket(Map<String, Object> condtion)throws Exception;
	//前台修改考生信息
	Integer updateEnglishTestqt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//前天修改普通话考生信息
	Integer updateGeneralTestqt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//前天修改普通话考生信息
	Integer updateGeneralTestPt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	
	
}
