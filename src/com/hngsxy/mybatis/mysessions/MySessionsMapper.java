package com.hngsxy.mybatis.mysessions;


import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hngsxy.web.bean.mysessions.MySessions;
/**
 * MySessionsMapper
 * @author 屈健
 *
 */
@Repository
public interface MySessionsMapper {
	
	Integer insertDoCreate(MySessions mySessions)throws Exception;
	
	ArrayList<String> selectDoReadSession(MySessions mySessions)throws Exception;
	
	Integer updateDoUpdate(MySessions mySessions)throws Exception;
	
	Integer deleteDoDelete(MySessions mySessions)throws Exception;
	
	
}
