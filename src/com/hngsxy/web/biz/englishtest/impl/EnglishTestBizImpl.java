package com.hngsxy.web.biz.englishtest.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.englishtest.EnglishTestMapper;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxyEnglishExaminationTable;
import com.hngsxy.web.bean.gsxyenglishexamination.GsxySemester;
import com.hngsxy.web.biz.englishtest.EnglishTestBiz;
/**
 * 英语三级考试
 * @author 
 *
 */
@Service
@Transactional
public class EnglishTestBizImpl implements EnglishTestBiz{
	
	//依赖文件夹mapper
	@Autowired
	private EnglishTestMapper englishTestMapper;
	
	//新增考试信息
	@Override
	public Integer insertEnglishTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.insertEnglishTest(gsxyEnglishExaminationTable);
	}
	//学生录入信息查询
	@Override
	public ArrayList<GsxyEnglishExaminationTable> findEnglishExamination(GsxyEnglishExaminationTable g,int page, int limit)
			throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("idcard", g.getIdcard());
		condtion.put("examination", g.getExamination());
		condtion.put("limit", limit);
		condtion.put("page", page);

		return englishTestMapper.findEnglishExamination(condtion);
	}
	
	//普通话等级考试
	@Override
	public ArrayList<GsxyEnglishExaminationTable> findGeneralTest(GsxyEnglishExaminationTable g,int page, int limit)
			throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("idcard", g.getIdcard());
		condtion.put("examination", g.getExamination());
		condtion.put("limit", limit);
		condtion.put("page", page);

		return englishTestMapper.findGeneralTest(condtion);
	}
	
	
	//删除一个学生信息
	@Override
	public Integer updateExaminationStatus(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.updateExaminationStatus(gsxyEnglishExaminationTable);
	}
	//查询一个报考信息
	@Override
	public GsxyEnglishExaminationTable selectGsxyEnglishExaminationTableOne(
			GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.selectGsxyEnglishExaminationTableOne(gsxyEnglishExaminationTable);
	}
	//修改一个报考信息
	@Override
	public Integer updateEnglishTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.updateEnglishTestYY(gsxyEnglishExaminationTable);
	}
	//批量删除
	@Override
	public Integer updateEnglishTestState(String[] ids) throws Exception {
		return englishTestMapper.updateEnglishTestState(ids);
	}
	//查询英语考试
	@Override
	public GsxyEnglishExaminationTable selectEnglishTestIdCard(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.selectEnglishTestIdCard(gsxyEnglishExaminationTable);
	}
	//查询英语考试
	@Override
	public GsxyEnglishExaminationTable selectEnglishTestIdCard1(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.selectEnglishTestIdCard1(gsxyEnglishExaminationTable);
	}
	
	//查询考生信息导出Excel
	@Override
	public void findEnglishExaminationExcel(GsxyEnglishExaminationTable g,String[] titles, ServletOutputStream out,String st1,String st2)
			throws Exception {
		
					Map<String, Object> condtion = new HashMap<String, Object>();
					condtion.put("idcard", g.getIdcard());
					condtion.put("examination", g.getExamination());
					condtion.put("st1", st1);
					condtion.put("st2", st2);

					ArrayList<GsxyEnglishExaminationTable> list = englishTestMapper.findEnglishExaminationExcel(condtion);

		         try{
			             // 第一步，创建一个workbook，对应一个Excel文件
			             HSSFWorkbook workbook = new HSSFWorkbook();
			             // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
			             HSSFSheet hssfSheet = workbook.createSheet("sheet1");
			             // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			             HSSFRow hssfRow = hssfSheet.createRow(0);
			             // 第四步，创建单元格，并设置值表头 设置表头居中
			             HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
			             //居中样式
			             //hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			 
			             HSSFCell hssfCell = null;
			             for (int i = 0; i < titles.length; i++) {
			                 hssfCell = hssfRow.createCell(i);//列索引从0开始
			                 hssfCell.setCellValue(titles[i]);//列名1
			                 hssfCell.setCellStyle(hssfCellStyle);//列居中显示                
			             }
			             
			             // 第五步，写入实体数据 
			            // ArrayList<GsxyEnglishExaminationTable> users = userDAO.query();            
			 
			            // SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			             
			             if(list != null && !list.isEmpty()){
			                 for (int i = 0; i < list.size(); i++) {
			                     hssfRow = hssfSheet.createRow(i+1);                
			                     GsxyEnglishExaminationTable g1 = list.get(i);
			                     
			                     // 第六步，创建单元格，并设置值
//			                     String idcard = "";
//			                     if(g1.getIdcard() != null){
//			                    	 idcard = g1.getIdcard();
//			                     }
			                     hssfRow.createCell(0).setCellValue(g1.getIdcard());
			                     
//			                     String studentName = "";
//			                     if(g1.getStudentName() != null){
//			                    	 studentName = g1.getStudentName();
//			                     }
			                     hssfRow.createCell(1).setCellValue(g1.getStudentName());
			                     
//			                     String studentsex = "";
			                     String sex = "";
//			                     if(g1.getStudentsex() != null){
//			                    	 studentsex = g1.getStudentsex();
			                    	 if("1".equals(g1.getStudentsex())) {
			                    		 sex ="男";
			                    	 }else if("2".equals(g1.getStudentsex())){
			                    		 sex ="女";
			                    	 }
//			                     }
			                     hssfRow.createCell(2).setCellValue(sex);
			                     
//			                     String campus = "";
//			                     if(g1.getCampus() != null){
//			                    	 campus = g1.getCampus();
//			                     }
			                     hssfRow.createCell(3).setCellValue(g1.getCampus());
			                     
			                     hssfRow.createCell(4).setCellValue(g1.getCollege());

			                     
//			                     String factions = "";
//			                     if(g1.getFactions() != null){
//			                    	 campus = g1.getFactions();
//			                     }
			                     hssfRow.createCell(5).setCellValue(g1.getFactions());
			                     
//			                     String classNumber = "";
//			                     if(g1.getCampus() != null){
//			                    	 classNumber = g1.getClassNumber();
//			                     }
			                     hssfRow.createCell(6).setCellValue(g1.getClassNumber());
			                     
//			                     String schoolNumber = "";
//			                     if(g1.getSchoolNumber() != null){
//			                    	 schoolNumber = g1.getSchoolNumber();
//			                     }
			                     hssfRow.createCell(7).setCellValue(g1.getSchoolNumber());
			                     
//			                     String enrollmentYear = "";
//			                     if(g1.getEnrollmentYear() != null){
//			                    	 enrollmentYear = g1.getEnrollmentYear();
//			                     }
			                     hssfRow.createCell(8).setCellValue(g1.getEnrollmentYear());
			                     
//			                     String major = "";
//			                     if(g1.getMajor() != null){
//			                    	 major = g1.getMajor();
//			                     }
			                     hssfRow.createCell(9).setCellValue(g1.getMajor());
			                     
			                     
			                     hssfRow.createCell(10).setCellValue(g1.getNation());
			                     
			                     hssfRow.createCell(11).setCellValue(g1.getClassType());
			                     
			                     hssfRow.createCell(12).setCellValue(g1.getTelePhone());
 
			                 }
			             }
			             
			             // 第七步，将文件输出到客户端浏览器
			             try {
			                 workbook.write(out);
			                 out.flush();
			                 out.close();
			 
			             } catch (Exception e) {
			                 e.printStackTrace();
			             }
			         }catch(Exception e){
			             e.printStackTrace();
			             throw new Exception("导出信息失败！");
			         }    
			     }
	//查询学期
	@Override
	public ArrayList<GsxySemester> findSemester(GsxySemester gsxySemester,int page, int limit) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("limit", limit);
		condtion.put("page", page);
		return englishTestMapper.findSemester(condtion);
	}
	//新增学期
	@Override
	public Integer insertSemester(GsxySemester gsxySemester) throws Exception {
		return englishTestMapper.insertSemester(gsxySemester);
	}
	//删除一个考期
	@Override
	public Integer updateSemesterStatus(GsxySemester gsxySemester) throws Exception {
		return englishTestMapper.updateSemesterStatus(gsxySemester);
	}
	//修改一个考期名称
	@Override
	public Integer updateSemesterName(GsxySemester gsxySemester) throws Exception {
		return englishTestMapper.updateSemesterName(gsxySemester);
	}
	//查询考期名称
	@Override
	public ArrayList<GsxySemester> selectSemesterByTow() throws Exception {
		return englishTestMapper.selectSemesterByTow();
	}
	//报考通过
	@Override
	public Integer updateEnglishTestStateByAdopt(GsxyEnglishExaminationTable g)
			throws Exception {
		return englishTestMapper.updateEnglishTestStateByAdopt(g);
	}
	//不通过理由
	@Override
	public Integer updateEnglishTestUnqualifiedReason(GsxyEnglishExaminationTable g)
			throws Exception {
		return englishTestMapper.updateEnglishTestUnqualifiedReason(g);
	}
	//考生查询报考状态
	@Override
	public GsxyEnglishExaminationTable findEnglishTestByIdCard(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)
			throws Exception {
		return englishTestMapper.findEnglishTestByIdCard(gsxyEnglishExaminationTable);
	}
	//根据身份证修改 考试编号,和作为编号
	@Override
	public Integer updateAdmissionTicket(GsxyEnglishExaminationTable g,String st1,String st2,String examination) throws Exception {
				Map<String, Object> condtion = new HashMap<String, Object>();
				condtion.put("admissionTicket", g.getAdmissionTicket());
				condtion.put("centreNo", g.getCentreNo());
				condtion.put("idcard", g.getIdcard());
				condtion.put("examination", examination);
				
				condtion.put("st1", st1);
				condtion.put("st2", st2);

		return englishTestMapper.updateAdmissionTicket(condtion);
	}
	//普通话考生状态
	@Override
	public GsxyEnglishExaminationTable findEnglishTestByIdCard1(GsxyEnglishExaminationTable gsxyEnglishExaminationTable)
			throws Exception {
		return englishTestMapper.findEnglishTestByIdCard1(gsxyEnglishExaminationTable);
	}
	//前台修改考生信息
	@Override
	public Integer updateEnglishTestqt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.updateEnglishTestqt(gsxyEnglishExaminationTable);
	}
	
	@Override
	public Integer findEnglishExaminationTotal(GsxyEnglishExaminationTable g)
			throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("idcard", g.getIdcard());
		condtion.put("examination", g.getExamination());

		// TODO Auto-generated method stub
		return englishTestMapper.findEnglishExaminationTotal(condtion);
	}
	@Override
	public Integer findGeneralTestTotal(GsxyEnglishExaminationTable g) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("idcard", g.getIdcard());
		condtion.put("examination", g.getExamination());

		return englishTestMapper.findGeneralTestTotal(condtion);
	}
	//添加普通话考试
	@Override
	public Integer insertGeneralTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.insertGeneralTest(gsxyEnglishExaminationTable);
	}
	//修改普通话考生信息
	@Override
	public Integer updateGeneralTestqt(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.updateGeneralTestqt(gsxyEnglishExaminationTable);
	}
	//修改普通话考试考生
	@Override
	public Integer updateGeneralTest(GsxyEnglishExaminationTable gsxyEnglishExaminationTable) throws Exception {
		return englishTestMapper.updateGeneralTestPt(gsxyEnglishExaminationTable);
	}
	
	

}
