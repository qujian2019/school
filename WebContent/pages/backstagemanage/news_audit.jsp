<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<title>新闻审核</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
		<style>
			body {
				margin: 0px;
			}
		</style>
	</head>

	<body>
		<input type="hidden" value="${sessionScope.activeUser.userCode}" id="userName" />
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />

		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">新闻审核</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<div class="layui-upload">
				<button class="layui-btn layui-btn-danger" id="deleteNewsAudit">
						<i class="layui-icon">&#x1006;</i> 批量删除新闻
				</button>
			</div>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>新闻审核列表</legend>
			<div class="demoTable">
				新闻主题查询：
				<div class="layui-inline">
					<input class="layui-input" name="findNewsTitleVal" id="findNewsTitleVal" />
				</div>
				新闻发布人姓名：
				<div class="layui-inline">
					<input class="layui-input" name="findnewsReleaseUser" id="findnewsReleaseUser" />
				</div>
				审核状态:
				<select id="newsAuditStatus" name="newsAuditStatus" lay-verify="">
				  <option value="">请选择</option>
				  <option value="1">未审核</option>
				  <option value="2">审核</option>
				</select>    
				<div class="layui-inline">
						新闻类型：<select id="newType" name="newType" lay-filter="" lay-search lay-verify="required">
							<option value=""></option>
							<c:if test="${activeUser.departments!=null }">
								<c:forEach items="${activeUser.departments}" var="department">
										${department.permissionUrl}"
								</c:forEach>
							</c:if>
						</select>
				</div>
				<button class="layui-btn" id="findNewsTitleBtn">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="findNewsAudit" lay-filter="newsTempId"></table>
			<script type="text/html" id="newsAuditStatusTpl">
				{{# if(d.newsAuditStatus == '1'){ }}
				<span style="color: #C12E2A;">未审核</span> 
				{{# }else if(d.newsAuditStatus == '2'){ }}
				<span style="color: #376B29;">审核通过发往前台</span> 
				{{# } }}
			</script>
			<script type="text/html" id="newTypeTpl">
				{{# if(d.newType == '0'){ }}
				<span>最新信息(学校概况)</span> 
				{{# }else if(d.newType == '1'){ }}
				<span>学校介绍</span> 
				{{# }else if(d.newType == '2'){ }}
				<span>现任领导</span> 
				{{# }else if(d.newType == '50'){ }}
				<span>党的组织</span> 
				{{# }else if(d.newType == '51'){ }}
				<span>党的建设</span> 
				{{# }else if(d.newType == '52'){ }}
				<span>党员活动</span> 
				{{# }else if(d.newType == '53'){ }}
				<span>党的知识</span> 
				{{# }else if(d.newType == '54'){ }}
				<span>光荣榜</span> 
				{{# }else if(d.newType == '55'){ }}
				<span>最新信息(党建工作)</span> 
				
				{{# }else if(d.newType == 'ZSW1'){ }}
				<span>政策法规(招生网)</span> 
				{{# }else if(d.newType == 'ZSW2'){ }}
				<span>招生信息(招生网)</span> 
				{{# }else if(d.newType == 'ZSW3'){ }}
				<span>招生图片(招生网)</span> 
				{{# }else if(d.newType == 'ZSW4'){ }}
				<span>专业介绍(招生网)</span>
				{{# }else if(d.newType == 'ZSW5'){ }}
				<span>招生计划(招生网)</span> 
				{{# }else if(d.newType == 'ZSW6'){ }}
				<span>考生问答(招生网)</span> 
				{{# }else if(d.newType == 'ZSW7'){ }}
				<span>招生章程(招生网)</span> 
				{{# }else if(d.newType == 'ZSW8'){ }}
				<span>地区联络(招生网)</span> 	
				{{# }else if(d.newType == 'ZSW9'){ }}
				<span>来校路线(招生网)</span> 
				{{# }else if(d.newType == 'ZSW10'){ }}
				<span>部门动态(招生网)</span> 
				{{# }else if(d.newType == 'ZSW11'){ }}
				<span>通知公告(招生网)</span>
				{{# }else if(d.newType == 'ZSW12'){ }}
				<span>焦点新闻(招生网)</span> 
				{{# }else if(d.newType == 'ZSW13'){ }}
				<span>下载中心(招生网)</span> 	
				{{# }else if(d.newType == 'ZSW14'){ }}
				<span>部门简介(招生网)</span> 
				{{# }else if(d.newType == 'ZSW15'){ }}
				<span>工作职责(招生网)</span> 
				{{# }else if(d.newType == 'ZSW16'){ }}
				<span>岗位责任(招生网)</span>
				{{# }else if(d.newType == 'ZSW17'){ }}
				<span>人员分工(招生网)</span>
				
				
				{{# }else if(d.newType == 'DZBGS1'){ }}
				<span>部门介绍(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS2'){ }}
				<span>成员介绍(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS3'){ }}
				<span>部门责任(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS4'){ }}
				<span>新闻动态(党政办公室)</span>
				{{# }else if(d.newType == 'DZBGS5'){ }}
				<span>通知公告(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS6'){ }}
				<span>规章制度(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS7'){ }}
				<span>重要文件(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS8'){ }}
				<span>办事指南(党政办公室)</span> 	
				{{# }else if(d.newType == 'DZBGS9'){ }}
				<span>校史年鉴(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS10'){ }}
				<span>党建工作(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS11'){ }}
				<span>资料下载(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS12'){ }}
				<span>职教动态(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS13'){ }}
				<span>媒体报道(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS14'){ }}
				<span>辅导讲座(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS15'){ }}
				<span>人员分工(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS16'){ }}
				<span>学习园地(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS17'){ }}
				<span>上级文件(党政办公室)</span> 
				{{# }else if(d.newType == 'DZBGS18'){ }}
				<span>学习资料(党政办公室)</span> 
				
				
				{{# }else if(d.newType == '10'){ }}
				<span>通知公告(组织人事处)</span> 
				{{# }else if(d.newType == '11'){ }}
				<span>部门新闻(组织人事处)</span> 
				{{# }else if(d.newType == '12'){ }}
				<span>下载中心(组织人事处)</span> 
				{{# }else if(d.newType == '13'){ }}
				<span>教师培训(组织人事处)</span>
				{{# }else if(d.newType == '14'){ }}
				<span>政策文件(组织人事处)</span> 
				{{# }else if(d.newType == '15'){ }}
				<span>职称评定(组织人事处)</span> 
				{{# }else if(d.newType == '16'){ }}
				<span>教师风采(组织人事处)</span> 
				{{# }else if(d.newType == '17'){ }}
				<span>政策导向(组织人事处)</span> 	
				{{# }else if(d.newType == '18'){ }}
				<span>部门职责(组织人事处)</span> 

				{{# }else if(d.newType == '120'){ }}
				<span>部门介绍(就业网)</span> 
				{{# }else if(d.newType == '121'){ }}
				<span>通知公告(就业网)</span> 
				{{# }else if(d.newType == '122'){ }}
				<span>就业政策(就业网)</span> 
				{{# }else if(d.newType == '123'){ }}
				<span>就业指导(就业网)</span>
				{{# }else if(d.newType == '124'){ }}
				<span>就业图片(就业网)</span> 
				{{# }else if(d.newType == '125'){ }}
				<span>职业评测(就业网)</span> 
				{{# }else if(d.newType == '126'){ }}
				<span>创业指导(就业网)</span> 
				{{# }else if(d.newType == '127'){ }}
				<span>就业相关(就业网)</span> 	
				{{# }else if(d.newType == '128'){ }}
				<span>招聘信息(就业网)</span> 
				{{# }else if(d.newType == '129'){ }}
				<span>校友联谊(就业网)</span> 				
				
				{{# }else if(d.newType == 'XSGZC1'){ }}
				<span>图片新闻(学生工作处)</span> 
				{{# }else if(d.newType == 'XSGZC2'){ }}
				<span>通知公告(学生工作处)</span> 
				{{# }else if(d.newType == 'XSGZC3'){ }}
				<span>团学动态(学生工作处)</span> 
				{{# }else if(d.newType == 'XSGZC4'){ }}
				<span>新闻动态(学生工作处)</span>
				{{# }else if(d.newType == 'XSGZC5'){ }}
				<span>学工动态(学生工作处)</span> 
				{{# }else if(d.newType == 'XSGZC6'){ }}
				<span>机构设置(学生工作处)</span> 
				{{# }else if(d.newType == 'XSGZC7'){ }}
				<span>法律法规(学生工作处)</span> 
				{{# }else if(d.newType == 'XSGZC8'){ }}
				<span>思政教育(学生工作处)</span> 	
				{{# }else if(d.newType == 'XSGZC9'){ }}
				<span>评先评优(学生工作处)</span> 
				{{# }else if(d.newType == 'XSGZC10'){ }}
				<span>违纪处理(学生工作处)</span> 	
				{{# }else if(d.newType == 'XSGZC11'){ }}
				<span>宿舍管理(学生工作处)</span> 	
				{{# }else if(d.newType == 'XSGZC12'){ }}
				<span>国防教育(学生工作处)</span> 	
				{{# }else if(d.newType == 'XSGZC13'){ }}
				<span>下载中心(学生工作处)</span> 	
				
				{{# }else if(d.newType == 'ZZB1'){ }}
				<span>图片新闻(中职部)</span> 
				{{# }else if(d.newType == 'ZZB2'){ }}
				<span>系部新闻(中职部)</span> 
				{{# }else if(d.newType == 'ZZB6'){ }}
				<span>中职简介(中职部)</span> 
				{{# }else if(d.newType == 'ZZB7'){ }}
				<span>领导简介(中职部)</span>
				{{# }else if(d.newType == 'ZZB8'){ }}
				<span>联系方式(中职部)</span> 
				{{# }else if(d.newType == 'ZZB9'){ }}
				<span>支部概述(中职部)</span> 
				{{# }else if(d.newType == 'ZZB10'){ }}
				<span>支部活动(中职部)</span> 
				{{# }else if(d.newType == 'ZZB11'){ }}
				<span>党员发展(中职部)</span> 	
				{{# }else if(d.newType == 'ZZB12'){ }}
				<span>学习教育(中职部)</span> 
				{{# }else if(d.newType == 'ZZB13'){ }}
				<span>教学管理(中职部)</span> 	
				{{# }else if(d.newType == 'ZZB14'){ }}
				<span>考试安排(中职部)</span> 	
				{{# }else if(d.newType == 'ZZB15'){ }}
				<span>科学研究(中职部)</span> 	
				{{# }else if(d.newType == 'ZZB16'){ }}
				<span>规章制度(中职部)/span> 	
				{{# }else if(d.newType == 'ZZB17'){ }}
				<span>文体活动(中职部)</span> 	
				{{# }else if(d.newType == 'ZZB18'){ }}
				<span>学生资助(中职部)</span> 	
				{{# }else if(d.newType == 'ZZB19'){ }}
				<span>评先评优(中职部)</span> 					
				{{# }else if(d.newType == 'ZZB20'){ }}
				<span>岗位职责(中职部)</span>
				
				{{# }else if(d.newType == 'HQC1'){ }}
				<span>图片新闻(后勤处)</span> 
				{{# }else if(d.newType == 'HQC2'){ }}
				<span>工作动态(后勤处)</span> 
				{{# }else if(d.newType == 'HQC3'){ }}
				<span>通知公告(后勤处)</span> 
				{{# }else if(d.newType == 'HQC4'){ }}
				<span>规章制度(后勤处)</span> 
				{{# }else if(d.newType == 'HQC5'){ }}
				<span>服务指南(后勤处)</span>
				
				{{# }else if(d.newType == 'KYC1'){ }}
				<span>部门简介(科研处)</span> 
				{{# }else if(d.newType == 'KYC2'){ }}
				<span>新闻动态(科研处)</span> 
				{{# }else if(d.newType == 'KYC3'){ }}
				<span>规章制度(科研处)</span> 
				{{# }else if(d.newType == 'KYC4'){ }}
				<span>科研项目(科研处)</span> 
				{{# }else if(d.newType == 'KYC5'){ }}
				<span>科研成果(科研处)</span>
				{{# }else if(d.newType == 'KYC6'){ }}
				<span>学术交流(科研处)</span> 
				{{# }else if(d.newType == 'KYC7'){ }}
				<span>文件下载(科研处)</span> 
				{{# }else if(d.newType == 'KYC8'){ }}
				<span>学风建设(科研处)</span> 
				{{# }else if(d.newType == 'KYC9'){ }}
				<span>校企合作(科研处)</span>
				
				{{# }else if(d.newType == 'JWC1'){ }}
				<span>通知公告(教务处)</span> 
				{{# }else if(d.newType == 'JWC2'){ }}
				<span>规章制度(教务处)</span> 
				{{# }else if(d.newType == 'JWC3'){ }}
				<span>工作动态(教务处)</span> 
				{{# }else if(d.newType == 'JWC4'){ }}
				<span>文件下载(教务处)</span> 
				{{# }else if(d.newType == 'JWC5'){ }}
				<span>实践教学(教务处)</span>
				{{# }else if(d.newType == 'JWC6'){ }}
				<span>诊改评估(教务处)</span> 
				
				{{# }else if(d.newType == 'SXY1'){ }}
				<span>通知公告(商学院)</span> 
				{{# }else if(d.newType == 'SXY2'){ }}
				<span>学院动态(商学院)</span> 
				{{# }else if(d.newType == 'SXY3'){ }}
				<span>党建工作(商学院)</span> 
				{{# }else if(d.newType == 'SXY4'){ }}
				<span>教学科研(商学院)</span> 
				{{# }else if(d.newType == 'SXY5'){ }}
				<span>专业建设(商学院)</span>
				{{# }else if(d.newType == 'SXY6'){ }}
				<span>下载中心(商学院)</span> 
				{{# }else if(d.newType == 'SXY7'){ }}
				<span>团学工作(商学院)</span>
				{{# }else if(d.newType == 'SXY8'){ }}
				<span>学生工作工作(商学院)</span>
				{{# }else if(d.newType == 'SXY9'){ }}
				<span>部门介绍(商学院)</span>
				
				{{# }else if(d.newType == 'GXY1'){ }}
				<span>通知公告(工学院)</span> 
				{{# }else if(d.newType == 'GXY2'){ }}
				<span>学院动态(工学院)</span> 
				{{# }else if(d.newType == 'GXY3'){ }}
				<span>党建工作(工学院)</span> 
				{{# }else if(d.newType == 'GXY4'){ }}
				<span>教学科研(工学院)</span> 
				{{# }else if(d.newType == 'GXY5'){ }}
				<span>专业建设(工学院)</span>
				{{# }else if(d.newType == 'GXY6'){ }}
				<span>下载中心(工学院)</span> 
				{{# }else if(d.newType == 'GXY7'){ }}
				<span>团学工作(工学院)</span>
				{{# }else if(d.newType == 'GXY8'){ }}
				<span>部门介绍(工学院)</span>
				
				{{# }else if(d.newType == 'CWC1'){ }}
				<span>部门简介(财务处)</span> 
				{{# }else if(d.newType == 'CWC2'){ }}
				<span>规章制度(财务处)</span> 
				{{# }else if(d.newType == 'CWC3'){ }}
				<span>岗位职责(财务处)</span> 
				{{# }else if(d.newType == 'CWC4'){ }}
				<span>服务指南(财务处)</span> 
				{{# }else if(d.newType == 'CWC5'){ }}
				<span>下载中心(财务处)</span>
				{{# }else if(d.newType == 'CWC6'){ }}
				<span>新闻动态(财务处)</span> 
				{{# }else if(d.newType == 'CWC7'){ }}
				<span>通知公告(财务处)</span>
				
				{{# }else if(d.newType == 'DDS1'){ }}
				<span>通知公告(督导室)</span> 
				{{# }else if(d.newType == 'DDS2'){ }}
				<span>下载中心(督导室)</span> 
				{{# }else if(d.newType == 'DDS3'){ }}
				<span>规章制度(督导室)</span> 
				{{# }else if(d.newType == 'DDS4'){ }}
				<span>服务指南(督导室)</span> 
				{{# }else if(d.newType == 'DDS5'){ }}
				<span>督导通报(督导室)</span>
				{{# }else if(d.newType == 'DDS7'){ }}
				<span>计划总结(督导室)</span>
				{{# }else if(d.newType == 'DDS8'){ }}
				<span>图片新闻(督导室)</span> 
				{{# }else if(d.newType == 'DDS9'){ }}
				<span>部门介绍(督导室)</span>
				
				{{# }else if(d.newType == 'SXZX1'){ }}
				<span>部门简介(实训中心)</span> 
				{{# }else if(d.newType == 'SXZX2'){ }}
				<span>岗位设置(实训中心)</span> 
				{{# }else if(d.newType == 'SXZX3'){ }}
				<span>通知公告(实训中心)</span> 
				{{# }else if(d.newType == 'SXZX4'){ }}
				<span>实习实训制度(实训中心)</span> 
				{{# }else if(d.newType == 'SXZX5'){ }}
				<span>省技能抽查考核自读(实训中心)</span>
				{{# }else if(d.newType == 'SXZX6'){ }}
				<span>顶岗实习制度(实训中心)</span>
				{{# }else if(d.newType == 'SXZX7'){ }}
				<span>下载中心(实训中心)</span> 
				{{# }else if(d.newType == 'SXZX8'){ }}
				<span>安全中心(实训中心)</span> 
				
				{{# }else if(d.newType == 'BWC1'){ }}
				<span>通知公告(保卫处)</span> 
				{{# }else if(d.newType == 'BWC2'){ }}
				<span>工作动态(保卫处)</span> 
				{{# }else if(d.newType == 'BWC3'){ }}
				<span>规章制度(保卫处)</span> 
				{{# }else if(d.newType == 'BWC4'){ }}
				<span>服务指南(保卫处)</span> 
				{{# }else if(d.newType == 'BWC6'){ }}
				<span>法律法规(保卫处)</span>
				{{# }else if(d.newType == 'BWC7'){ }}
				<span>图片新闻(保卫处)</span> 
				{{# }else if(d.newType == 'BWC8'){ }}
				<span>业务办理(保卫处)</span>
				{{# }else if(d.newType == 'BWC9'){ }}
				<span>安全教育(保卫处)</span> 
				
				{{# }else if(d.newType == 'ZSXXAPP'){ }}
				<span>招生APP</span> 
				{{# }else if(d.newType == 'ZSAPPDSZ'){ }}
				<span>招生APP董事长</span> 
				{{# }else if(d.newType == 'ZSAPPZZ'){ }}
				<span>招生APP组长</span> 
				{{# }else if(d.newType == 'ZSAPPZY'){ }}
				<span>招生APP组员</span> 
				{{# }else if(d.newType == 'ZSAPPZSXS'){ }}
				<span>招生APP招生学生</span> 
				
				{{# } }}
			</script>
			
			
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="findNes" id="findNes">预览</a>
				<a class="layui-btn layui-btn-mini" lay-event="antiAudit" id="antiAudit">反审核</a>
				<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">审核</a>
				<a class="layui-btn layui-btn-mini" lay-event="edit2" id="edit2">编辑</a>
				<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>

	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
	<script>
		//隐藏复选按钮
		$("#deleteNewsAudit").hide();
		var userName = $("#userName").val();
		var userId = $("#userId").val();
		
		layui.use('table', function() {
			var table = layui.table;

			//方法级渲染
			var tableIns = table.render({
				elem: '#findNewsAudit',
				method: 'post',
				url: '<%=request.getContextPath()%>/NewsController/findSchoolOfficeAudit',
				width: 1200
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						},{
							field: 'newsAuditStatus',
							title: '审核状态',
							sort: true,
							templet: '#newsAuditStatusTpl',
							width: 200
						},{
							field: 'newsTitle',
							title: '新闻标题',
							width: 220
						}, {
							field: 'newsReleaseUser',
							title: '新闻发布者',
							width: 100
						}, {
							field: 'newType',
							title: '新闻类型',
							templet: '#newTypeTpl',
							width: 100
						}, {
							field: 'newsReleaseTime',
							title: '发布时间',
							sort: true,
							width: 220
						}, {
							field: 'newsVisitConut',
							title: '访问量',
							sort: true,
							width: 90
						},{
							fixed: 'right',
							title: '操作',
							toolbar: '#barDemo',
							width: 268,
							align: 'center'
						}
					]
				],
				skin: 'row',
				even: true,
				page: true,
				limits: [10, 20, 30],
				limit: 10,
				id: 'newsTempId' //ID
					,
				where: {

				} //如果无需传递额外参数，可不加该参数
				,
				done: function(res, curr, count) {
					//监听表格复选框选择
					table.on('checkbox(newsTempId)', function(obj) {
						 // console.log(obj.checked); //当前是否选中状态
						if(obj.checked) {
							$("#deleteNewsAudit").show();
						} else {
							$("#deleteNewsAudit").hide();
						}
					});

					//监听工具条
					table.on('tool(newsTempId)', function(obj) {

						var data = obj.data;

						if(obj.event === 'findNes') {
							var url = '<%=request.getContextPath()%>/pages/news/new_gzgt.jsp?newsId='+ data.newsId;
							window.open(url);

						} else if(obj.event === 'del') {
							
							layer.confirm('真的删除行么', function(index) {

								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/NewsController/deleteOneNews",
									data: {
										"newsId": data.newsId,
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteNewsAudit").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({
												where: {
												}
											});
										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit'){
							layer.confirm('真的可以发往前台么', function(index1) {
								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/NewsController/updateNewsAuditStatus",
									data: {
										newsId: data.newsId,
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteNewsAudit").hide();
											layer.msg("审核成功");
											//刷新
											tableIns.reload({
												where: {
												}
											});
										}
									}
								});

								layer.close(index1);
							});
						}else if(obj.event === 'antiAudit'){
							layer.confirm('确定反审核？', function(index2) {
								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/NewsController/updateNewsAntiAudit",
									data: {
										newsId: data.newsId,
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteNewsAudit").hide();
											layer.msg("反审核成功");
											//刷新
											tableIns.reload({
												where: {
												}
											});
										}
									}
								});

								layer.close(index2);
							});
						}else if(obj.event === 'edit2') {
							var dzbgs='dzbgs';
							//var url = "newseditorpage.jsp?newsId=" + data.newsId+"&temp01="+2;
							var url = "/pages/news/newseditorpage.jsp?newsId=" + data.newsId+"&temp02="+dzbgs;
							window.location.href = url;
						}

					});

				}

			});

			$(function() {

				$("#deleteNewsAudit").on("click", function() {
					var checkStatus = table.checkStatus('newsTempId'),
						data = checkStatus.data;

					var temp = "";
					$.each(data, function(i, n) {
						//alert(“索引:”+i,”对应值为：”+n.name);
					
						temp += n.newsId + ",";
					});
					//	console.log(temp)
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/NewsController/updateNewsState",
						data: {
							"newsIds": temp
						},
						async: true,
						//			timeout:1200,
						success: function(data) {
							if(data > 0) {
								//刷新
								$("#deleteNewsAudit").hide();
								layer.msg("删除了" + data + "条数据");
								tableIns.reload({
									where: {
										//userId: userId
									}
								});
							} else {
								layer.msg("删除失败或没有勾选");
							}
						}
					});

				});

				//模糊查询
				$("#findNewsTitleBtn").on("click", function() {
						var findNewsTitleVal = $("#findNewsTitleVal").val();
						var findnewsReleaseUser= $("#findnewsReleaseUser").val();
						var findNewsAuditStatus = $("#newsAuditStatus").val();
						var findnewType = $("#newType").val();
						//$("#deleteFile").hide();
						//刷新也可以用
						tableIns.reload({
							where: {
								//userId: userId,
								newsTitle: findNewsTitleVal,
								newsReleaseUser:findnewsReleaseUser,
								newType:findnewType,
								newsAuditStatus:findNewsAuditStatus
							} //如果无需传递额外参数，可不加该参数
						});
				});

			});

		});
	</script>

</html>