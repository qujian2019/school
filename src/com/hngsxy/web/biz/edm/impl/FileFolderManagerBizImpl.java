package com.hngsxy.web.biz.edm.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.edm.FileFolderManagerMapper;
import com.hngsxy.web.bean.edm.FileFolder;
import com.hngsxy.web.biz.edm.FileFolderManagerBiz;

/**
 * 文件管理业务实现
 * @author 屈健
 *
 */
@Service
@Transactional
public class FileFolderManagerBizImpl implements FileFolderManagerBiz{
	
	//依赖文件夹mapper
	@Autowired
	private FileFolderManagerMapper fileFolderManagerMapper;
	
	//查询文件夹
	@Override
	public List<FileFolder> findFileFolder(FileFolder fileFolder,int page, int limit) throws Exception {
		
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",fileFolder.getUserId());
	        condtion.put("fileFolderName",fileFolder.getFileFolderName());
	        condtion.put("limit", limit);
	        condtion.put("page", page);
		return fileFolderManagerMapper.findFileFolder(condtion);
	}
	//查询用户文件夹总数
	@Override
	public List<FileFolder> findFileFolderTotal(FileFolder fileFolder) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",fileFolder.getUserId());
	        condtion.put("fileFolderName",fileFolder.getFileFolderName());
		return fileFolderManagerMapper.findFileFolderTotal(condtion);
	}

	//添加一个文件夹
	@Override
	public Integer insertFileFolder(FileFolder fileFolder) throws Exception {
		Integer temp = fileFolderManagerMapper.insertFileFolder(fileFolder);
		return temp;
	}
	//修改文件夹信息
	@Override
	public Integer updateFileFolder(FileFolder fileFolder) throws Exception {
		Integer temp = fileFolderManagerMapper.updateFileFolder(fileFolder);
		return temp;
	}
	//删除文件夹
	@Override
	public Integer deleteFileFolder(FileFolder fileFolder) throws Exception {
		Integer temp = fileFolderManagerMapper.deleteFileFolder(fileFolder);
		return temp;
	}
	//逻辑删除,文件夹
	@Override
	public Integer updateFileFolderState(String[] fileFolderIds) throws Exception {
		Integer temp = fileFolderManagerMapper.updateFileFolderState(fileFolderIds);
		return temp;
	}
	//查询一个文件夹信息
	@Override
	public FileFolder findFilefolderOne(Integer fileFolderId) throws Exception {
		FileFolder temp = fileFolderManagerMapper.findFilefolderOne(fileFolderId);
		return temp;
	}


	
	
	
	
	
	
	
	
	
	
	
	

}
