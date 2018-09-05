package com.hngsxy.web.controller.emd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.hngsxy.web.bean.edm.FileFolder;
import com.hngsxy.web.biz.edm.impl.FileFolderManagerBizImpl;



/**
 * 文件夹控制器
 * 
 * @author 屈健
 *
 */
@Controller
@RequestMapping(value = "/FileFolderController")
public class FileFolderController {

	// 依赖文件夹BIZ
	@Autowired
	private FileFolderManagerBizImpl fileFolderManagerBizImpl;

	// 查询用户文件夹
	@RequestMapping("/findFileFolder")
	@RequiresPermissions("fileFolder:all")//执行queryItems需要"item:query"权限
	public void findFileFolder(HttpServletResponse resp,HttpServletRequest req,FileFolder fileFolder) {
//		System.out.println(fileFolder.getFileFolderName());
		
		String page = req.getParameter("page");
		String limit = req.getParameter("limit");
		int page1=Integer.parseInt(page);
		int limit1=Integer.parseInt(limit);

        // 分页开始为0
        int index = (page1 - 1) * limit1;

        int size = limit1;

		// 2. 查询数据
		ArrayList<FileFolder> list = null;
		ArrayList<FileFolder> Total = null;
		try {
			list = (ArrayList<FileFolder>) fileFolderManagerBizImpl.findFileFolder(fileFolder,index,size);
			Total = (ArrayList<FileFolder>) fileFolderManagerBizImpl.findFileFolderTotal(fileFolder);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String array = JSON.toJSONString(list);

		int code = 0;
		// 6.需要返回的数据有总记录数和行数据
		String json = "{\"code\":"+code+",\"count\":" + Total.size() + ",\"data\":" + array + "}";
//		System.out.println(json.toString());
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

	//添加一个文件夹
	@RequestMapping("/insertFileFolder")
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer insertFileFolder(FileFolder fileFolder) {

		Integer temp = null;
		try {
			temp = fileFolderManagerBizImpl.insertFileFolder(fileFolder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	//修改一个文件夹
	@RequestMapping("/updateFileFolder")
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer updateFileFolder(FileFolder fileFolder) {

		Integer temp = null;
		try {
			temp = fileFolderManagerBizImpl.updateFileFolder(fileFolder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}	
	
	//删除一个文件夹
	@RequestMapping("/deleteFileFolder")
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer deleteFileFolder(FileFolder fileFolder) {
		
		Integer temp = null;
		try {
			temp = fileFolderManagerBizImpl.deleteFileFolder(fileFolder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}		
	
	//删除一个或多个文件夹
	@RequestMapping("/updateFileFolderState")
	@RequiresPermissions("fileFolder:all")
	public @ResponseBody Integer updateFileFolderState(String[] fileFolderIds) {
		
		Integer temp = null;
		try {
			temp = fileFolderManagerBizImpl.updateFileFolderState(fileFolderIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}	
	
	
	
	
	

}
