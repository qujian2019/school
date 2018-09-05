package com.hngsxy.utils;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.jdbc.core.JdbcTemplate;
 
 
/*
 * 		
 * 	jdbc工具类
 * 
 * 
 */
public class JdbcTemplateUtils {
 
    private static JdbcTemplate jdbcTemplate;
    
    private static  DruidDataSource ds;

    public static DruidDataSource getDs() {
		return ds;
	}

	public static JdbcTemplate jdbcTemplate() {
        if(jdbcTemplate == null) {
            jdbcTemplate = createJdbcTemplate();
        }
        return jdbcTemplate;
    }
 
    private static JdbcTemplate createJdbcTemplate() {
 
       
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        //ds.setUrl("jdbc:mysql://localhost:3306/shiro");jdbc:mysql://172.16.1.82:3306/schooldata
        ds.setUrl("jdbc:mysql://172.16.1.82:3306/schooldata");
        ds.setUsername("root");
        ds.setPassword("quickjian");
        
        
        return new JdbcTemplate(ds);
    }
 
}