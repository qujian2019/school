package com.hngsxy.mybatis.edm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.hngsxy.web.bean.edm.FileFolder;
/**
 * 文件管理mapper
 * @author 屈健
 *
 */
@Repository
public interface FileFolderManagerMapper {
	
	//查询用户文件夹
	List<FileFolder> findFileFolder(Map<String, Object> condtion)throws Exception;
	//查询用户文件夹总数
	List<FileFolder> findFileFolderTotal(Map<String, Object> condtion)throws Exception;
	//添加一个文件夹
	Integer insertFileFolder(FileFolder fileFolder)throws Exception;
	//修改文件信息
	Integer updateFileFolder(FileFolder fileFolder)throws Exception;
	//删除文件信息
	Integer deleteFileFolder(FileFolder fileFolder)throws Exception;
	//批量删除文件的方法
	Integer updateFileFolderState (@Param("fileFolderIds") String[] fileFolderIds)throws Exception;
	//查询一个文件夹
	FileFolder findFilefolderOne(Integer fileFolderId)throws Exception;
}
