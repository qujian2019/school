package com.hngsxy.utils;

//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//
//import org.apache.poi.hwpf.HWPFDocument;
//import org.apache.poi.hwpf.usermodel.Range;
//import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
//import org.apache.poi.xwpf.usermodel.XWPFDocument;
//import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTStyles;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.core.FileURIResolver;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.junit.Test;
import org.w3c.dom.Document;

public class WordToHtml {

	public static void main(String[] args) {

		createWord("C:\\","bb.doc");
		
		
		// readAndWriterTest3();
//		try {
//			readAndWriterTest4();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		// Word2007ToHtml();

	}

	// public static void readAndWriterTest3() throws IOException {
	// File file = new File("C:\\bb.doc");
	// String str = "";
	// try {
	// FileInputStream fis = new FileInputStream(file);
	// HWPFDocument doc = new HWPFDocument(fis);
	// String doc1 = doc.getDocumentText();
	// System.out.println(doc1);
	// StringBuilder doc2 = doc.getText();
	// System.out.println(doc2);
	// Range rang = doc.getRange();
	// String doc3 = rang.text();
	// System.out.println(doc3);
	// fis.close();
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	
	//唯一可用的
	public static void readAndWriterTest4() throws IOException {
		// File file = new File("C:\\aa.docx");
		File file = new File("C:\\bb.doc");
		String str = "";
		int temp = 0;
		try {
			// 给出文件路径
			FileInputStream fis = new FileInputStream(file);
			// document
			XWPFDocument xdoc = new XWPFDocument(fis);

			XWPFWordExtractor extractor = new XWPFWordExtractor(xdoc);

			temp = extractor.getText().length();
			System.out.println(temp);
			String doc1 = extractor.getText();
			System.out.println(doc1);
			fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ---------------------------------------------------------

	public static void Word2007ToHtml() throws IOException {
		String filepath = "C:\\";
		String fileName = "aa.docx";
		String htmlName = "aa.html";
		final String file = filepath + fileName;
		File f = new File(file);
		if (!f.exists()) {
			System.out.println("Sorry File does not Exists!");
		} else {
			if (f.getName().endsWith(".docx") || f.getName().endsWith(".DOCX")) {

				// 1) 加载word文档生成 XWPFDocument对象
				InputStream in = new FileInputStream(f);
				XWPFDocument document = new XWPFDocument(in);

				// 2) 解析 XHTML配置 (这里设置IURIResolver来设置图片存放的目录)
				File imageFolderFile = new File(filepath);
				XHTMLOptions options = XHTMLOptions.create().URIResolver(new FileURIResolver(imageFolderFile));
				options.setExtractor(new FileImageExtractor(imageFolderFile));
				options.setIgnoreStylesIfUnused(false);
				options.setFragment(true);

				// 3) 将 XWPFDocument转换成XHTML
				OutputStream out = new FileOutputStream(new File(filepath + htmlName));
				XHTMLConverter.getInstance().convert(document, out, options);

				// 也可以使用字符数组流获取解析的内容
				// ByteArrayOutputStream baos = new ByteArrayOutputStream();
				// XHTMLConverter.getInstance().convert(document, baos, options);
				// String content = baos.toString();
				// System.out.println(content);
				// baos.close();
			} else {
				System.out.println("Enter only MS Office 2007+ files");
			}
		}
	}

	public static void createWord(String path, String fileName) {
		// 判断目录是否存在
		File file = new File(path);
		// exists()测试此抽象路径名表示的文件或目录是否存在。
		// mkdir()创建此抽象路径名指定的目录。
		// mkdirs()创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。
		if (!file.exists())
			file.mkdirs();
		// 因为HWPFDocument并没有提供公共的构造方法 所以没有办法构造word
		// 这里使用word2007及以上的XWPFDocument来进行构造word
		@SuppressWarnings("resource")
		XWPFDocument document = new XWPFDocument();
		OutputStream stream = null;
		try {
			stream = new FileOutputStream(new File(file, fileName));
			document.write(stream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (stream != null)
				;
			try {
				stream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
