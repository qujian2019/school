<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<title>员工管理平台</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
		<style>
			body {
				margin: 0px;
			}
			
			.height-inherit {
				position: absolute;
				height: 100%;
				width: 100%;
			}
		</style>
	</head>
	<body>
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo" id="logogsxy">湖南工商职业学院</div>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				<ul class="layui-nav layui-layout-left">
				</ul>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
						<a href="javascript:;">
							<!--<img src="http://t.cn/RCzsdCq" class="layui-nav-img">-->欢迎:${sessionScope.activeUser.userName}
							<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="basicdata">基本资料</a>
							</dd>
							<!--					<dd>
							<a href="">安全设置</a>
						</dd>-->
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="<%=request.getContextPath()%>/logout">退出</a>
					</li>
				</ul>
			</div>
			<!-- 导航条 -->
			<div class="layui-side layui-bg-black" id="dhtZ">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">后台管理</a>
							<dl class="layui-nav-child">
								<c:if test="${activeUser.menus!=null }">
									<ul>
										<c:forEach items="${activeUser.menus}" var="menu">
											<dd>
												<a id="${menu.permissionUrl}">${menu.permissionName}</a>
											</dd>
										</c:forEach>
									</ul>
								</c:if>
								<!--<a id="certificate_management">证书管理</a>-->
						</li>
					  <li class="layui-nav-item">
					    <a href="javascript:;">个人管理</a>
					    <dl class="layui-nav-child">
					      <dd><a href="javascript:;" id="grglym">个人管理页面</a></dd>
					    </dl>
					  </li>
					</ul>

				</div>
			</div>
			<!--
			去掉上下的滚动条 overflow="foo" overflow-x:scroll overflow-x:visible
        -->
			<div style="overflow: hidden;" class="layui-body">
			<!--	内容主体区域 1-->
				<iframe class="height-inherit" src="usermanag.jsp" id="mianIframe" frameborder="0">

				</iframe>
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© hngsxy.com
			</div>
		</div>
	</body>

	<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
    <script type="text/javascript" language="javascript">        
//  $(window).unbeforeunload(function(){
//  alert('xxx');
//					$.ajax({
//						type: "post",
//						url: "/logout",
//						data: {},
//						async: true,
//						dateType: "json",
//						//timeout:12000,
//						success: function(data) {
//						}
//					});
//  }); 
    </script>
	<script>

//jQuery(window).unload(function(){
//
//
//		});

		$(function(){
			var left;
			//隐藏导航卡
			$('#logogsxy').on('click',function(){
				$("#dhtZ").toggle(1000,function(){
					//$('#mianIframe').addClass("layui-col-md12");style="width: 100%;"
					
					if(	$(".layui-body").css("left")=="0px"){
						$(".layui-body").css({"left":left});
					}else{
						left=$(".layui-body").css("left");
						$(".layui-body").css({"left":"0px"});
					}
				});

			});
			
		});

		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
		});

		//文件管理
		$("#filemanage").on("click", function() {
			$("#mianIframe").attr("src", "filefoldermanage.jsp");
		});

		//新闻管理
		$("#newRelease").on("click", function() {
			$("#mianIframe").attr("src", "/goNews");
		});

		//用户管理
		$("#userManagement").on("click", function() {
			$("#mianIframe").attr("src", "usermanagement.jsp");
		});

		//用户自身管理
		$("#userThisManagement").on("click", function() {
			$("#mianIframe").attr("src", "usermanag.jsp");
		});
		//
		$("#basicdata").on("click", function() {
			$("#mianIframe").attr("src", "basicdata.jsp");
		});
		//招生毕业生网
		$("#recruit_students").on("click", function() {
			$("#mianIframe").attr("src", "recruit_students.jsp");
		});
		//新闻审核
		$("#news_audit").on("click", function() {
			$("#mianIframe").attr("src", "news_audit.jsp");
		});
		//阳光新闻
		$("#sunshineServiceNews").on("click", function() {
			$("#mianIframe").attr("src", "sunshine_service_news.jsp");
		});
		//阳光服务
		$("#sunshineService").on("click", function() {
			$("#mianIframe").attr("src", "sunshine_service_hear.jsp");
		});
		//网上看校
		$("#wskx").on("click", function() {
			$("#mianIframe").attr("src", "/pages/wskx/GsxyWskxImg.jsp");
		});
		//
		$("#grglym").on("click", function() {
			$("#mianIframe").attr("src", "usermanag.jsp");
		});
		//员工日志管理
		$("#ygrzgl").on("click", function() {
			$("#mianIframe").attr("src", "/pages/gsxyworklog/GsxyWorkLogManage.jsp");
		});
		//日志总结信息
		$("#rzzjxi").on("click", function() {
			$("#mianIframe").attr("src", "/pages/gsxyworklog/GsxyWorkLogFindSummary.jsp");
		});
		$("#certificate_management").on("click", function() {
			$("#mianIframe").attr("src", "/pages/zhenshu/certificate_management.jsp");
		});
		
		$("#yyksgl").on("click", function() {
			$("#mianIframe").attr("src", "/pages/EnglishTest/EnglishTestManage.jsp");
		});
		
		$("#pthdjks").on("click", function() {
			$("#mianIframe").attr("src", "/pages/GeneralTest/GeneralTestManage.jsp");
		});
		
		$("#wsbxxt").on("click", function() {
			$("#mianIframe").attr("src", "/pages/wsbxxt/wsbxxt_1.jsp");
		});

	</script>

</html>