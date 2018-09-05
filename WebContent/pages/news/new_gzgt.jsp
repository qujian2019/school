<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<title>新闻信息</title>
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
		<style>
			body {
				margin: 0px;
				background: url(<%=request.getContextPath()%>/r3/imgs/index_scy_jyb_banner.jpg)no-repeat;
			}
			.layui-nav *{font-size:16px}
			.layui-breadcrumb a {
			    color: #000000!important;
			}
			img{max-height: 100%; max-width: 100%;}
			td,th{ border:1px solid #000000; }
			.homePageHeader {
				margin: 0 auto;
				width: 1000px;
				height: 220px;
				background: url(../../r3/imgs/xytp.png)no-repeat;
			}
			.position {
				margin: 10px auto;
				height: 25px;
				width: 1000px;
				background-color: #f2f2f2;
			}

			.conText {
				margin: 10px auto;
				width: 1200px;
				min-height: 500px;
				border-style: solid;
				border-width: 1px;
				border-color: #c2c2c2;
				background-color: white;
			}
			
			.conTextbody {
		    margin: auto;
		    width: 1024px;
		    min-height: 200px;
			}	
			.heder{
				margin: 10px auto;
				width: 924px;
				height: 32px;
				background-color: #dddddd;
				padding: 5px 50px;
			}

			.footing {
				margin: 10px auto;
				width: 850px;
				height: 32px;
				background-color: #dddddd;
				padding: 5px 50px 0px 5px;
			}
			
			.htitle {
				text-align: center;
				font-size: 20px;
				margin: 50px;
			}
			
			.bottom {
				margin-top: 30px;
				background-color: #2D93CA;
				width: 100%;
				height: 200px;
			}
			
			.bottom_diji{
				margin: 0 auto;
				height:200px;
				width: 1000px;
				/*background-color: #B8EECF;*/
				background: url(<%=request.getContextPath()%>/r3/imgs/wygkcn.gif)no-repeat;
			}
			
			.bottom_diji_neir{
				text-align: center;
				height:200px;
				width: 1000px;
			}
			
		.Headerdiv{
			margin:0 auto; 
			width:1000px; 
			height:220px; 
			/*background-color: #5FB878;*/
		}
		
		.Navigation{
			margin:0 auto; 
			width:100%; 
			height:60px; 
			background-color: #003366;
		}
		
		.Navigation_1{
			margin:0 auto; 
			width:1100px; 
			height:60px; 
		}
			
		</style>
	</head>

	<body>
		<input type="hidden" id="userId" />
		<div class="Headerdiv"><!--/r3/imgs/logoHbeijtm.png      /r3/imgs/ziti/xk_hngszxxy.png-->
				<img style="padding-top: 30px;" src="/r3/imgs/logoHbeijtm.png" />
				<img style="padding-top: 30px;" src="/r3/imgs/ziti/xk_hngszxxy.png" />
	        	<!--描述：头部图片DIV-->
		<!--	<div class="homePageHeader"> 
			</div> -->
		</div>
		
		<div class="Navigation">
			<div class="Navigation_1">
				<ul class="layui-nav" lay-filter="" style="background-color: #003366;">
					<li class="layui-nav-item"><a href="/index.html">学院首页</a></li>
					<li class="layui-nav-item">
						<a href="/pages/anon/college_Survey.html?newsId=28">学院概况</a>
						<dl class="layui-nav-child" style="background-color: #E38D13; filter:alpha(opacity:70);opacity:0.7;-moz-opacity:0.7;-khtml-opacity: 0.7;">
							<dd>
								<a href="/pages/anon/college_Survey.html?newsId=28" style="font-weight: 900;">学院简介</a>
							</dd>
							<dd>
								<a href="/pages/anon/PresentLeader.html" style="font-weight: 900;">现任领导</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="">综合部门</a>
						<dl class="layui-nav-child" style="background-color: #E38D13; width: 220px;">
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/gszxxy_DZBGS.html" style="font-weight: 900;">党政办公室</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/newsMinistryOfPersonnel.html" style="font-weight: 900;">组织人事处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/xsgzc.html" style="font-weight: 900;">学生工作处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/newsEducational.html" style="font-weight: 900;">教务处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/Scientific_Research.html" style="font-weight: 900;">科研处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/Finance.html" style="font-weight: 900;">财务处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/gsxyzsjyc.html" style="font-weight: 900;">招生就业处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/Logistics_Department.html" style="font-weight: 900;">后勤处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/SecurityDepartment.html" style="font-weight: 900;">安全保卫处</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/TrainingCenter.html" style="font-weight: 900;">实训中心</a>
							</dd>
							<dd style="width: 110px; float: left;">
								<a href="/pages/anon/Supervision.html" style="font-weight: 900;">督导室</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="">教学院部</a>
						<dl class="layui-nav-child" style="background-color: #E38D13;">
							<dd>
								<a href="/pages/anon/Business_School.html" style="font-weight: 900;">商学院</a>
							</dd>
							<dd>
								<a href="/pages/anon/Business_School.html" style="font-weight: 900;">商学院</a>
							</dd>
							<dd>
								<a href="/pages/anon/zhongzhibu.html" style="font-weight: 900;">科技创新</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="">教育教学</a>
						<dl class="layui-nav-child" style="background-color: #E38D13;">
							<dd>
								<a href="/pages/anon/newsEducational.html" style="font-weight: 900;">教学工作</a>
							</dd>
							<dd>
								<a href="/pages/anon/Scientific_Research.html" style="font-weight: 900;">评改工作</a>
							</dd>
							<dd>
								<a href="/pages/anon/Supervision.html" style="font-weight: 900;">督导工作</a>
							</dd>
							<dd>
								<a href="/pages/anon/TrainingCenter.html" style="font-weight: 900;">实验实训部</a>
							</dd>
							<dd>
								<a href="/pages/anon/gszxxyZSW_2.html?newType=ZSW4" style="font-weight: 900;">专业介绍</a>
							</dd>
							<dd>
								<a href="/pages/anon/unopened.html" style="font-weight: 900;">图书馆</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="">科研服务</a>
						<dl class="layui-nav-child" style="background-color: #E38D13;">
							<dd>
								<a href="/pages/anon/Scientific_Research.html" style="font-weight: 900;">科学研究</a>
							</dd>
							<dd>
								<a href="/pages/anon/Scientific_Research.html" style="font-weight: 900;">社会服务</a>
							</dd>
							<dd>
								<a href="/pages/anon/Scientific_Research.html" style="font-weight: 900;">科技创新</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="">学生工作处</a>
<!--						<dl class="layui-nav-child" style="background-color: #E38D13;">
							<dd>
								<a href="" style="font-weight: 900;">教授(研究员)</a>
							</dd>
							<dd>
								<a href="" style="font-weight: 900;">副教授</a>
							</dd>
							<dd>
								<a href="" style="font-weight: 900;">专业带头人</a>
							</dd>
						</dl>-->
					</li>
					<li class="layui-nav-item">
						<a href="">招生就业</a>
						<dl class="layui-nav-child" style="background-color: #E38D13;">
							<dd>
								<a href="/pages/anon/gszxxyZSW.html" style="font-weight: 900;">招生网</a>
							</dd>
							<dd>
								<a href="/pages/anon/obtain_employment.html" style="font-weight: 900;">就业网</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="/pages/anon/gszxxyWSKX.html">网上看校</a>
					</li>
					<li class="layui-nav-item">
						<a href="/pages/anon/sunshine_service.jsp">阳光服务</a>
					</li>
				</ul>
			</div>
		</div>
		
		
		
		<div class="Headerdiv">
				<img style="width: 1000px; height: 220px;" src="/r3/imgs/gonggongImg/ggImg1.jpg" />
		</div>
		

		<!--<div class="container position">
			<span class="layui-breadcrumb">
				  <a href="/index.html">首页</a>
				<a href="#" ><span id="newType"></span></a>
			<cite>正文</cite>
			</span>
		-->
		</div>

		<div class="conText">
			<h2 class="htitle" id="tiele1"></h2>
			<div class="heder">
				<div style="margin-left: 190px;">
					<span style="float: left;">发布时间：<span id="newsReleaseTime"></span>
					<span style="margin-left: 10px;">来源：<span id="newsSource"></span></span>
					<span style="margin-left: 10px;float: right;">作者：<span id="newsReleaseUser"></span></span>
					<span style="margin-left: 10px;float: right;">点击量：<span id="newsVisitConut"></span></span>
				</div>
			</div>

			<div class="conTextbody" id="newsContext"></div>
<!--			<div class="footing">
				<span style="float: right;">（责任编辑：<span id="newsReleaseUser"></span>）</span>
			</div>-->
		</div>
		<div class="bottom_diji">
			<div class="bottom_diji_neir">
				Copyright 2009-2020 http://www.hngsxy.com All Rights Reserved <br />
				版权所有： 湖南工商职业学院 电话：0734-8593338 8593358 传真：0734-8593325 <br />
				地址：湖南省衡阳市石鼓区松木塘 邮编：421001   <br />
				湘教QS4_201212_040024   湘ICP备12013408号 <br />
				<img src="/r3/imgs/gonggongImg/beianbgs.png" style="width: 20px; height: 20px;"/>
				<a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=43040702000117" target="_blank">湘公网安备 43040702000117号</a> <br />
			</div>
		</div>

		<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/r3/layui-v2.1.0/layui/layui.js"></script>

		<script>
			//获取路径后的参数
			function parseUrl() {
				var url = location.href;
				var i = url.indexOf('?');

				if(i == -1) return;
				var querystr = url.substr(i + 1);

				var arr1 = querystr.split('&');

				var arr2 = new Object();
				for(p in arr1) {
					var ta = arr1[p].split('=');
					arr2[ta[0]] = ta[1];
				}
				return arr2;
			}
			var v = parseUrl(); //解析所有参数
			// alert(v['fileFolderId']);//就是你要的结果

			if(v != null) {
				var newsId = v['newsId'];
				//console.log(newsId)
			}

			layui.use(['element', 'form'], function() {
				var element = layui.element;

				//element.on('tab(test)', function(data){
				//  console.log(this, data);
				//});
				//
				//element.on('nav(test)', function(elem){
				//  console.log(elem)
				//});
				//
				//element.on('collapse(test)', function(data){
				//  console.log(data);
				//});

			});

			$(function() {
				//统计访问量
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/updateNewsVisitConut",
					data: {
						newsId: newsId
					},
					async: false,
					dateType: "json",
					success: function(data) {}
				});
				//查询新闻对象
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectOneNews",
					data: {
						newsId: newsId
					},
					async: false,
					dateType: "json",
					//timeout:12000,
					success: function(data) {
						//console.log(data);
						$("#tiele1").text(data.newsTitle);
						$("#newsReleaseTime").text(data.newsReleaseTime.substring(0,10));
						/*$("#newsSource").text(data.newsSource);*/
						$("#newsReleaseUser").text(data.newsAuthor);
						$("#newsSource").text(data.newsPush);
						$("#newsVisitConut").text(data.newsVisitConut);
						//console.log(data.userId);
						$("#userId").val(data.userId);
						
						//$("#newsContext").html(data.newsContext);
						//新闻体
						var str = data.newsContext;
						var oldPic = $("#newsContext").html();
						var newPic = oldPic + str;
						$("#newsContext").html(newPic);

					}
				});


			});
		</script>
	</body>

</html>