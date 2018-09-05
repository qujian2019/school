package com.hngsxy.utils;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.hngsxy.web.bean.gsxysunshineservice.GsxySunshineServiceNews;
import com.hngsxy.web.bean.news.News;

import sun.misc.BASE64Encoder;
/**
 * 生成id和编号
 * @author Administrator
 *
 */
public class IdAndTimeCreateUtil {
	//生成id
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	//生成编号
	public static String getNumber(String str){
		String millisecond = String.valueOf(System.currentTimeMillis());
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String number = str+format.format(date).replace("-", "")+millisecond.substring(millisecond.length()-8, millisecond.length());
		return number;
	}
	//获取当前时间
	public static String getTime(){
		Date date = new Date();
		//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.format(date);
	}
	//获取当前时间 给三级英语考试用
	public static String getTime1(){
		Date date = new Date();
		//SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		return format.format(date);
	}
	/**
	 * 将String字符转为日期
	 * @param dateTime 要转的字符
	 * @return 返回转化的日期
	 */
	public static Calendar getCalendar(String dateTime){
		
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:SSS");
		Calendar calendar=new GregorianCalendar();
		Date date=null;
		try {
			date= sdf.parse(dateTime);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		calendar.setTime(date);
		return calendar;
	}
	/**
	 * 返回两个日历之间相隔多少天
	 * @param cld1 要计算的日历
	 * @param cld2 要计算的日历
	 * @return 返回cld1比cld多多少天
	 */
	public static int compareCalendar(Calendar cld1,Calendar cld2){
		long difference=cld1.getTimeInMillis()-cld2.getTimeInMillis();   
		int day=(int) (difference/(3600*24*1000)); 
		return day;
	}
	
	// 用来对下载的文件名称进行编码的！
	public static String filenameEncoding(String filename, HttpServletRequest request) throws IOException {
		String agent = request.getHeader("User-Agent"); //获取浏览器
		if (agent.contains("Firefox")) {
			BASE64Encoder base64Encoder = new BASE64Encoder();
			filename = "=?utf-8?B?"
					+ base64Encoder.encode(filename.getBytes("utf-8"))
					+ "?=";
		} else if(agent.contains("MSIE")) {
			filename = URLEncoder.encode(filename, "utf-8");
		} else {
			filename = URLEncoder.encode(filename, "utf-8");
		}
		return filename;
	}
	
	//用于端口更换
	public static News replacePortNews(News news,int port) {
		
		int temp01 = 0;
		String temp02 = "";
		if(port == 80) {
		}else {
			temp01 = news.getNewsContext().indexOf("124.228.83.236");
			if(temp01 == -1) {
			}else {
				temp02 = news.getNewsContext().replace("124.228.83.236", "124.228.83.236:"+port);
				//System.out.println(temp02);
				news.setNewsContext(temp02);
			}
		}
		return news;
		
	}
	//用于端口更换
	public static GsxySunshineServiceNews replacePortGsxySunshineServiceNews(GsxySunshineServiceNews news,int port) {
		
		int temp01 = 0;
		String temp02 = "";
		if(port == 80) {
		}else {
			temp01 = news.getNewsContext().indexOf("124.228.83.236");
			if(temp01 == -1) {
			}else {
				temp02 = news.getNewsContext().replace("124.228.83.236", "124.228.83.236:"+port);
				//System.out.println(temp02);
				news.setNewsContext(temp02);
			}
		}
		return news;
		
	}
	
	// 解析Excel文件
    @SuppressWarnings({ "resource", "deprecation" })
	public static ArrayList<Map<Object, String>> parseExcel(InputStream fis) {  
    	ArrayList<Map<Object, String>> data = new ArrayList<Map<Object, String>>();
        try {  
            HSSFWorkbook book = new HSSFWorkbook(fis);  
            HSSFSheet sheet = book.getSheetAt(0);  
            int firstRow = sheet.getFirstRowNum();  
            int lastRow = sheet.getLastRowNum();  
            //除去表头和第一行  
//          ComnDao dao = SysBeans.getComnDao();  
            for(int i = firstRow + 1; i<lastRow+1; i++) {  
                Map<Object, String> map = new HashMap<Object, String>();  
                  
                HSSFRow row = sheet.getRow(i);  
                int firstCell = row.getFirstCellNum();  
                int lastCell = row.getLastCellNum();  
                  
                  
                for(int j=firstCell; j<lastCell; j++) {  
                      
                    HSSFCell cell2 = sheet.getRow(firstRow + 1).getCell(j);  
                    String key = cell2.getStringCellValue();  
                      
                    HSSFCell cell = row.getCell(j);  
                      
                    if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {  
                        cell.setCellType(HSSFCell.CELL_TYPE_STRING);  
                    }  
                    String val = cell.getStringCellValue();  
                      
//              System.out.println(val);  
                      
                    if(i == firstRow + 1) {  
                        break;  
                    }else{  
                        map.put(key, val);  
                          
                    }  
//              System.out.println(map);  
                }  
                if(i != firstRow + 1) {  
                    data.add(map);  
                   // System.out.println(map);  
                }  
            }  
            //System.out.println(data);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return data;  
    }  
	
	
	
	
}
