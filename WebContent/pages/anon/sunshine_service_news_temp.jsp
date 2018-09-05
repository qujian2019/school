<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<title>阳光服务大厅</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <input type="hidden" id="studentPicture" />
    	<div class="touDiv">
    		<img class="imgtou1" src="<%=request.getContextPath()%>/r3/imgs/LOGO-quan.png"/>
    		<img class="imgtou2" src="<%=request.getContextPath()%>/r3/imgs/erwei.png"/>
    	</div>
		<div class="layui-ba" style="margin-top: 5px;">
			<ul class="layui-nav layui-bg-blue" lay-filter="">
			  <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/pages/anon/sunshine_service.jsp"><span style="color: #000000; font-size: 18px;">首页</span></a></li>
			  <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/index.jsp"><span style="color: #000000; font-size: 18px;">学院网首页</span></a></li>
			</ul>
		</div>
		<div class="conText">
			<h2 class="htitle" id="tiele1"></h2>
			<div class="heder">
				<span style="float: left;"><span id="newsReleaseTime"></span><!--<span style="margin-left: 10px;">来源：<span id="newsSource"></span></span>-->
			</div>

			<div class="conTextbody" id="newsContext">

			</div>
			<div class="footing">
				<span style="float: right;">（责任编辑：<span id="newsReleaseUser"></span>）</span>
			</div>
		</div>
 
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
				var newsId = v['newsId'];
				//console.log(newsId)
			}
	
	
	function findGsxySunshineServiceNewsOne(){
						//查询新闻对象
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/findGsxySunshineServiceNewsOne",
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
						$("#newsSource").text(data.newsSource);
						$("#newsReleaseUser").text(data.newsReleaseUser);
						//$("#userName").val(data.newsReleaseUser);
						//$("#newsContext").html(data.newsContext);
						
						//新闻体
						var str = data.newsContext;
						var oldPic = $("#newsContext").html();
						var newPic = oldPic + str;
						$("#newsContext").html(newPic);

					}
				});
	}
	
	$(function(){
			findGsxySunshineServiceNewsOne();
	});
	
	
	
	
	
	</script>
</html>