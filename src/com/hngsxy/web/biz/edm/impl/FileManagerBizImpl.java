package com.hngsxy.web.biz.edm.impl;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.hngsxy.mybatis.edm.FileManagerMapper;

import com.hngsxy.web.bean.edm.WorkFile;
import com.hngsxy.web.biz.edm.FileManagerBiz;
/**
 * 文件impl
 * @author 
 *
 */
@Service
@Transactional
public class FileManagerBizImpl implements FileManagerBiz{
	
	//依赖文件夹mapper
	@Autowired
	private FileManagerMapper fileManagerMapper;
	
	//查询文件
	@Override
	public ArrayList<WorkFile> findFile(WorkFile workFile,int page, int limit) throws Exception {
		
		
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",workFile.getUserId());
	        condtion.put("fileFolderId",workFile.getFileFolderId());
	        condtion.put("fileName",workFile.getFileName());
	        condtion.put("limit", limit);
	        condtion.put("page", page);
	        ArrayList<WorkFile> arr = fileManagerMapper.findFile(condtion);
		return arr;
	}
	//查询文件总数
	@Override
	public Integer findFileTotal(WorkFile workFile) throws Exception {
	     Map<String, Object> condtion = new HashMap<String, Object>();
	        condtion.put("userId",workFile.getUserId());
	        condtion.put("fileFolderId",workFile.getFileFolderId());
	        condtion.put("fileName",workFile.getFileName());
	        Integer temp = fileManagerMapper.findFileTotal(condtion);
		return temp;
	}
	//修改文件信息
	@Override
	public Integer updateWorkFile(WorkFile workFile) throws Exception {
		Integer temp = fileManagerMapper.updateWorkFile(workFile);
		return temp;
	}
	//删除文件
	@Override
	public Integer deleteWorkFile(WorkFile workFile) throws Exception {
		Integer temp = fileManagerMapper.deleteWorkFile(workFile);
		return temp;
	}
	//批量删除
	@Override
	public Integer updateFileState(String[] fileIds) throws Exception {
		Integer temp = fileManagerMapper.updateFileState(fileIds);
		return temp;
	}
	//添加文件
	@Override
	public Integer insertWorkFile(WorkFile workFile) throws Exception {
		Integer temp = fileManagerMapper.insertWorkFile(workFile);
		return temp;
	}
	//查询一个文件信息
	@Override
	public WorkFile findFileOne(WorkFile workFile) throws Exception {
		WorkFile workFileOne = fileManagerMapper.findFileOne(workFile);
		return workFileOne;
	}

}
