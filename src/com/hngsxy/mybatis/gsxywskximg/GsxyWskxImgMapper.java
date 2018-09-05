package com.hngsxy.mybatis.gsxywskximg;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hngsxy.web.bean.gsxywskximg.GsxyWskxImg;

/**
 * 学生Mapper
 * @author 屈健
 *
 */
@Repository
public interface GsxyWskxImgMapper {
	//查询网上看校图片
	ArrayList<GsxyWskxImg> findGsxyWskxImg(Map<String, Object> condtion)throws Exception;
	//查询网上看校图片总数
	Integer findGsxyWskxImgTotal(Map<String, Object> condtion)throws Exception;
	//新增网上看校图片
	Integer insertGsxyWskxImg(GsxyWskxImg gsxyWskxImg)throws Exception;
	//删除网上看校图片
	Integer updateGsxyWskxImgStatus(GsxyWskxImg gsxyWskxImg)throws Exception;
	//查询一个图片信息
	GsxyWskxImg findGsxyWskxImgOne(GsxyWskxImg gsxyWskxImg)throws Exception;
	//修改一个图片信息
	Integer updateGsxyWskxImg(GsxyWskxImg gsxyWskxImg)throws Exception;
	//批量删除图片
	Integer updateGsxyWskxImgStatusBatch(@Param("wskximgIds") String[] wskximgIds)throws Exception;
	//根据图片类型查询信息
	ArrayList<GsxyWskxImg>findGsxyWskxImgByType(GsxyWskxImg gsxyWskxImg)throws Exception;
}
