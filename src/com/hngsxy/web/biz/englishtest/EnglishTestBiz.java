package com.hngsxy.web.biz.englishtest;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.springframework.stereotype.Service;

import com.hngsxy.web.bean.gsxyenglishexamination.GsxyEnglishExaminationTable;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxySemester;

/**
 * 英语三级考试
 * @author 
 *
 */
@Service
public interface EnglishTestBiz {
	Integer findEnglishExaminationTotal(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	Integer findGeneralTestTotal(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//新增考生信息
	Integer insertEnglishTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//普通话考试
	Integer insertGeneralTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//修改考生信息
	Integer updateEnglishTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//英语考试查询
	ArrayList<GsxyEnglishExaminationTable>findEnglishExamination(GsxyEnglishExaminationTable gsxyEnglishExaminationTable,int page, int limit)throws Exception;
	//普通话登记考试查询
	ArrayList<GsxyEnglishExaminationTable>findGeneralTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable,int page, int limit)throws Exception;
	//删除一个学生信息
	Integer updateExaminationStatus(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//查询一个报考信息
	GsxyEnglishExaminationTable selectGsxyEnglishExaminationTableOne(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//逻辑删除
	Integer updateEnglishTestState(String[] ids)throws Exception;
	//查询英语考试
	GsxyEnglishExaminationTable selectEnglishTestIdCard(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//判断普通话考试身份证是否使用
	GsxyEnglishExaminationTable selectEnglishTestIdCard1(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//到处Excel
	//public void export(String[] titles, ServletOutputStream out);
	//考生导出Excel
	void findEnglishExaminationExcel(GsxyEnglishExaminationTable g,String[] titles, ServletOutputStream out,String st1,String st2)throws Exception;
	//查询考期
	ArrayList<GsxySemester>findSemester(GsxySemester gsxySemester,int page, int limit)throws Exception;
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
	//
	GsxyEnglishExaminationTable findEnglishTestByIdCard1(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//根据身份证修改考试编号,和作为编号
	Integer updateAdmissionTicket(GsxyEnglishExaminationTable gsxyEnglishExaminationTable,String st1,String st2,String examination)throws Exception;
	//前台修改考生信息
	Integer updateEnglishTestqt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//前天修改普通话考生信息
	Integer updateGeneralTestqt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	//修改普通话考试
	Integer updateGeneralTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)throws Exception;
	

}
