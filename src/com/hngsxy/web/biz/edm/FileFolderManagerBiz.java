package com.hngsxy.web.biz.edm;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hngsxy.web.bean.edm.FileFolder;


/**
 * 文件夹管理
 * @author 屈健
 *
 */
@Service
public interface FileFolderManagerBiz {

	//查询用户文件夹
	List<FileFolder> findFileFolder(FileFolder fileFolder,int page, int limit) throws Exception;
	//查询用户文件夹总数
	List<FileFolder> findFileFolderTotal(FileFolder fileFolder)throws Exception;
	//添加一个文件夹
	Integer insertFileFolder(FileFolder fileFolder)throws Exception;
	//修改文件信息
	Integer updateFileFolder(FileFolder fileFolder)throws Exception;
	//删除文件信息
	Integer deleteFileFolder(FileFolder fileFolder)throws Exception;
	//逻辑删除,文件夹
	Integer updateFileFolderState(String[] fileFolderIds)throws Exception;
	//查询一个文件夹
	FileFolder findFilefolderOne(Integer fileFolderId)throws Exception;
}
