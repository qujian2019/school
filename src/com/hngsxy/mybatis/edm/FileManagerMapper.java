package com.hngsxy.mybatis.edm;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.hngsxy.web.bean.edm.WorkFile;

@Repository
public interface FileManagerMapper {
	//查询用户文件夹
	ArrayList<WorkFile> findFile(Map<String, Object> condtion)throws Exception;
	//查询用户文件夹总数
	Integer findFileTotal(Map<String, Object> condtion)throws Exception;
	//修改文件信息
	Integer updateWorkFile(WorkFile workFile)throws Exception;
	//删除文件
	Integer deleteWorkFile(WorkFile workFile)throws Exception;
	//批量删除文件的方法
	Integer updateFileState (@Param("fileIds") String[] fileIds)throws Exception;
	//文件夹下插入文件
	Integer insertWorkFile(WorkFile workFile) throws Exception;
	//查询一个文件信息
	WorkFile findFileOne(WorkFile workFile) throws Exception;
}
