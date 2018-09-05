package com.hngsxy.web.controller.clearshirocache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hngsxy.web.shiro.CustomRealm;
/**
 * 文件控制层
 * @author 
 *
 */
@Controller
@RequestMapping(value = "/CustomRealmController")
public class ClearShiroCache {

	//注入realm
	@Autowired
	private CustomRealm customRealm;
	
	//
	@RequestMapping("/clearShiroCache")
	public String clearShiroCache() {
		//清除缓存
		customRealm.clearCached();
		return "success";
	}
	
	
	
}
