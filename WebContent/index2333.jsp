<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<!--<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">-->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no">
		<title>湖南工商职业学院</title>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
	<style>
		body {
			margin: 0px;
			background: url(r3/imgs/index_scy_jyb_banner.jpg)no-repeat;
		}
		.Headerdiv{
			margin:0 auto; 
			width:1000px; 
			height:220px; 
			/*background-color: #5FB878;*/
		}

		.Headerdiv1 {
			margin: 0 auto;
			width: 1000px;
			height: 220px;
			/*background-color: #5FB878;*/
		}
		
		.carousel {
			margin: 0 auto;
		}
		
		.ColumnTheme {
			position: relative;
			top: -1px;
			margin: 0 auto;
			padding: 1px;
			width: 1000px;
			height: 450px;
			background-color: white;
		}
		
		#test4 {
			position: relative;
			top: 20px;
		}
		
		.news {
			margin: 0 auto;
			margin-top: 320px;
			width: 1000px;
			height: 310px;
			/*background-color: #93D1FF;*/
		}
		
		.news1 {
			float: right;
			width: 500px;
			height: 300px;
			background-color: #FBFBFB;
		}
		
		.news2 {
			float: left;
			width: 500px;
			height: 300px;
			background-color: #FBFBFB;
		}
		
		.news3 {
			float: left;
			width: 1000px;
			height: 300px;
			background-color: #FBFBFB;
		}
		
		.bottom {
			margin: 0 auto;
			height: 200px;
			width: 1000px;
			background-color: #B8EECF;
			background: url(<%=request.getContextPath()%>/r3/imgs/wygkcn.gif)no-repeat;
		}
		
		.xyxw {
			float: left;
			width: 500px;
			height: 450px;
			/*background-color: #B8EECF;*/
		}
		
		.xsxw {
			float: left;
			width: 500px;
			height: 190px;
			background-color: coral;
		}
		
		.gzdt {
			margin: 10px;
		}
		
		.liclass {
			padding: 5px;
		}
		
		.ullidiv {
			float: left;
		}
		
		.spandiv {
			float: right;
		}
		
		.backgroundColorWhite {
			/*background-color: #F0F0F0;*/
		}

		.ziti {
			margin: 30px;
		}
		/*招生网css*/
		
		.recruitStudents1 {
			width: 50%;
			height: 450px;
			/*background-color: #EED3D7;*/
			float: left;
		}
		
		.recruitStudents1_1 {
			width: 100%;
			height: 50%;
			/*background-color: #DDDDDD;*/
		}
		
		.recruitStudents2 {
			width: 50%;
			height: 450px;
			background-color: #F7E1B5;
			float: right;
		}
		
		.recruitStudents2_1 {
			width: 100%;
			height: 20%;
			background-color: #B1D2EC;
		}
		
		.recruitStudents2_1_1 {
			width: 20%;
			height: 100%;
			background-color: #F7ECB5;
			float: right;
		}
		
		.recruitStudents2_2 {
			width: 100%;
			height: 40%;
			background-color: #F0AD4E;
		}
		
		.recruitStudents2_3 {
			width: 100%;
			height: 40%;
			background-color: #F2DEDE;
		}
		
		.bottom_diji {
			margin: 0 auto;
			height: 200px;
			width: 1000px;
			background-color: #B8EECF;
			background: url(<%=request.getContextPath()%>/r3/imgs/wygkcn.gif)no-repeat;
		}
		
		.bottom_diji_neir {
			text-align: center;
			height: 200px;
			width: 1000px;
		}
		
		.newstupian {
			height: 130px;
			width: 100%;
			/*background-color: #BAC498;*/
			/*background: url(<%=request.getContextPath()%>/r3/imgs/kaoshitup.png) no-repeat;*/
		}
		
		.newsImg {
			max-width: 100%;
			max-height: 130px;
		}
		.layui-tab-title1{
			background-color: white;
			/*background-color: #007DDB;*/
		}
		.ulii{
			background: url(<%=request.getContextPath()%>/r3/imgs/BBBBB.png);
		}
	</style>
	</head>

	<body>

		<div class="Headerdiv">
			<img style="padding-top: 30px;" src="r3/imgs/logoHbeijtm.png" />
			<img style="padding-top: 30px;" src="r3/imgs/ziti/ztzimu2121-1.png" />
	        	<!--描述：头部图片DIV-->
		<!--	<div class="homePageHeader"> 
			</div> -->
		</div>
		<div class="Headerdiv1">
			<!--
	        	描述：选项按钮 backgroundColorWhite
	        -->
			<div class="layui-tab" id="newOne">
				<ul class="layui-tab-title layui-tab-title1">
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/school_profile.jsp">
						<li id="li1"><i class="layui-icon">&#xe62a;</i>&nbsp;学院介绍</li>
					</a> 
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/admissions_channel.jsp">
						<li id="li2" >招生频道</li>
					</a>
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/party_building.jsp">
						<li id="li3">党建工作</li>
					</a>
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/teachers.jsp">
						<li id="li4">师资队伍</li>
					</a>
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/Teaching.jsp">
						<li id="li5">教育教学</li>
					</a>
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/school_work.jsp">
						<li id="li6">学工在线</li>
					</a>
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/campus_life.jsp">
						<li id="li7">校园生活</li>
					</a>
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/personnel_training.jsp">
						<li id="li8">人才培养</li>
					</a>
					<a target="_blank" href="<%=request.getContextPath()%>/pages/anon/obtain_employment.jsp">
						<li id="li9">就业频道</li>
					</a>
				</ul>
				
				<!--描述：轮播图-->
				<div class="layui-carousel carousel" id="test4">
					<div carousel-item>
						<div><img width="100%" height="100%" src="<%=request.getContextPath()%>/r3/imgs/20145252220087333.jpg"></div>
						<div><img width="100%" height="100%" src="<%=request.getContextPath()%>/r3/imgs/20145252216839846.jpg"></div>
						<div><img width="100%" height="100%" src="<%=request.getContextPath()%>/r3/imgs/20135232155310694.jpg"></div>
						<div><img width="100%" height="100%" src="<%=request.getContextPath()%>/r3/imgs/20125251881223309.jpg"></div>
						<div><img width="100%" height="100%" src="<%=request.getContextPath()%>/r3/imgs/201252518101243095.jpg"></div>
						<div><img width="100%" height="100%" src="<%=request.getContextPath()%>/r3/imgs/20125251802747740.jpg"></div>
					</div>
				</div>

				<!--
		        	描述：选项按钮DIV ColumnTheme1 ColumnTheme2 ColumnTheme3 ColumnTheme4 ColumnTheme5
		        -->
				<div id="ColumnTheme1" class="ColumnTheme">
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief1">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=0" target="_blank"><span style="color: #009688;">最新信息</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo0" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 8){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1" onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="xyjj_zxxx_img" width="100%" height="130px" class="newsImg" />
								</div>
								<div id="newsTypeIs0"></div>
							</div>
						</div>

					</div>
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief2">
							<ul class="layui-tab-title">
								<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=1" target="_blank">
									<li class="layui-this">学校简介</li>
								</a>
							</ul>
							<div class="layui-tab-content">
								<script id="demo1" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 8){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="xyjs_xyjs_img" width="100%" height="130px" class="newsImg" />
								</div>
								<div id="newsTypeIs1"></div>
							</div>
						</div>

					</div>
					<!--					<div class="xsxw">
						学生新闻
					</div>
					<div class="xsxw">
						活动
					</div>-->

				</div>

				<div id="ColumnTheme2" class="ColumnTheme">
					<div class="recruitStudents1">
						<div class="recruitStudents1_1">
							<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief5">
								<ul class="layui-tab-title">
									<li class="layui-this">招生新闻</li>
								</ul>
								<div class="layui-tab-content">
									<script id="demo130" type="text/html">
										<ul>
											{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
											<li class="liclass">
												<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
												<div>
													<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
												</div>
											</li>
											{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
										</ul>
									</script>
									<div id="newsTypeIs130"></div>
								</div>
							</div>
						</div>
						<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief6">
							<ul class="layui-tab-title">
								<li class="layui-this">通知公告</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo131" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div id="newsTypeIs131"></div>
							</div>
						</div>
					</div>
					<div class="recruitStudents2">
						<div class="recruitStudents2_1">
							点击和招生老师联系:
							<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=85113909&site=qq&menu=yes">
								<img border="0" src="http://wpa.qq.com/pa?p=2:85113909:51" alt="点击这里给我发消息" title="点击这里给我发消息"/>
							</a>
							
							<div class="recruitStudents2_1_1">

							</div>
							
						</div>
						<div class="recruitStudents2_2">
							录取查询系统（以身份证号码为条件查询）
							<form class="layui-form layui-form-pane" action="">
								<div class="layui-form-item" pane>
									<label class="layui-form-label">身份证</label>
									<div class="layui-input-block">
										<input type="text" name="idCard" required lay-verify="required" placeholder="请输入身份证" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="findIdCardForma">立即查询</button>
									</div>
								</div>
							</form>
						</div>
						<div class="recruitStudents2_3">
								<a target="_blank" href="/pages/anon/online_registration.jsp">
									<img src="r3/imgs/f8323fbe1aa73d0bef5ec12af4dcc7d2.jpg" />
								</a>
						</div>
					</div>
				</div>

				<div id="ColumnTheme3" class="ColumnTheme">
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief1">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=51" target="_blank"><span style="color: #009688;">党的建设</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo51" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 5){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="djgz_ddjs_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs51"></div>
							</div>
						</div>

					</div>
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief2">
							<ul class="layui-tab-title">
								<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=50" target="_blank">
									<li class="layui-this">党的组织</li>
								</a>
							</ul>
							<div class="layui-tab-content">
								<script id="demo50" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 5){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="djgz_ddzz_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs50"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="ColumnTheme4" class="ColumnTheme">
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief61">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=61" target="_blank"><span style="color: #009688;">教师风采</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo61" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="szdw_jsfc_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs61"></div>
							</div>
						</div>

					</div>
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief62">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=62" target="_blank"><span style="color: #009688;">队伍建设</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo62" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="szdw_dwjs_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs62"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="ColumnTheme5" class="ColumnTheme">
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief61">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=71" target="_blank"><span style="color: #009688;">学院新闻</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo71" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="jyjx_xyxw_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs71"></div>
							</div>
						</div>

					</div>
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief62">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=73" target="_blank"><span style="color: #009688;">学院通知</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo73" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="jyjx_xytz_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs73"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="ColumnTheme6" class="ColumnTheme">
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief61">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=80" target="_blank"><span style="color: #009688;">优秀表彰</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo80" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="xhzx_yxbz_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs80"></div>
							</div>
						</div>

					</div>
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief62">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=81" target="_blank"><span style="color: #009688;">思想教育</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo81" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="xhzx_sxjy_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs81"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="ColumnTheme7" class="ColumnTheme">
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief61">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=91" target="_blank"><span style="color: #009688;">学生在线</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo91" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="xysh_xszx_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs91"></div>
							</div>
						</div>

					</div>
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief62">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=92" target="_blank"><span style="color: #009688;">社团组织</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo92" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="xysh_stzz_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs92"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="ColumnTheme8" class="ColumnTheme">
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief61">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=101" target="_blank"><span style="color: #009688;">能力拓展</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo101" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="rcpy_nltz_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs101"></div>
							</div>
						</div>

					</div>
					<div class="xyxw">
						<div class="layui-tab layui-tab-brief gzdt" lay-filter="docDemoTabBrief62">
							<ul class="layui-tab-title">
								<li class="layui-this">
									<a href="<%=request.getContextPath()%>/pages/news/newsSpecialColumn.jsp?newType=102" target="_blank"><span style="color: #009688;">自考教育</span></a>
								</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo102" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div class="newstupian">
									<img src="" id="rcpy_zkjy_img" width="100%" height="130px" />
								</div>
								<div id="newsTypeIs102"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="ColumnTheme9" class="ColumnTheme">
					<div class="recruitStudents1">
						<div class="recruitStudents1_1">
							<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief5">
								<ul class="layui-tab-title">
									<li class="layui-this">就业新闻</li>
								</ul>
								<div class="layui-tab-content">
									<script id="demo120" type="text/html">
										<ul>
											{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
											<li class="liclass">
												<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
												<div>
													<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
												</div>
											</li>
											{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
										</ul>
									</script>
									<div id="newsTypeIs120"></div>
								</div>
							</div>
						</div>
						<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief6">
							<ul class="layui-tab-title">
								<li class="layui-this">通知公告</li>
							</ul>
							<div class="layui-tab-content">
								<script id="demo121" type="text/html">
									<ul>
										{{# layui.each(d.list, function(index, item){ }} {{# if(index == 10){return true;} }}
										<li class="liclass">
											<span class="spandiv">{{ item.newsReleaseTime.substring(0,10)}}</span>
											<div>
												<a class="glxs_1"  onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
											</div>
										</li>
										{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
									</ul>
								</script>
								<div id="newsTypeIs121"></div>
							</div>
						</div>
					</div>
					<div class="recruitStudents2">
							毕业学生信息库查询系统
							<form class="layui-form layui-form-pane" action="">
								<div class="layui-form-item" pane>
									<label class="layui-form-label">身份证</label>
									<div class="layui-input-block">
										<input type="text" name="idCard" required lay-verify="required" placeholder="请输入身份证" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="findIdCardFormb">立即查询</button>
									</div>
								</div>
							</form>
						
					</div>
				</div>

			</div>

		</div>
		<!--
    	描述：新闻
    -->
		<div class="news">
			<div class="news1">
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief3">
					<ul class="layui-tab-title">
						<li id="newsli1" class="layui-this"><i class="layui-icon">&#xe609;</i>待开发</li>
						<li id="newsli2"><i class="layui-icon">&#xe609;</i>待开发</li>
						<li id="newsli3"><i class="layui-icon">&#xe609;</i>待开发</li>
						<li id="newsli4"><i class="layui-icon">&#xe609;</i>待开发</li>
						<!-- <li id="newsli5"><i class="layui-icon">&#xe609;</i> 订单管理</li>-->
					</ul>
					<div class="layui-tab-content">

					</div>
				</div>
			</div>
			<div class="news2">
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief4">
					<ul class="layui-tab-title">
						<!--<li id="newsli6" class="layui-this"><i class="layui-icon">&#xe609;</i>学院机构</li>
			    <li id="newsli7" ><i class="layui-icon">&#xe609;</i>教师专栏</li>
			    <li id="newsli8" ><i class="layui-icon">&#xe609;</i>学生专栏</li>
			    <li id="newsli9" ><i class="layui-icon">&#xe609;</i> 商品管理1</li>
			 -->

						<li class="layui-this" id="dinews1">学院机构</li>
						<li id="dinews2"><i class="layui-icon">&#xe609;</i>阳光服务大厅</li>
						<li id="dinews3"><i class="layui-icon">&#xe609;</i>待开发</li>
						<li id="dinews4"><i class="layui-icon">&#xe609;</i>待开发</li>
						<!-- <li id="dinews5"><i class="layui-icon">&#xe609;</i>订单管理</li>-->

					</ul>
					<div class="layui-tab-content" id="dinews1_1">
						<a href="pages/anon/newsMinistryOfPersonnel.html" target="_blank" class="ziti">人事处</a>
						<a href="pages/anon/newsOffice.jsp" target="_blank" class="ziti">学院办公室</a>
						<a href="pages/anon/newsEducational.jsp" target="_blank" class="ziti">教务处</a>
					</div>
					<div class="layui-tab-content" id="dinews1_2">
						<!--<a href="http://fuwu.hngsxy.com" target="_blank" class="ziti">阳光服务大厅</a>-->
						<a href="<%=request.getContextPath()%>/pages/anon/sunshine_service.jsp" target="_blank" class="ziti">阳光服务大厅</a>
					</div>
					<div class="layui-tab-content" id="dinews1_3">

					</div>
					<div class="layui-tab-content" id="dinews1_4">

					</div>
					<!--		  
	<div class="layui-tab-content" id="dinews1_5">
			  	5555
			  </div>
			  -->
				</div>
			</div>
			<!--		<div class="news3">
			<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			  <ul class="layui-tab-title">
			    <li class="layui-this" id="dinews1">学院机构</li>
			    <li id="dinews2"><i class="layui-icon">&#xe609;</i>学院组织2</li>
			    <li id="dinews3"><i class="layui-icon">&#xe609;</i>权限分配</li>
			    <li id="dinews4"><i class="layui-icon">&#xe609;</i>商品管理</li>
			    <li id="dinews5"><i class="layui-icon">&#xe609;</i>订单管理</li>
			  </ul>
			  <div class="layui-tab-content" id="dinews1_1">
			  	描述：学院机构代码 
			  	<a href="pages/anon/newsMinistryOfPersonnel.html" target="_blank" class="ziti">人事处</a>
			  	<a href="pages/anon/newsOffice.jsp" target="_blank" class="ziti">学院办公室</a>
			  	<a href="pages/anon/newsEducational.jsp" target="_blank" class="ziti">教务处</a>
			  </div>
			  <div class="layui-tab-content" id="dinews1_2">
			  	2222
			  </div>
			  <div class="layui-tab-content" id="dinews1_3">
			  	3333
			  </div>
			  <div class="layui-tab-content" id="dinews1_4">
			  	4444
			  </div>
			  <div class="layui-tab-content" id="dinews1_5">
			  	5555
			  </div>
			</div>      
		</div>-->
		</div>

		<div class="bottom">
			<div class="bottom_diji_neir">
				Copyright 2009-2020 http://www.hngsxy.com All Rights Reserved <br /> 版权所有： 湖南工商职业学院 电话：0734-8593338 8593358 传真：0734-8593325 <br /> 地址：湖南省衡阳市石鼓区松木塘 邮编：421001 <br /> 湘教QS4_201212_040024 湘ICP备12013408号 <br />
				<a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=43040702000117" target="_blank">湘公网安备 43040702000117号</a> <br />
			</div>
		</div>
		<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
		<script src="r3/anonJs/anonJs.js"></script>
		<script>
			//JavaScript代码区域
			layui.use('carousel', function() {
				var carousel = layui.carousel;

				carousel.render({
					elem: '#test4',
					width: '1000px',
					height: '430px',
					interval: 2000
				});
			});

			$("#ColumnTheme1").hide();
			$("#ColumnTheme2").hide();
			$("#ColumnTheme3").hide();
			$("#ColumnTheme4").hide();
			$("#ColumnTheme5").hide();
			$("#ColumnTheme6").hide();
			$("#ColumnTheme7").hide();
			$("#ColumnTheme8").hide();
			$("#ColumnTheme9").hide();

			$("#newOne").on("mouseover", function() {

				$("#newOne").addClass("backgroundColorWhite");
			}).on("mouseout", function() {

				$("#newOne").removeClass("backgroundColorWhite");
			});

			$("#li1").on("mouseover", function() {
				$("#li1").addClass("layui-this");
				$("#ColumnTheme1").show();
				$("#test4").hide();
				//$("#newOne").addClass("backgroundColorWhite");

			}).on("mouseout", function() {
				$("#li1").removeClass("layui-this");
				$("#ColumnTheme1").hide();
				$("#test4").show();
				//$("#newOne").removeClass("backgroundColorWhite");
			});

			$("#ColumnTheme1").on("mouseover", function() {
				$("#li1").addClass("layui-this");
				$("#ColumnTheme1").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li1").removeClass("layui-this");
				$("#ColumnTheme1").hide();
				$("#test4").show();

			});

			$("#li2").on("mouseover", function() {
				$("#li2").addClass("layui-this");
				$("#ColumnTheme2").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li2").removeClass("layui-this");
				$("#ColumnTheme2").hide();
				$("#test4").show();

			});

			$("#ColumnTheme2").on("mouseover", function() {
				$("#li2").addClass("layui-this");
				$("#ColumnTheme2").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li2").removeClass("layui-this");
				$("#ColumnTheme2").hide();
				$("#test4").show();

			});

			$("#li3").on("mouseover", function() {
				$("#li3").addClass("layui-this");
				$("#ColumnTheme3").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li3").removeClass("layui-this");
				$("#ColumnTheme3").hide();
				$("#test4").show();

			});

			$("#ColumnTheme3").on("mouseover", function() {
				$("#li3").addClass("layui-this");
				$("#ColumnTheme3").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li3").removeClass("layui-this");
				$("#ColumnTheme3").hide();
				$("#test4").show();

			});

			$("#li4").on("mouseover", function() {
				$("#li4").addClass("layui-this");
				$("#ColumnTheme4").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li4").removeClass("layui-this");
				$("#ColumnTheme4").hide();
				$("#test4").show();

			});

			$("#ColumnTheme4").on("mouseover", function() {
				$("#li4").addClass("layui-this");
				$("#ColumnTheme4").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li4").removeClass("layui-this");
				$("#ColumnTheme4").hide();
				$("#test4").show();

			});

			$("#li5").on("mouseover", function() {
				$("#li5").addClass("layui-this");
				$("#ColumnTheme5").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li5").removeClass("layui-this");
				$("#ColumnTheme5").hide();
				$("#test4").show();

			});

			$("#ColumnTheme5").on("mouseover", function() {
				$("#li5").addClass("layui-this");
				$("#ColumnTheme5").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li5").removeClass("layui-this");
				$("#ColumnTheme5").hide();
				$("#test4").show();

			});

			$("#li6").on("mouseover", function() {
				$("#li6").addClass("layui-this");
				$("#ColumnTheme6").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li6").removeClass("layui-this");
				$("#ColumnTheme6").hide();
				$("#test4").show();

			});

			$("#ColumnTheme6").on("mouseover", function() {
				$("#li6").addClass("layui-this");
				$("#ColumnTheme6").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li6").removeClass("layui-this");
				$("#ColumnTheme6").hide();
				$("#test4").show();

			});

			$("#li7").on("mouseover", function() {
				$("#li7").addClass("layui-this");
				$("#ColumnTheme7").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li7").removeClass("layui-this");
				$("#ColumnTheme7").hide();
				$("#test4").show();

			});

			$("#ColumnTheme7").on("mouseover", function() {
				$("#li7").addClass("layui-this");
				$("#ColumnTheme7").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li7").removeClass("layui-this");
				$("#ColumnTheme7").hide();
				$("#test4").show();

			});

			$("#li8").on("mouseover", function() {
				$("#li8").addClass("layui-this");
				$("#ColumnTheme8").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li8").removeClass("layui-this");
				$("#ColumnTheme8").hide();
				$("#test4").show();

			});

			$("#ColumnTheme8").on("mouseover", function() {
				$("#li8").addClass("layui-this");
				$("#ColumnTheme8").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li8").removeClass("layui-this");
				$("#ColumnTheme8").hide();
				$("#test4").show();

			});
			
			$("#li9").on("mouseover", function() {
				$("#li9").addClass("layui-this");
				$("#ColumnTheme9").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li9").removeClass("layui-this");
				$("#ColumnTheme9").hide();
				$("#test4").show();

			});

			$("#ColumnTheme9").on("mouseover", function() {
				$("#li9").addClass("layui-this");
				$("#ColumnTheme9").show();
				$("#test4").hide();

			}).on("mouseout", function() {
				$("#li9").removeClass("layui-this");
				$("#ColumnTheme9").hide();
				$("#test4").show();

			});

			//-----------------------------------	//选项卡和轮播图		//-----------------------------------			

			/*				$("#test4").on("mouseover", function() {
								$("#li1").removeClass("layui-this");
								$("#li2").removeClass("layui-this");
								$("#li3").removeClass("layui-this");
								$("#li4").removeClass("layui-this");
								$("#li5").removeClass("layui-this");
								$("#li6").removeClass("layui-this");
								$("#li7").removeClass("layui-this");
								$("#li8").removeClass("layui-this");
							});*/
			//-----------------------------------	//选项卡和轮播图		//-----------------------------------	

			//-----------------------------------	//新闻		//-----------------------------------	
			$("#newsli1").on("mouseover", function() {
				$("#newsli1").addClass("layui-this");
				$("#newsli2").removeClass("layui-this");
				$("#newsli3").removeClass("layui-this");
				$("#newsli4").removeClass("layui-this");
				$("#newsli5").removeClass("layui-this");

			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#newsli2").on("mouseover", function() {
				$("#newsli2").addClass("layui-this");
				$("#newsli1").removeClass("layui-this");
				$("#newsli3").removeClass("layui-this");
				$("#newsli4").removeClass("layui-this");
				$("#newsli5").removeClass("layui-this");
			}).on("mouseout", function() {
				//			$("#newsli2").removeClass("layui-this");
			});

			$("#newsli3").on("mouseover", function() {
				$("#newsli3").addClass("layui-this");
				$("#newsli2").removeClass("layui-this");
				$("#newsli1").removeClass("layui-this");
				$("#newsli4").removeClass("layui-this");
				$("#newsli5").removeClass("layui-this");
			}).on("mouseout", function() {
				//			$("#newsli3").removeClass("layui-this");
			});

			$("#newsli4").on("mouseover", function() {
				$("#newsli4").addClass("layui-this");
				$("#newsli2").removeClass("layui-this");
				$("#newsli3").removeClass("layui-this");
				$("#newsli1").removeClass("layui-this");
				$("#newsli5").removeClass("layui-this");
			}).on("mouseout", function() {
				//			$("#newsli4").removeClass("layui-this");
			});

			$("#newsli5").on("mouseover", function() {
				$("#newsli5").addClass("layui-this");
				$("#newsli2").removeClass("layui-this");
				$("#newsli3").removeClass("layui-this");
				$("#newsli4").removeClass("layui-this");
				$("#newsli1").removeClass("layui-this");
			}).on("mouseout", function() {
				//			$("#newsli5").removeClass("layui-this");
			});

			$("#newsli6").on("mouseover", function() {
				$("#newsli6").addClass("layui-this");
				$("#newsli7").removeClass("layui-this");
				$("#newsli8").removeClass("layui-this");
				$("#newsli9").removeClass("layui-this");
				$("#newsli10").removeClass("layui-this");

			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#newsli7").on("mouseover", function() {
				$("#newsli7").addClass("layui-this");
				$("#newsli6").removeClass("layui-this");
				$("#newsli8").removeClass("layui-this");
				$("#newsli9").removeClass("layui-this");
				$("#newsli10").removeClass("layui-this");

			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#newsli8").on("mouseover", function() {
				$("#newsli8").addClass("layui-this");
				$("#newsli7").removeClass("layui-this");
				$("#newsli6").removeClass("layui-this");
				$("#newsli9").removeClass("layui-this");
				$("#newsli10").removeClass("layui-this");

			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#newsli9").on("mouseover", function() {
				$("#newsli9").addClass("layui-this");
				$("#newsli7").removeClass("layui-this");
				$("#newsli8").removeClass("layui-this");
				$("#newsli6").removeClass("layui-this");
				$("#newsli10").removeClass("layui-this");

			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#newsli10").on("mouseover", function() {
				$("#newsli10").addClass("layui-this");
				$("#newsli7").removeClass("layui-this");
				$("#newsli8").removeClass("layui-this");
				$("#newsli9").removeClass("layui-this");
				$("#newsli6").removeClass("layui-this");

			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			//--
			$("#dinews1_1").show();
			$("#dinews1_2").hide();
			$("#dinews1_3").hide();
			$("#dinews1_4").hide();
			$("#dinews1_5").hide();

			$("#dinews1").on("mouseover", function() {
				$("#dinews1").addClass("layui-this");
				$("#dinews2").removeClass("layui-this");
				$("#dinews3").removeClass("layui-this");
				$("#dinews4").removeClass("layui-this");
				$("#dinews5").removeClass("layui-this");

				//--
				$("#dinews1_1").show();
				$("#dinews1_2").hide();
				$("#dinews1_3").hide();
				$("#dinews1_4").hide();
				$("#dinews1_5").hide();
			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#dinews2").on("mouseover", function() {
				$("#dinews2").addClass("layui-this");
				$("#dinews1").removeClass("layui-this");
				$("#dinews3").removeClass("layui-this");
				$("#dinews4").removeClass("layui-this");
				$("#dinews5").removeClass("layui-this");

				//--
				$("#dinews1_1").hide();
				$("#dinews1_2").show();
				$("#dinews1_3").hide();
				$("#dinews1_4").hide();
				$("#dinews1_5").hide();

			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#dinews3").on("mouseover", function() {
				$("#dinews3").addClass("layui-this");
				$("#dinews2").removeClass("layui-this");
				$("#dinews1").removeClass("layui-this");
				$("#dinews4").removeClass("layui-this");
				$("#dinews5").removeClass("layui-this");

				//--
				$("#dinews1_1").hide();
				$("#dinews1_2").hide();
				$("#dinews1_3").show();
				$("#dinews1_4").hide();
				$("#dinews1_5").hide();
			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#dinews4").on("mouseover", function() {
				$("#dinews4").addClass("layui-this");
				$("#dinews2").removeClass("layui-this");
				$("#dinews3").removeClass("layui-this");
				$("#dinews1").removeClass("layui-this");
				$("#dinews5").removeClass("layui-this");

				//--
				$("#dinews1_1").hide();
				$("#dinews1_2").hide();
				$("#dinews1_3").hide();
				$("#dinews1_4").show();
				$("#dinews1_5").hide();
			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});

			$("#dinews5").on("mouseover", function() {
				$("#dinews5").addClass("layui-this");
				$("#dinews2").removeClass("layui-this");
				$("#dinews3").removeClass("layui-this");
				$("#dinews4").removeClass("layui-this");
				$("#dinews1").removeClass("layui-this");

				//--
				$("#dinews1_1").hide();
				$("#dinews1_2").hide();
				$("#dinews1_3").hide();
				$("#dinews1_4").hide();
				$("#dinews1_5").show();
			}).on("mouseout", function() {
				//			$("#newsli1").removeClass("layui-this");
			});
			//-----------------------------------	//新闻		//-----------------------------------

			layui.use('element', function() {
				var element = layui.element;

			});

			layui.use('laytpl', function() {
				var laytpl = layui.laytpl;

				//学校介绍_最新信息
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "0"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
					
						var index1 = data.indexOf("http:");
						
						var index2 = data.indexOf("titie=");
						
						var imgPath2 = data.substring(index1,index2-2);


						if(index2 == -1) {
							imgPath2 = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						if(imgPath2.indexOf(".mkv") != -1) {
							imgPath2 = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}
						
						
						
						
						//console.log("可以用的:"+imgPath2);
						$("#xyjj_zxxx_img").attr("src", imgPath2);
						
						var temp0 = JSON.parse(data);
						var getTpl0 = demo0.innerHTML,
							newsTypeIs0 = document.getElementById('newsTypeIs0');
						laytpl(getTpl0).render(temp0, function(html) {
							newsTypeIs0.innerHTML = html;
						});

					}
				});
				//学校介绍_校园简介
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "1"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {

						var index1 = data.indexOf("http");
						var index2 = data.indexOf("temp");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);

						//console.log(imgPath.length);
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						if(imgPath.indexOf(".mkv") != -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}

						//console.log(imgPath);
						$("#xyjs_xyjs_img").attr("src", imgPath);

						//console.log(data)
						var temp1 = JSON.parse(data);
						var getTpl1 = demo1.innerHTML,
							newsTypeIs1 = document.getElementById('newsTypeIs1');
						laytpl(getTpl1).render(temp1, function(html) {
							newsTypeIs1.innerHTML = html;
						});

					}
				});

				//招生就业网
				//
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "130"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var temp130 = JSON.parse(data);
						var getTpl130 = demo130.innerHTML,
							newsTypeIs130 = document.getElementById('newsTypeIs130');
						laytpl(getTpl130).render(temp130, function(html) {
							newsTypeIs130.innerHTML = html;
						});

					}
				});
				//
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "131"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var temp131 = JSON.parse(data);
						var getTpl131 = demo131.innerHTML,
							newsTypeIs131 = document.getElementById('newsTypeIs131');
						laytpl(getTpl131).render(temp131, function(html) {
							newsTypeIs131.innerHTML = html;
						});

					}
				});
				//党的建设
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "51"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {

						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						if(imgPath.indexOf(".mkv") != -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}

						$("#djgz_ddjs_img").attr("src", imgPath);

						var temp51 = JSON.parse(data);
						var getTpl51 = demo51.innerHTML,
							newsTypeIs51 = document.getElementById('newsTypeIs51');
						laytpl(getTpl51).render(temp51, function(html) {
							newsTypeIs51.innerHTML = html;
						});

					}
				});
				//党的建设组织
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "50"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						if(imgPath.indexOf(".mkv") != -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}

						$("#djgz_ddzz_img").attr("src", imgPath);

						var temp50 = JSON.parse(data);
						var getTpl50 = demo50.innerHTML,
							newsTypeIs50 = document.getElementById('newsTypeIs50');
						laytpl(getTpl50).render(temp50, function(html) {
							newsTypeIs50.innerHTML = html;
						});

					}
				});
				//教师风采
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "61"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						$("#szdw_jsfc_img").attr("src", imgPath);

						var temp61 = JSON.parse(data);
						var getTpl61 = demo61.innerHTML,
							newsTypeIs61 = document.getElementById('newsTypeIs61');
						laytpl(getTpl61).render(temp61, function(html) {
							newsTypeIs61.innerHTML = html;
						});

					}
				});
				//党的建设组织
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "62"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						$("#szdw_dwjs_img").attr("src", imgPath);

						var temp62 = JSON.parse(data);
						var getTpl62 = demo62.innerHTML,
							newsTypeIs62 = document.getElementById('newsTypeIs62');
						laytpl(getTpl62).render(temp62, function(html) {
							newsTypeIs62.innerHTML = html;
						});

					}
				});
				//学院新闻
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "71"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}

						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						$("#jyjx_xyxw_img").attr("src", imgPath);

						var temp71 = JSON.parse(data);
						var getTpl71 = demo71.innerHTML,
							newsTypeIs71 = document.getElementById('newsTypeIs71');
						laytpl(getTpl71).render(temp71, function(html) {
							newsTypeIs71.innerHTML = html;
						});

					}
				});
				//学院通知
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "73"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)

						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}
						
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						$("#jyjx_xytz_img").attr("src", imgPath);

						var temp73 = JSON.parse(data);
						var getTpl73 = demo73.innerHTML,
							newsTypeIs73 = document.getElementById('newsTypeIs73');
						laytpl(getTpl73).render(temp73, function(html) {
							newsTypeIs73.innerHTML = html;
						});

					}
				});

				//优秀表彰
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "80"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {

						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}
						//console.log(data)
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						$("#xhzx_yxbz_img").attr("src", imgPath);

						var temp80 = JSON.parse(data);
						var getTpl80 = demo80.innerHTML,
							newsTypeIs80 = document.getElementById('newsTypeIs80');
						laytpl(getTpl80).render(temp80, function(html) {
							newsTypeIs80.innerHTML = html;
						});

					}
				});

				//思想教育
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "81"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)

						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						$("#xhzx_sxjy_img").attr("src", imgPath);

						var temp81 = JSON.parse(data);
						var getTpl81 = demo81.innerHTML,
							newsTypeIs81 = document.getElementById('newsTypeIs81');
						laytpl(getTpl81).render(temp81, function(html) {
							newsTypeIs81.innerHTML = html;
						});

					}
				});

				//学生在线
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "91"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)

						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						$("#xysh_xszx_img").attr("src", imgPath);

						var temp91 = JSON.parse(data);
						var getTpl91 = demo91.innerHTML,
							newsTypeIs91 = document.getElementById('newsTypeIs91');
						laytpl(getTpl91).render(temp91, function(html) {
							newsTypeIs91.innerHTML = html;
						});

					}
				});

				//社团组织
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "92"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						$("#xysh_stzz_img").attr("src", imgPath);

						var temp92 = JSON.parse(data);
						var getTpl92 = demo92.innerHTML,
							newsTypeIs92 = document.getElementById('newsTypeIs92');
						laytpl(getTpl92).render(temp92, function(html) {
							newsTypeIs92.innerHTML = html;
						});

					}
				});

				//能力拓展
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "101"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						$("#rcpy_nltz_img").attr("src", imgPath);

						var temp101 = JSON.parse(data);
						var getTpl101 = demo101.innerHTML,
							newsTypeIs101 = document.getElementById('newsTypeIs101');
						laytpl(getTpl101).render(temp101, function(html) {
							newsTypeIs101.innerHTML = html;
						});

					}
				});

				//自考教育
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "102"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						$("#rcpy_zkjy_img").attr("src", imgPath);

						var temp102 = JSON.parse(data);
						var getTpl102 = demo102.innerHTML,
							newsTypeIs102 = document.getElementById('newsTypeIs102');
						laytpl(getTpl102).render(temp102, function(html) {
							newsTypeIs102.innerHTML = html;
						});

					}
				});
				
				//
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "120"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						//$("#jepd_jyxw_img").attr("src", imgPath);

						var temp120 = JSON.parse(data);
						var getTpl120 = demo120.innerHTML,
							newsTypeIs120 = document.getElementById('newsTypeIs120');
						laytpl(getTpl120).render(temp120, function(html) {
							newsTypeIs120.innerHTML = html;
						});

					}
				});
				
				//
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/selectNewsTypeIs",
					async: false,
					data: {
						newType: "121"
					},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success: function(data) {
						//console.log(data)
						var index1 = data.indexOf("http");
						var index2 = data.indexOf("img");
						var index3 = data.indexOf(".", index2);
						var imgPath = data.substring(index1, index3 + 4);
						//console.log(imgPath.length);
						if(imgPath.indexOf(".mkv")!=-1) {
							imgPath = "";
						}
						if(index2 == -1) {
							imgPath = '<%=request.getContextPath()%>/r3/imgs/aaaaa11122.png';
						}else{
							 imgPath2 = data.substring(index1, index3 + 4);
						}

						//$("#jepd_tzgg_img").attr("src", imgPath);

						var temp121 = JSON.parse(data);
						var getTpl121 = demo121.innerHTML,
							newsTypeIs121 = document.getElementById('newsTypeIs121');
						laytpl(getTpl121).render(temp121, function(html) {
							newsTypeIs121.innerHTML = html;
						});

					}
				});

			});

			function selectOne(id) {
				var url = "pages/news/new_gzgt.jsp?newsId=" + id;
				window.open(url);
			}

			//Demo
			layui.use('form', function() {
				var findIdCardForma = layui.form;
				var findIdCardFormb = layui.form;

				//监听提交
				findIdCardForma.on('submit(findIdCardForma)', function(data) {
					// layer.msg(JSON.stringify(data.field));
					url = "<%=request.getContextPath()%>/pages/anon/find_student_register.jsp?idCard=" + data.field.idCard;
					window.open(url);
					return false;
				});

				//监听提交
				findIdCardFormb.on('submit(findIdCardFormb)', function(data) {
					// layer.msg(JSON.stringify(data.field));
					url = "<%=request.getContextPath()%>/pages/anon/student_Admission.jsp?idCard=" + data.field.idCard;
					window.open(url);

					return false;
				});

			});

			//渲染后加载
			$(function() {

			})
	
			
		</script>
	</body>

</html>