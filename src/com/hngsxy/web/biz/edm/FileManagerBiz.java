package com.hngsxy.web.biz.edm;

import java.util.ArrayList;

import org.springframework.stereotype.Service;


import com.hngsxy.web.bean.edm.WorkFile;


/**
 * 文件
 * @author 
 *
 */
@Service
public interface FileManagerBiz {
	//查询用户文件夹
	ArrayList<WorkFile> findFile(WorkFile workFile,int page, int limit)throws Exception;
	//查询用户文件夹总数
	Integer findFileTotal(WorkFile workFile)throws Exception;
	//修改文件信息
	Integer updateWorkFile(WorkFile workFile)throws Exception;
	//删除文件
	Integer deleteWorkFile(WorkFile workFile)throws Exception;
	//批量删除文件的方法
	Integer updateFileState (String[] fileIds)throws Exception;
	//文件夹下插入文件
	Integer insertWorkFile(WorkFile workFile) throws Exception;
	//查询一个文件信息
	WorkFile findFileOne(WorkFile workFile) throws Exception;
}
