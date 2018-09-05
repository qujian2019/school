package com.hngsxy.web.biz.gsxywskximg;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.hngsxy.web.bean.gsxywskximg.GsxyWskxImg;

/**
 * 网上看校biz
 * @author 屈健
 *
 */
@Service
public interface GsxyWskxImgBiz {
	//查询网上看校图片
	ArrayList<GsxyWskxImg> findGsxyWskxImg(GsxyWskxImg gsxyWskxImg,int page, int limit)throws Exception;
	//查询网上看校图片总数
	Integer findGsxyWskxImgTotal(GsxyWskxImg gsxyWskxImg)throws Exception;
	//新增网上看校图片
	Integer insertGsxyWskxImg(GsxyWskxImg gsxyWskxImg)throws Exception;
	//删除网上看校图片
	Integer updateGsxyWskxImgStatus(GsxyWskxImg gsxyWskxImg)throws Exception;
	//查询一个图片信息
	GsxyWskxImg findGsxyWskxImgOne(GsxyWskxImg gsxyWskxImg)throws Exception;
	//修改一个图片信息
	Integer updateGsxyWskxImg(GsxyWskxImg gsxyWskxImg)throws Exception;
	//批量删除新闻
	Integer updateGsxyWskxImgStatusBatch(String[] wskximgIds)throws Exception;
	//根据图片类型查询信息
	ArrayList<GsxyWskxImg>findGsxyWskxImgByType(GsxyWskxImg gsxyWskxImg)throws Exception;
}
