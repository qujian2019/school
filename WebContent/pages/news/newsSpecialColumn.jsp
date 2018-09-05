<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>新闻专栏</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<style>
			body {
				margin: 0px;
				background: url(<%=request.getContextPath()%>/r3/imgs/index_scy_jyb_banner.jpg)no-repeat;
			}
			.layui-nav *{font-size:16px}
			a{font-size: 14px;}
			.ztdx{
				font-family:'微软雅黑';
				font-size: 18px;
			}
			.position {
				margin: 10px auto;
				height: 25px;
				width: 1000px;
				background-color: white;
			}
			
			.conText {
				margin: 10px auto;
				width: 960px;
				min-height: 500px;
				border-style: solid;
				border-width: 1px;
				border-color: #c2c2c2;
				background-color: white;
				padding: 20px;
			}
			
			.bottom {
				margin-top: 30px;
				background-color: #2D93CA;
				width: 100%;
				height: 200px;
			}
			
			.footing {
				margin-top: 20%;
				position: relative;
				bottom: 0;
			}
			
			.liclass {
				padding: 5px;
			}
			
			.spandiv {
				float: right;
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
				
			}
			
			.Navigation{
				margin:0 auto; 
				width:100%; 
				height:60px; 
				background-color: #003366;
			}
			
			.Navigation_1{
				margin:0 auto; 
				width:1200px; 
				height:60px; 
			}
			
		</style>
	</head>

	<body>

		<div class="Headerdiv" style="height: 180px">
				<img style="padding-top: 30px;" src="/r3/imgs/logoHbeijtm.png" />
				<img style="padding-top: 30px;" src="/r3/imgs/ziti/xk_hngszxxy.png" />
		</div>
		
		
		<!--
        	描述： 导航
        -->
		<div class="Navigation">
			<div class="Navigation_1">
				<ul class="layui-nav" lay-filter="" style="background-color: #003366;">
					  <li class="layui-nav-item">
					  	<a href="/index.html">首页</a>
					  </li>
					<li class="layui-nav-item">
						<a href="JavaScript:;">学院概况</a>
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
						<a href="JavaScript:;">综合部门</a>
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
						<a href="JavaScript:;">教学院部</a>
						<dl class="layui-nav-child" style="background-color: #E38D13;">
							<dd>
								<a href="/pages/anon/Engineering_Institute.html" style="font-weight: 900;">工学院</a>
							</dd>
							<dd>
								<a href="/pages/anon/Business_School.html" style="font-weight: 900;">商学院</a>
							</dd>
							<dd>
								<a href="/pages/anon/zhongzhibu.html" style="font-weight: 900;">中职部</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="JavaScript:;">教育教学</a>
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
						<a href="JavaScript:;">科研服务</a>
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
						<a href="pages/anon/xsgzc.html">团学工作</a>
					</li>
					<li class="layui-nav-item">
						<a href="JavaScript:;">招生就业</a>
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
					<li class="layui-nav-item">
						<a href="JavaScript:;">党建工作</a>
						<dl class="layui-nav-child" style="background-color: #E38D13;">
							<dd>
								<a href="pages/anon/gszxxy_DZBGS_2.html?newType=DZBGS10" style="font-weight: 900;">党建动态</a>
							</dd>
							<dd>
								<a href="pages/anon/gszxxy_DZBGS_2.html?newType=DZBGS17" style="font-weight: 900;">上级文件</a>
							</dd>
							<dd>
								<a href="pages/anon/gszxxy_DZBGS_2.html?newType=DZBGS18" style="font-weight: 900;">学习资料</a>
							</dd>
							<dd>
								<a href="pages/anon/gszxxy_DZBGS_2.html?newType=DZBGS16" style="font-weight: 900;">学习园地</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		
		
		<div class="Headerdiv">
				<img style="width: 1000px; height: 220px;" src="/r3/imgs/gonggongImg/ggImg1.jpg" />
		</div>

		<div class="conText">
			<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief">
				<ul class="layui-tab-title">
					<li class="layui-this">
				   	<i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe609;</i>
				   	<span class="ztdx" id="newType2">
				   		
				   	</span>
					</li>
				</ul>
				<div class="layui-tab-content">
					<ul id="biuuu_city_list"></ul>
				</div>
			</div>

			<div class="footing" id="demo7"></div>

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
		<!--<script src="<%=request.getContextPath()%>/r3/bootstrap/js/bootstrap.js"></script>-->
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
				var newType = v['newType'];
				//console.log(newType)

			}

			$(function() {
				
				if(newType == '1'){
					$("#newType2").text("学院视频");
				}else if(newType == '10'){
					$("#newType2").text("通知公告(人事处)");
				}else if(newType == '11'){
					$("#newType2").text("部门新闻(人事处)");
				}else if(newType == '12'){
					$("#newType2").text("下载中心(人事处)");
				}else if(newType == '13'){
					$("#newType2").text("教师培训(人事处)");
				}else if(newType == '14'){
					$("#newType2").text("劳资管理(人事处)");
				}else if(newType == '15'){
					$("#newType2").text("职称评定(人事处)");
				}else if(newType == '16'){
					$("#newType2").text("教师风采(人事处)");
				}else if(newType == '17'){
					$("#newType2").text("政策导向(人事处)");
				}else if(newType == '18'){
					$("#newType2").text("部门职责(人事处)");
				}else if(newType == '30'){
					$("#newType2").text("通知公告(教务处)");
				}else if(newType == '36'){
					$("#newType2").text("常规文件(教务处)");
				}else if(newType == '31'){
					$("#newType2").text("教务管理(教务处)");
				}else if(newType == '32'){
					$("#newType2").text("教学资料(教务处)");
				}else if(newType == '33'){
					$("#newType2").text("考试成绩查询(教务处)");
				}else if(newType == '34'){
					$("#newType2").text("教务处图片新闻(教务处)");
				}else if(newType == '35'){
					$("#newType2").text("政策导向(教务处)");
				}else if(newType == 'ZSW1'){
					$("#newType2").text("政策法规(招生网)");
				}else if(newType == 'ZSW2'){
					$("#newType2").text("招生信息(招生网)");
				}else if(newType == 'ZSW3'){
					$("#newType2").text("招生图片(招生网)");
				}else if(newType == 'ZSW4'){
					$("#newType2").text("专业介绍(招生网)");
				}else if(newType == 'ZSW5'){
					$("#newType2").text("招生计划(招生网)");
				}else if(newType == 'ZSW6'){
					$("#newType2").text("考生问答(招生网)");
				}else if(newType == 'ZSW7'){
					$("#newType2").text("招生章程(招生网)");
				}else if(newType == 'ZSW8'){
					$("#newType2").text("地区联络(招生网)");
				}else if(newType == 'ZSW9'){
					$("#newType2").text("来校路线(招生网)");
				}else if(newType == 'ZSW10'){
					$("#newType2").text("部门动态(招生网)");
				}else if(newType == 'ZSW11'){
					$("#newType2").text("通知公告(招生网)");
				}else if(newType == 'DZBGS12'){
					$("#newType2").text("职教动态");
				}else if(newType == 'DZBGS13'){
					$("#newType2").text("媒体报道");
				}else if(newType == 'DZBGS10,DZBGS16'){
					$("#newType2").text("党建动态");
				}
				
				
				
						

			});

			function selectOne(id) {
				var url = "/pages/news/new_gzgt.jsp?newsId=" + id;
				window.open(url);
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

			layui.use(['laypage', 'layer'], function() {
				var laypage = layui.laypage,
					layer = layui.layer;
				//调用分页
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/findNewsTypes2",
					data: {
						newTypes: newType
					},
					async: true,
					dateType: "json",
					success: function(data) {
						laypage.render({
							elem: 'demo7',
							count: data.length,
							layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
							jump: function(obj) {
								//模拟渲染
								document.getElementById('biuuu_city_list').innerHTML = function() {
									var arr = [],
										thisData = data.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
									layui.each(thisData, function(index, item) {
										if(item.newsHyperlink == '1' || item.newsHyperlink == null){
											arr.push(
												'<li class="liclass">' +
												'<span class="spandiv">' + item.newsReleaseTime.substring(0, 10) + '</span>' +
												'<div>' +
												'<a class="glxs" style="text-decoration:none;" onclick="selectOne(' + item.newsId + ')" title="'+item.newsTitle+'">' + item.newsTitle.substring(0,35) + '</a>' +
												'</div>' +
												'</li>'
											);
										}else{
											arr.push(
												'<li class="liclass">' +
												'<span class="spandiv">' + item.newsReleaseTime.substring(0, 10) + '</span>' +
												'<div>' +
												'<a target="_blank" class="glxs" style="text-decoration:none;" href="'+item.newsHyperlink+'" title="'+item.newsTitle+'">' + item.newsTitle.substring(0,35) + '</a>' +
												'</div>' +
												'</li>'
											);
										}
									});
									return arr.join('');
								}();
							}
						});

					}
				})

			});
			
		//高亮变色
		$(document).on("mouseover",".liclass",function() {
			//$(".liclass01").eq(this).children().css("color","#0055AA");
			$(this).children().css("color","#0055AA");
			
		}).on("mouseout",".liclass", function() {
			//$(".liclass01").eq(this).children().css("color","#000000");
			$(this).children().css("color","#000000");
		});
		
		//高亮变色
		$(document).on("mouseover",".glxs",function() {
			//$(".liclass01").eq(this).children().css("color","#0055AA");
			$(this).css("color","#0055AA");
			
		}).on("mouseout",".glxs", function() {
			//$(".liclass01").eq(this).children().css("color","#000000");
			$(this).css("color","#000000");
		});
		
		</script>
	</body>

</html>