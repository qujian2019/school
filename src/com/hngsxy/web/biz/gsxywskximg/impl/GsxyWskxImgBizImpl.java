package com.hngsxy.web.biz.gsxywskximg.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hngsxy.mybatis.gsxywskximg.GsxyWskxImgMapper;
import com.hngsxy.web.bean.gsxywskximg.GsxyWskxImg;
import com.hngsxy.web.biz.gsxywskximg.GsxyWskxImgBiz;

@Service
@Transactional
public class GsxyWskxImgBizImpl implements GsxyWskxImgBiz{
	
	@Autowired
	private GsxyWskxImgMapper gsxyWskxImgMapper;
	//查询网上看校图片
	@Override
	public ArrayList<GsxyWskxImg> findGsxyWskxImg(GsxyWskxImg gsxyWskxImg,int page, int limit) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("wskximgName", gsxyWskxImg.getWskximgName());
		condtion.put("wskximgType", gsxyWskxImg.getWskximgType());
		condtion.put("limit", limit);
		condtion.put("page", page);
		return gsxyWskxImgMapper.findGsxyWskxImg(condtion);
	}
	//查询网上看校图片总数
	@Override
	public Integer findGsxyWskxImgTotal(GsxyWskxImg gsxyWskxImg) throws Exception {
		Map<String, Object> condtion = new HashMap<String, Object>();
		condtion.put("wskximgName", gsxyWskxImg.getWskximgName());
		condtion.put("wskximgType", gsxyWskxImg.getWskximgType());
		return gsxyWskxImgMapper.findGsxyWskxImgTotal(condtion);
	}
	//新增图片信息
	@Override
	public Integer insertGsxyWskxImg(GsxyWskxImg gsxyWskxImg) throws Exception {
		return gsxyWskxImgMapper.insertGsxyWskxImg(gsxyWskxImg);
	}
	//删除图片信息
	@Override
	public Integer updateGsxyWskxImgStatus(GsxyWskxImg gsxyWskxImg) throws Exception {
		return gsxyWskxImgMapper.updateGsxyWskxImgStatus(gsxyWskxImg);
	}
	//查询一个图片信息
	@Override
	public GsxyWskxImg findGsxyWskxImgOne(GsxyWskxImg gsxyWskxImg) throws Exception {
		return gsxyWskxImgMapper.findGsxyWskxImgOne(gsxyWskxImg);
	}
	//修改一个图片信息
	@Override
	public Integer updateGsxyWskxImg(GsxyWskxImg gsxyWskxImg) throws Exception {
		return gsxyWskxImgMapper.updateGsxyWskxImg(gsxyWskxImg);
	}
	//批量删除图片
	@Override
	public Integer updateGsxyWskxImgStatusBatch(String[] wskximgIds) throws Exception {
		return gsxyWskxImgMapper.updateGsxyWskxImgStatusBatch(wskximgIds);
	}
	//根据图片类型查询
	@Override
	public ArrayList<GsxyWskxImg> findGsxyWskxImgByType(GsxyWskxImg gsxyWskxImg) throws Exception {
		return gsxyWskxImgMapper.findGsxyWskxImgByType(gsxyWskxImg);
	}

}
