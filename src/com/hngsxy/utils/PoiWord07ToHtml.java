package com.hngsxy.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.poi.xwpf.converter.core.BasicURIResolver;
import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

public class PoiWord07ToHtml {
	
	
	
	public static void main(String[] args) {
	
				try {
					PoiWord07ToHtml();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
			

	}
	/** 
	  * word07版本(.docx)转html 
	  * poi:word07在线预览 
	 * @throws IOException 
	  * */  
	 public static void PoiWord07ToHtml () throws IOException{  
	       
	      String path= "C:\\";  
	     String file = "C:\\aa.docx";  
	      String file2 ="C:\\aa.html";  
	     File f = new File(file);    
	      if (!f.exists()) {    
	            System.out.println("Sorry File does not Exists!");    
	        } else {    
	            if (f.getName().endsWith(".docx") || f.getName().endsWith(".DOCX")) {    
	                //读取文档内容    
	                InputStream in = new FileInputStream(f);    
	                XWPFDocument document = new XWPFDocument(in);    
	                  
	                File imageFolderFile = new File(path);    
	                //加载html页面时图片路径  
	                XHTMLOptions options = XHTMLOptions.create().URIResolver( new BasicURIResolver("./"));   
	                //图片保存文件夹路径  
	                options.setExtractor(new FileImageExtractor(imageFolderFile));    
	                OutputStream out = new FileOutputStream(new File(file2));    
	                XHTMLConverter.getInstance().convert(document, out, options);    
	                out.close();    
	            } else {    
	                System.out.println("Enter only MS Office 2007+ files");    
	            }    
	        }     
	          
	 }  
}
