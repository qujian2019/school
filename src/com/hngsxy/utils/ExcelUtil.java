package com.hngsxy.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.hngsxy.web.bean.gsxyenglishexamination.GsxyEnglishExaminationTable;

public class ExcelUtil {
	// 第一个参数给文件路径,第二个参数给出Excel文件的数据头
	public static ArrayList<Map<String, String>> analysis(String filePath, String columns[]) {
		// ZhenShu zhenShu = new ZhenShu();
		Workbook wb = null;
		Sheet sheet = null;
		Row row = null;
		// List<Map<String,String>> list = null;
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
		String cellData = null;
		// String filePath = "D:\\test.xlsx";
		// String columns [] =
		// {"id","title","pic","content","classid","adddate","idcard","data","rank","sex","yy","mm","dd","culture"};
		wb = readExcel(filePath);
		if (wb != null) {
			// 用来存放表中数据
			// list = new ArrayList<Map<String,String>>();
			// 获取第一个sheet
			sheet = wb.getSheetAt(0);
			// 获取最大行数
			int rownum = sheet.getPhysicalNumberOfRows();
			// 获取第一行
			row = sheet.getRow(0);
			// 获取最大列数
			int colnum = row.getPhysicalNumberOfCells();
			for (int i = 1; i < rownum; i++) {
				Map<String, String> map = new LinkedHashMap<String, String>();
				row = sheet.getRow(i);
				if (row != null) {
					for (int j = 0; j < colnum; j++) {
						cellData = (String) getCellFormatValue(row.getCell(j));
						map.put(columns[j], cellData);
					}
				} else {
					break;
				}
				list.add(map);
			}
		}
		// 遍历解析出来的list
		// for (Map<String,String> map : list) {
		//
		// for (Entry<String,String> entry : map.entrySet()) {
		// //这里可以添加数据到数据库呢~
		//// System.out.print(entry.getKey()+":"+entry.getValue()+",");
		// }
		// System.out.println();
		//
		// }
		return list;

	}

	// 读取excel
	public static Workbook readExcel(String filePath) {
		Workbook wb = null;
		if (filePath == null) {
			return null;
		}
		String extString = filePath.substring(filePath.lastIndexOf("."));
		InputStream is = null;
		try {
			is = new FileInputStream(filePath);
			if (".xls".equals(extString)) {
				return wb = new HSSFWorkbook(is);
			} else if (".xlsx".equals(extString)) {
				return wb = new XSSFWorkbook(is);
			} else {
				return wb = null;
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return wb;
	}

	public static Object getCellFormatValue(Cell cell) {
		Object cellValue = null;
		if (cell != null) {
			// 判断cell类型
			switch (cell.getCellType()) {
			case Cell.CELL_TYPE_NUMERIC: {
				cellValue = String.valueOf(cell.getNumericCellValue());
				break;
			}
			case Cell.CELL_TYPE_FORMULA: {
				// 判断cell是否为日期格式
				if (DateUtil.isCellDateFormatted(cell)) {
					// 转换为日期格式YYYY-mm-dd
					cellValue = cell.getDateCellValue();
				} else {
					// 数字
					cellValue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			case Cell.CELL_TYPE_STRING: {
				cellValue = cell.getRichStringCellValue().getString();
				break;
			}
			default:
				cellValue = "";
			}
		} else {
			cellValue = "";
		}
		return cellValue;
	}

	// 导出Excel
	public void export(String[] titles, ServletOutputStream out) throws Exception {
		try {
			// 第一步，创建一个workbook，对应一个Excel文件
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
			HSSFSheet hssfSheet = workbook.createSheet("sheet1");
			// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
			HSSFRow hssfRow = hssfSheet.createRow(0);
			// 第四步，创建单元格，并设置值表头 设置表头居中
			HSSFCellStyle hssfCellStyle = workbook.createCellStyle();
			// 居中样式
			// hssfCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			// hssfCellStyle.getAlignment();

			HSSFCell hssfCell = null;
			for (int i = 0; i < titles.length; i++) {
				hssfCell = hssfRow.createCell(i);// 列索引从0开始
				hssfCell.setCellValue(titles[i]);// 列名1
				hssfCell.setCellStyle(hssfCellStyle);// 列居中显示
			}

			// 第五步，写入实体数据
			// ArrayList<GsxyEnglishExaminationTable> users = userDAO.query();

			// SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			// if(users != null && !users.isEmpty()){
			// for (int i = 0; i < users.size(); i++) {
			// hssfRow = hssfSheet.createRow(i+1);
			// //User user = users.get(i);
			//
			// // 第六步，创建单元格，并设置值
			//// int userid = 0;
			//// if(user.getId() != 0){
			//// userid = user.getId();
			//// }
			// hssfRow.createCell(0).setCellValue(userid);
			// String username = "";
			// if(user.getName() != null){
			// username = user.getName();
			// }
			// hssfRow.createCell(1).setCellValue(username);
			// String password = "";
			// if(user.getPassword() != null){
			// password = user.getPassword();
			// }
			// hssfRow.createCell(2).setCellValue(password);
			// int age = 0;
			// if(user.getAge() != 0){
			// age = user.getAge();
			// }
			// hssfRow.createCell(3).setCellValue(age);
			// }
			// }

			// 第七步，将文件输出到客户端浏览器
			try {
				workbook.write(out);
				out.flush();
				out.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("导出信息失败！");
		}
	}

}
