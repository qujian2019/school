<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<title>阳光服务大厅</title>
    	<meta name="renderer" content="webkit">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.2.1/layui/css/layui.css" />
        <style>
			body {
				margin: 0px;
			}
        	.touDiv{
        		width: 100%;
        		height: 400px;
        		/*background-color: #5FB878;*/
        		background: url(<%=request.getContextPath()%>/r3/imgs/yemei2.jpg)no-repeat;
              	background-size: cover;
        	}
        	.touDivimg{
        		margin: 0 auto;
        		width:400px;
        		height: 125px;
        		
        	}
        	.imgtou1{
        		margin-top: 50px;
        		margin-left: 250px;
        		
        	}
        	.imgtou2{
        		margin-top: 65px;
        		margin-right: 5px;
        	}
        	.div_wai{
        		width: 160px;
        		height: 180px;
        		position: relative;
        		margin-top: 50px;
        		margin-left: 350px;
				background: url(<%=request.getContextPath()%>/r3/imgs/ma_bg.png)no-repeat;
        	}
        	.div_wai1{
        		width: 160px;
        		height: 180px;
        		position: relative;
        		background: url(<%=request.getContextPath()%>/r3/imgs/ma_bg.png)no-repeat;
        		margin-top: -180px;
        		margin-left: 600px;
        		/*float: left;*/
				
        	}
        	.div_wai2{
        		width: 160px;
        		height: 180px;
        		position: relative;
        		background: url(<%=request.getContextPath()%>/r3/imgs/ma_bg.png)no-repeat;
        		margin-top: -180px;
        		margin-left: 850px;
			
        	}
        	.div_wai3{
        		width: 160px;
        		height: 180px;
        		position: relative;
        		background: url(<%=request.getContextPath()%>/r3/imgs/ma_bg.png)no-repeat;
        		margin-top: -180px;
        		margin-left: 1100px;
				
        	}
        	.div_wai4{
        		width: 160px;
        		height: 180px;
        		position: relative;
        		background: url(<%=request.getContextPath()%>/r3/imgs/ma_bg.png)no-repeat;
        		margin-top: -180px;
        		margin-left: 1350px;
			
        	}
        	.div_img{
				border: none;
			    margin-top: 10px;
			    margin-left: 45px;
        	}
        	.div_img2{
				border: none;
			    margin-top: 4px;
			    margin-left: 45px;
        	}
        	.nav_title{
			    color: #000;
			    font-size: 20px;
			    padding-top: 10px;
			    letter-spacing: 1px;
			    margin-left: 40px;
        	}
        	.nav_btn{
				margin-top: 10px;
			    margin-left: 21px;
        	}
        	.nav_btn_div{
        		margin-left: 21px;
        		height: 32px;
        		width: 122px;
			    background-color: #5a8c0a;
			    z-index: 100;
			    padding: 1px;
        	}
        	.nav_btn_div_zi{
        		height: 30px;
        		width: 120px;
			    background-color: #5a8c0a;
			    margin: 1px;
        	}
        	.nav_btn_div_zi_hide{
        		height: 30px;
        		width: 120px;
			    background-color: white;
			    margin: 1px;
        	}
        	.layui-bg-green{
        		 background-color: #5a8c0a!important;
        	}
        	.layui-bg-blue{
        		 background-color: #eeeeee!important;
        	}
   			.layui-ba{
				margin: 0 auto;
				width: 1200px;
				height: 60px;
				
   			}
   			.divbiaoti{
   				margin: 0 auto;
			    width: 1200px;
			    height: 1000px;
			    background-color: #5FB878;
   			}
   			.divbiaoti_t1{
			    width: 100%;
			    height: 30px;
			    background-color: #E4B9C0;
			    float: left; 
			    margin-top: 2px;
   			}
   			.divbiaoti_t2{
			    width: 100%;
			    height: 430px;
			    background-color: white;
			   /* float: right; */
			    margin-top: 2px;
			    border:1px solid #c2c2c2;
			    background-color: #C2CCD1;
   			}
   			.divbiaoti_t2_1{
   				width: 400px;
			    height: 30px;
			    background-color: #F5E79E;   				
   			}
   			.divbiaoti_t2_2{
   				width: 733px;
			    height: 390px;
			    background-color: #F7E1B5; 
			    margin: 2px;
			    padding: 2px;
   			}
   			.divbiaoti_t2_3{
   				float: right;
			    width: 430px;
			    height: 390px;
			    background-color: white;
			    margin: 2px;
			    padding: 2px;
   			}
   			.divbiaoti_t3{
			    width: 673px;
			    height: 30px;
			   /* background-color: #9CB945;*/
			    float: left; 
			    margin-top: 2px;
   			}
   			.divbiaoti_t4{
			    width: 673px;
			    height: 339px;
			    background-color: #9CB945;
			    float: left; 
   			}
   			.divbiaoti_t5{
			    width: 500px;
			    height: 330px;
			    background-color: white;
			    float: right; 
   			}
   			.divbiaoti_t6{
   				 float: left; 
   			}
   			.divbiaoti_t7{
			    width: 100%;
			    height: 100px;
			    background-color: white;
			    float: left; 
   			}
   			.foot{
			    background: #d8f1f6;
			    border-top: 3px solid #0188a0;
			    height: 106px;
			    text-align: center;
			   /* line-height: 106px;*/
			    margin-top: 85px;
			    clear: both;
   			}
   			.foot_img{
   				margin-top: -35px;
   			}
   			.img_class{
   				margin: 10px;
   			}
   			.from_class{
			    width: 1149px;
			    height: auto;
			    padding :20px;
			    margin: auto;
   			}
   			.fontRed{
   				color: red;
   			}
   			.imputFrom{
   				width:222px;
   			}
   			.tsjbInput{}
   			
			.heder {
				margin: 10px auto;
				width: 800px;
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
			.conText {
				margin: 10px auto;
				width: 1000px;
				min-height: 500px;
				border-style: solid;
				border-width: 1px;
				border-color: #c2c2c2;
				background-color: #eeeeee;
			}
			
			.conTextbody {
				margin: 10px auto;
				width: 800px;
				min-height: 200px;
			}
			
			
        </style>
    </head>
    <body>
    
    	<div class="touDiv">
    		<img class="imgtou1" src="<%=request.getContextPath()%>/r3/imgs/LOGO-quan.png"/>
    		<img class="imgtou2" src="<%=request.getContextPath()%>/r3/imgs/erwei.png"/>
    	</div>
		<div class="layui-ba" style="margin-top: 5px;">
			<ul class="layui-nav layui-bg-blue" lay-filter="">
			  <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/pages/anon/sunshine_service.jsp"><span style="color: #000000; font-size: 18px;">首页</span></a></li>
			  <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/index.html"><span style="color: #000000; font-size: 18px;">学院网首页</span></a></li>
			</ul>
		</div>
			<table class="layui-table" style="width: 900px; margin: auto; margin-top: 10px; color: #000000;">
				<tbody>
					<tr>
						<td style="width: 15%;">编号:</td>
						<td id="sunshineNumber" style="width: 35%;"></td>
						<td style="width: 15%;">来信人：</td>
						<td id="sunshineName" style="width: 35%;"></td>
					</tr>
					<tr>
						<td style="width: 15%;">来信时间：</td>
						<td id="sunshineLetterTime" style="width: 35%;"></td>
						<td style="width: 15%;">服务类型：</td>
						<td id="sunshineCategory" style="width: 35%;"></td>
					</tr>
					<tr>
						<td style="width: 15%;">受理单位：</td>
						<td id="sunshineAdmissible" style="width: 35%;"></td>
						<td style="width: 15%;">办理状态：</td>
						<td style="width: 35%;"><span id="sunshineState"></span></td>
					</tr>
					<tr>
						<td style="width: 15%;">来信主题：</td>
						<td id="sunshineTitle" style="width: 85%;" colspan="3"></td>
					</tr>
					<tr>
						<td style="width: 15%;">来信内容：</td>
						<td id="sunshineContent" style="width: 85%;" colspan="3"></td>
					</tr>
				</tbody>
			</table>
			<table class="layui-table" style="width: 900px; margin: auto; margin-top: 10px; color: #000000;" id="tab02">
				<tbody>
					<tr>
						<td style="width: 15%;">回文单位：</td>
						<td style="width: 35%;">湖南省工商技术职业学院</td>
						<td style="width: 15%;">办理时间：</td>
						<td id="sunshineHandlingTime" style="width: 35%;"></td>
					</tr>
					<tr>
						<td style="width: 15%;">处理结果：</td>
						<td id="sunshineResults" style="width: 85%;" colspan="3"></td>
					</tr>
				</tbody>
			</table>
			
		<div class="foot">
			<div class="foot_img">
				<img src="<%=request.getContextPath()%>/r3/imgs/LOGO.png" />
			</div>
			<span>
				Copyright 2009-2020 http://www.hngsxy.com All Rights Reserved&nbsp;&nbsp;&nbsp;版权所有： 湖南工商职业学院 2009-2020
				<br />
				地址：湖南省衡阳市石鼓区松木塘经济开发区&nbsp;&nbsp;&nbsp;邮编：421001
				联系电话:0734-8593338&nbsp;&nbsp;&nbsp;传真:0734-8593325&nbsp;&nbsp;&nbsp;学院网站：www.hngsxy.com
				<br />
				<img src="/r3/imgs/gonggongImg/beianbgs.png" style="width: 20px; height: 20px;"/>
				前置审核编号：湘教QS4_201212_040024&nbsp;&nbsp;&nbsp;网站备案号：湘ICP备12013408号
			</span>
		</div>

 	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.2.1/layui/layui.js"></script>
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
				var sunshineNumber = v['sunshineNumber'];
				//console.log(sunshineNumber)
			}
	
	
		//查询
		function findSunshineServiceOne() {
			//查询的方法
			if(sunshineNumber != null) {
				//查询一个新闻信息
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/findSunshineServiceBySunshineNumber",
					data: {
						sunshineNumber: sunshineNumber
					},
					async: false,
					dateType: "json",
					//timeout:12000,
					success: function(data) {
						//console.log(data);
						$("#sunshineNumber").text(data.sunshineNumber);
						$("#sunshineName").text(data.sunshineName);
						$("#sunshineLetterTime").text(data.sunshineLetterTime.substring(0, 10));

						if(data.sunshineCategory == '1') {
							$("#sunshineCategory").text('热点咨询');
						} else if(data.sunshineCategory == '2') {
							$("#sunshineCategory").text('学生/家长');
						} else if(data.sunshineCategory == '3') {
							$("#sunshineCategory").text('教师');
						} else if(data.sunshineCategory == '4') {
							$("#sunshineCategory").text('教育机构');
						} else if(data.sunshineCategory == '5') {
							$("#sunshineCategory").text('社会人员');
						} else if(data.sunshineCategory == '6') {
							$("#sunshineCategory").text('教育收费');
						} else if(data.sunshineCategory == '7') {
							$("#sunshineCategory").text('师德师风');
						} else if(data.sunshineCategory == '8') {
							$("#sunshineCategory").text('教师权益');
						} else if(data.sunshineCategory == '9') {
							$("#sunshineCategory").text('学生权益');
						} else if(data.sunshineCategory == '10') {
							$("#sunshineCategory").text('校园安全');
						} else if(data.sunshineCategory == '11') {
							$("#sunshineCategory").text('教育培训');
						} else if(data.sunshineCategory == '12') {
							$("#sunshineCategory").text('教学管理');
						} else if(data.sunshineCategory == '13') {
							$("#sunshineCategory").text('后勤服务');
						} else if(data.sunshineCategory == '14') {
							$("#sunshineCategory").text('服务质量');
						} else if(data.sunshineCategory == '15') {
							$("#sunshineCategory").text('其他');
						} else if(data.sunshineCategory == '16') {
							$("#sunshineCategory").text('群众表扬');
						} else if(data.sunshineCategory == '17') {
							$("#sunshineCategory").text('群众建议');
						} else if(data.sunshineCategory == '18') {
							$("#sunshineCategory").text('高等学校');
						} else if(data.sunshineCategory == '19') {
							$("#sunshineCategory").text('社会公众或机构');
						}

						//回文单位
						$("#sunshineAdmissible").text('湖南省工商职业学院');
						if(data.sunshineState == '0') {
							$("#sunshineState").text('等待办理');
							$("#sunshineState").css('color', 'red');
							$("#tab02").hide();
						}
						if(data.sunshineState == '1') {
							$("#sunshineState").text('已办理');
							$("#sunshineState").css('color', '#009900');
							$("#tab02").show();
						}
						if(data.sunshineState == '2') {
							$("#sunshineState").text('已结办');
							$("#sunshineState").css('color', '#0066CC');
							$("#tab02").show();
						}

						$("#sunshineTitle").text(data.sunshineTitle);
						$("#sunshineContent").text(data.sunshineContent);
						$("#sunshineHandlingTime").text(data.sunshineHandlingTime.substring(0, 10));
						
						//新闻体
						var str = data.sunshineResults;
						var oldPic = $("#sunshineResults").html();
						var newPic = oldPic + str;
						$("#sunshineResults").html(newPic);

						
						//$("#sunshineResults").text(data.sunshineResults);

					}
				})

			}
		}
	
	
	
//	function findGsxySunshineServiceNewsOne(){
//						//查询新闻对象
//				$.ajax({
//					type: "post",
//					//url: "<%=request.getContextPath()%>/anon/findGsxySunshineServiceNewsOne",
//					data: {
//						sunshineNumber: sunshineNumber
//					},
//					async: false,
//					dateType: "json",
//					//timeout:12000,
//					success: function(data) {
//						//console.log(data);
//						$("#tiele1").text(data.newsTitle);
//						$("#newsReleaseTime").text(data.newsReleaseTime.substring(0,10));
//						$("#newsSource").text(data.newsSource);
//						$("#newsReleaseUser").text(data.newsReleaseUser);
//						//$("#userName").val(data.newsReleaseUser);
//						//$("#newsContext").html(data.newsContext);
//						
//						//新闻体
//						var str = data.newsContext;
//						var oldPic = $("#newsContext").html();
//						var newPic = oldPic + str;
//						$("#newsContext").html(newPic);
//
//					}
//				});
//	}
	
	$(function(){
			findSunshineServiceOne();
	});
	
	
	
	
	
	</script>
</html>