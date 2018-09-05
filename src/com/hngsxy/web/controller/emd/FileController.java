package com.hngsxy.web.controller.emd;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.FileUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.alibaba.fastjson.JSON;
import com.hngsxy.utils.IdAndTimeCreateUtil;
import com.hngsxy.web.bean.edm.FileFolder;
import com.hngsxy.web.bean.edm.WorkFile;
import com.hngsxy.web.biz.edm.impl.FileFolderManagerBizImpl;
import com.hngsxy.web.biz.edm.impl.FileManagerBizImpl;
/**
 * 文件控制层
 * @author 
 *
 */
@Controller
@RequestMapping(value = "/FileController")
public class FileController {

	// 依赖文件夹BIZ
	@Autowired
	private FileManagerBizImpl fileManagerBizImpl;
	@Autowired
	private FileFolderManagerBizImpl fileFolderManagerBizImpl;
	
	// 查询用户文件夹
	@RequestMapping("/findFile")
	@RequiresPermissions("fileFolder:all")
	public void findFileFolder(HttpServletResponse resp,HttpServletRequest req,WorkFile workFile) {

		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1=Integer.parseInt(page);
		int limit1=Integer.parseInt(limit);

        // 分页开始为0
        int index = (page1 - 1) * limit1;

        int size = limit1;

		// 2. 查询数据
		ArrayList<WorkFile> list = null;
		Integer Total = null;
		try {
			list =  fileManagerBizImpl.findFile(workFile,index,size);
			Total = fileManagerBizImpl.findFileTotal(workFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":"+code+",\"count\":" + Total + ",\"data\":" + array + "}";

		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			pw.print(json);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
		

	}
	
	//修改一个文件
	@RequestMapping("/updateWorkFile")
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer updateWorkFile(WorkFile workFile) {

		Integer temp = null;
		try {
			temp = fileManagerBizImpl.updateWorkFile(workFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//删除一个文件
	@RequestMapping("/deleteWorkFile")
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer deleteWorkFile(WorkFile workFile) {

		Integer temp = null;
		try {
			temp = fileManagerBizImpl.deleteWorkFile(workFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}	
	//删除一个或多个文件
	@RequestMapping("/updateFileState")
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer updateFileState(String[] fileIds) {
		
		Integer temp = null;
		try {
			temp = fileManagerBizImpl.updateFileState(fileIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//添加文件
	@RequestMapping(value = "/insertWorkFile", method = { RequestMethod.POST })
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer insertWorkFile(@RequestParam("myfile") MultipartFile myfile,
			HttpServletRequest request, HttpServletResponse response, WorkFile workFile) {
		Integer FileFolderId =workFile.getFileFolderId();
		System.out.println("传入文件夹的ID:" + FileFolderId);
		System.out.println("用户ID:" + workFile.getUserId());
		
		String originalFilename = null;
		
			
			if (myfile.isEmpty()) {
				return 0;
			} else {
				originalFilename = myfile.getOriginalFilename();
				System.out.println("文件原名: " + originalFilename);
				System.out.println("文件名称: " + myfile.getName());
				System.out.println("文件长度: " + myfile.getSize());
				System.out.println("文件类型: " + myfile.getContentType());
				System.out.println("========================================");
			}

		// ------------------------------------------------------------------------------------------------------------

			/*
			 * 1. 得到文件保存的路径 D:\CODE\HYoa1\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps
			 */
//			String root = request.getServletContext().getRealPath("/WEB-INF/files/");
			//String temp = "F:\\temp";
			String temp2 = "D:\\Program Files\\apache-tomcat-8.5.20\\temp";
			
			String root = temp2;
			/*new File("F:/f/temp")
			 * 2. 生成二层目录 1). 得到文件名称 2). 得到hashCode 3). 转发成16进制 4). 获取前二个字符用来生成目录
			 */
			String filename = myfile.getOriginalFilename();// 获取上传的文件名称
			// 计算上传的BM
			Long fileSize = myfile.getSize();
			
			double dd = (double) fileSize;

			double dd2  = dd/1048576;
			 
			String dd3 =dd2+"";
			 
			String dd4 = dd3.substring(0, 4);

			workFile.setFileSize(dd4 + "MB");
			/*
			 * 处理文件名的绝对路径问题
			 */
			int index = filename.lastIndexOf("\\");
			if (index != -1) {
				filename = filename.substring(index + 1);
			}

			// 保存文件名称
			workFile.setFileName(filename);

			/*
			 * 给文件名称添加uuid前缀，处理文件同名问题
			 */
			String savename = IdAndTimeCreateUtil.getUUID() + "_" + filename;

			/*
			 * 1. 得到hashCode
			 */
			int hCode = filename.hashCode();
			// 转成16进制
			String hex = Integer.toHexString(hCode);

			/*
			 * 2. 获取hex的前两个字母，与root连接在一起，生成一个完整的路径
			 */
			File dirFile = new File(root, hex.charAt(0) + "/" + hex.charAt(1));

			/*
			 * 3. 创建目录链
			 */
			dirFile.mkdirs();

			/*
			 * 4. 创建目录文件
			 */
			File destFile = new File(dirFile, savename);
		try {
			String courseFile = destFile.getCanonicalPath();
			/*
			 * 5. 保存
			 */
			System.out.println("保存路径:" + courseFile);
			workFile.setFilePath(courseFile);

			// 写入
			FileUtils.copyInputStreamToFile(myfile.getInputStream(), destFile);

			///////////////////////////////////////////////////////
		} catch (Exception e) {
			System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
			e.printStackTrace();
			return 0;
		}

		Integer temp = null;
		try {
			FileFolder fileFolderTemp = fileFolderManagerBizImpl.findFilefolderOne(FileFolderId);
			
			workFile.setFileAddress(fileFolderTemp.getFileFolderName());
			temp = fileManagerBizImpl.insertWorkFile(workFile);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}

	// 下载文件
	@RequestMapping(value = "/DownloadFile")
	@RequiresPermissions("fileFolder:all")
	public ResponseEntity<byte[]> DownloadFile(HttpServletRequest req, HttpServletResponse resp, WorkFile workFile)
			throws ServletException, IOException {
		
		//  接受的也是UTF-8
		req.setCharacterEncoding("utf-8");
		//  发送的是UTF-8 
		resp.setContentType("text/html;charset=utf-8");
		WorkFile WorkFileOne = null;
		File file= null;
		HttpHeaders headers = null;
		//1.查询文件的详细信息获取文件地址和文件名称
		try {
			
			//通过ID获取文件名和文件夹
			WorkFileOne = fileManagerBizImpl.findFileOne(workFile);
			

			String fileName = WorkFileOne.getFileName();
			System.out.println(fileName);//文件名
			String filePath = WorkFileOne.getFilePath();
			System.out.println(filePath);//文件路径
		//2.下载的代码
			 file =new File(WorkFileOne.getFilePath());
			
			 headers = new HttpHeaders();
			 
			 String fileName1=new String(WorkFileOne.getFileName().getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题  
			//String fileName1 = IdAndTimeCreateUtil.filenameEncoding(fileName, req);
			//处理文件名乱码
			headers.setContentDispositionFormData("attachment", fileName1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
				headers, HttpStatus.CREATED);
	}
	
	//文件预览
	@RequestMapping(value = "/PreviewFile")
	@RequiresPermissions("fileFolder:all")
	public ResponseEntity<byte[]> PreviewFile(
	HttpServletRequest Request,HttpServletResponse response,WorkFile workFile) throws IOException
	{
		//  接受的也是UTF-8
		Request.setCharacterEncoding("utf-8");
		//  发送的是UTF-8 
		response.setContentType("text/html;charset=utf-8");
		Integer getFileId = workFile.getFileId();
		System.out.println(getFileId);//文件名
		HttpHeaders httpHeaders = new HttpHeaders();
		
		WorkFile WorkFileOne = null;
		try {
			WorkFileOne = fileManagerBizImpl.findFileOne(workFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String fileName1 = WorkFileOne.getFileName();
		System.out.println(fileName1);//文件名
		String filePath = WorkFileOne.getFilePath();
		System.out.println(filePath);//文件路径
		
		String path = filePath.substring(filePath.lastIndexOf(".")+1, filePath.length());
		System.out.println(path);//文件路径
		//可用
		if(path.equals("pdf")){
			httpHeaders.setContentType(MediaType.parseMediaType("application/pdf"));
		} else if(path.equals("xml")){
			httpHeaders.setContentType(MediaType.parseMediaType("text/xml"));
		} 
		else if(path.equals("xhtml")){
			httpHeaders.setContentType(MediaType.parseMediaType("text/html"));
		} 
		else if(path.equals("ppt")){
			httpHeaders.setContentType(MediaType.parseMediaType("application/x-ppt"));
		} 
		else if(path.equals("mp4")){
			httpHeaders.setContentType(MediaType.parseMediaType("video/mpeg4"));
		} 
		else if(path.equals("jpg")){
			httpHeaders.setContentType(MediaType.parseMediaType("application/x-jpg"));
		} 
		else if(path.equals("img")){
			httpHeaders.setContentType(MediaType.parseMediaType("application/x-img"));
		} 
		else if(path.equals("doc")){
			httpHeaders.setContentType(MediaType.parseMediaType("application/msword"));
		} 
		else if(path.equals("html")){
			httpHeaders.setContentType(MediaType.parseMediaType("text/html"));
		} 
		//可用
		else if(path.equals("png")){
			httpHeaders.setContentType(MediaType.parseMediaType("image/png"));
		} 
		else if(path.equals("wma")){
			httpHeaders.setContentType(MediaType.parseMediaType("audio/x-ms-wma"));
		}else {
			httpHeaders.setContentType(MediaType.parseMediaType("*/*"));
		}

		File file = new File(filePath);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
		        httpHeaders,
		        HttpStatus.OK);
	}

}
