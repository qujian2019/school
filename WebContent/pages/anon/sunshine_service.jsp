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
        		margin-left: 350px;
        		
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
			  /*  background-color: #5FB878;*/
   			}
   			.divbiaoti_t1{
			    width: 100%;
			    height: 35px;
			   /* background-color: #E4B9C0;*/
			    float: left; 
			    margin-top: 2px;
   			}
   			.divbiaoti_t2{
			    width: 100%;
			    height: 400px;
			    background-color: white;
			   /* float: right; */
			    margin-top: 2px;
			    border:1px solid #c2c2c2;
			   /* background-color: #C2CCD1;*/
   			}
   			.divbiaoti_t2_1{
   				width: 400px;
			    height: 30px;
			    /*background-color: #F5E79E;   	*/			
   			}
   			.divbiaoti_t2_2{
   				width: 733px;
			    height: 390px;
			    /*background-color: #F7E1B5; */
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
			    width: 700px;
			    height: 30px;
			   /* background-color: #9CB945;*/
			    float: left; 
			    margin-top: 2px;
   			}
   			.divbiaoti_t4{
			    width: 700px;
			    height: 339px;
			   /* background-color: #9CB945;*/
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
 			.liclass {
				padding: 5px;
			}
			
		    .liclass1{
		        height: 25px;
		        line-height: 25px;
		       
		    }
		    #newsTypeIsPublish ul{
		       /* margin-top: 125px;*/ 
		       /* width: 150px;*/
		       
		    }
		    
		    #three{
/*		    	list-style: none;
		        margin: 0;
		        padding: 0;
		    	*/
		       /* margin: 30px auto;*/
		        overflow: hidden;
		        /*border: 1px solid blue;*/
		 /*       height: 127px;
		        width: 200px;*/
		    }
		    #three ul{
/*		        list-style: none;
		        margin: 0;
		        padding: 0;*/
	/*	        margin-top: 125px;
		        width: 100%;*/
		    }
		    
		    
        </style>
    </head>
    <body>
    <input type="hidden" id="studentPicture" />
    	<div class="touDiv">
    		<img class="imgtou1" src="<%=request.getContextPath()%>/r3/imgs/LOGO-quan.png"/>
    		<img class="imgtou2" src="<%=request.getContextPath()%>/r3/imgs/erwei.png"/>
    		<div class="div_wai">
    			<p><img class="div_img" src="<%=request.getContextPath()%>/r3/imgs/1-banshizhinan.png" /></p>
    			<p class="nav_title">办事指南</p>
					<ul class="layui-nav layui-bg-green" lay-filter="" style="width: 136px;margin: 12px;">
					  <li class="layui-nav-item">
					    <a href="<%=request.getContextPath()%>/pages/anon/sunshine_service_news_more.jsp?newType=SGFW1">点击进入</a>
					   <!--  <dl class="layui-nav-child"> 
					      <dd><a href="">网上办事</a></dd>
					      <dd><a href="">网上查询</a></dd>
					      <dd><a href="">服务电话</a></dd>
					      <dd><a href="">下载服务</a></dd>
					    </dl> -->
					  </li>
					</ul>
    		</div>
    		<div class="div_wai1">
    			<p><img class="div_img" src="<%=request.getContextPath()%>/r3/imgs/1-zhencezhixun.png" /></p>
    			<p class="nav_title">政策咨询</p>
					<ul class="layui-nav layui-bg-green" lay-filter="" style="width: 136px;margin: 12px;">
					  <li class="layui-nav-item">
					    <a href="javascript:;" id="inzczx">点击进入</a>
					    <!--  <dl class="layui-nav-child"> 
					      <dd><a href="">教师</a></dd>
					      <dd><a href="">学生/家长</a></dd>
					      <dd><a href="">教育机构</a></dd>
					      <dd><a href="">社会共众</a></dd>
					    </dl>-->
					  </li>
					</ul>
    		</div>
    		<div class="div_wai2">
    			<p><img class="div_img" src="<%=request.getContextPath()%>/r3/imgs/1-xinxigongkai.png" /></p>
    			<p class="nav_title">信息公开</p>
					<ul class="layui-nav layui-bg-green" lay-filter="" style="width: 136px;margin: 12px;">
					  <li class="layui-nav-item">
					    <a href="<%=request.getContextPath()%>/pages/anon/sunshine_service_news_more.jsp?newType=SGFW0">点击进入</a>
<!--					    <dl class="layui-nav-child"> 
					      <dd><a href="">政府公开</a></dd>
					      <dd><a href="">公开指南</a></dd>
					      <dd><a href="">申请公开</a></dd>
					      <dd><a href="">通知公告</a></dd>
					    </dl>-->
					  </li>
					</ul>
    		</div>
    		<div class="div_wai3">
    			<p><img class="div_img2" src="<%=request.getContextPath()%>/r3/imgs/1-zixuntousu.png" /></p>
    			<p class="nav_title">咨询投诉</p>
					<ul class="layui-nav layui-bg-green" lay-filter="" style="width: 136px; margin: 12px;">
					  <li class="layui-nav-item">
					    <a href="javascript:;" id="intszx">点击进入</a>
					   <!-- <dl class="layui-nav-child"> 
					      <dd><a href="">投诉受理</a></dd>
					      <dd><a href="">咨询反馈</a></dd>
					    </dl> -->
					  </li>
					</ul>
    		</div>
    		<div class="div_wai4">
    			<p><img class="div_img2" src="<%=request.getContextPath()%>/r3/imgs/1-yuqingfanying.png" /></p>
    			<p class="nav_title">舆情反映</p>
					<ul class="layui-nav layui-bg-green" lay-filter="" style="width: 136px;margin:14px;">
					  <li class="layui-nav-item">
					    <a href="javascript:;" id="img_class5">点击进入</a>
					   <!--  <dl class="layui-nav-child"> 二级菜单 
					      <dd><a href="">舆情反映</a></dd>

					    </dl>-->
					  </li>
					</ul>
    		</div>
    	</div>
	<div class="layui-ba">
		<ul class="layui-nav layui-bg-blue" lay-filter="">
		  <li class="layui-nav-item"><a href="/pages/anon/sunshine_service.jsp"><span style="color: #000000; font-size: 18px;">首页</span></a></li>
<!--		  <li class="layui-nav-item">
		    <a href="javascript:;"><span style="color: #000000; font-size: 18px;">办事指南</span></a>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><span style="color: #000000; font-size: 18px;">政策咨询</span></a>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><span style="color: #000000; font-size: 18px;">信息公开</span></a>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;"><span style="color: #000000; font-size: 18px;">咨询投诉</span></a>
		  </li>
		  <li class="layui-nav-item"><a href=""><span style="color: #000000; font-size: 18px;">舆情反映</span></a></li>-->
		  <li class="layui-nav-item"><a href="/index.html"><span style="color: #000000; font-size: 18px;">学院网首页</span></a></li>
		</ul>
	</div>
	<div class="divbiaoti">
<!--		<div class="divbiaoti_t1">
			<img src="<%=request.getContextPath()%>/r3/imgs/zixunfankui.png" /><span style="font-size: 14pt; margin-left: 10px;">咨询反馈</span>
		</div>-->
		<div class="divbiaoti_t2">
	<!--		<div class="divbiaoti_t2_1">
				<img src="<%=request.getContextPath()%>/r3/imgs/yangguangfuwuzixun.png" /><span style="font-size: 14pt; margin-left: 10px;">阳光资讯服务</span>
			</div>-->
			<div class="divbiaoti_t2_3">
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				  <ul class="layui-tab-title">
				    <a href="<%=request.getContextPath()%>/pages/anon/sunshine_service_news_more.jsp?newType=SGFW0"><li class="layui-this" id="dinews1">信息公开</li></a>
				    <a href="<%=request.getContextPath()%>/pages/anon/sunshine_service_news_more.jsp?newType=SGFW2"><li id="dinews2">常见问题</li></a>
				    <a href="<%=request.getContextPath()%>/pages/anon/sunshine_service_news_more.jsp?newType=SGFW3"><li id="dinews3">热点问题</li></a>
				  </ul>
				  <div class="layui-tab-content" id="dinews1_1">
						<script id="demoSGFW0" type="text/html">
							<ul>
								{{# layui.each(d.list, function(index, item){ }} {{# if(index == 5){return true;} }}
								<li class="liclass">
									
										<a onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
									
								</li>
								{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
							</ul>
						</script>
						<div id="newsTypeIsSGFW0"></div>
				  </div>
				  <div class="layui-tab-content" id="dinews1_2">
						<script id="demoSGFW2" type="text/html">
							<ul>
								{{# layui.each(d.list, function(index, item){ }} {{# if(index == 5){return true;} }}
								<li class="liclass">
									
										<a onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
									
								</li>
								{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
							</ul>
						</script>
						<div id="newsTypeIsSGFW2"></div>
				  </div>
				  <div class="layui-tab-content" id="dinews1_3">
						<script id="demoSGFW3" type="text/html">
							<ul>
								{{# layui.each(d.list, function(index, item){ }} {{# if(index == 5){return true;} }}
								<li class="liclass">
									
										<a onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
									
								</li>
								{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
							</ul>
						</script>
						<div id="newsTypeIsSGFW3"></div>
				  </div>
				</div>    
			</div>
			<div class="divbiaoti_t2_2">
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
				  <ul class="layui-tab-title">
				   <a href="<%=request.getContextPath()%>/pages/anon/sunshine_service_news_more.jsp?newType=SGFW5"><li class="layui-this">阳光资讯</li></a>
				  </ul>
				  <div class="layui-tab-content">
					<div class="layui-carousel" id="carousel1" style="float: left;">
						<div carousel-item id="lbtrq">
							<!--
					        	描述：教务处图片
					        -->
						</div>
					</div>
						<script id="demoSGFW5" type="text/html">
							<ul>
								{{# layui.each(d.list, function(index, item){ }} {{# if(index == 5){return true;} }}
								<li class="liclass">
									
										<a onclick="selectOne({{ item.newsId}})">{{ item.newsTitle }}</a>
									
								</li>
								{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
							</ul>
						</script>
						<div id="newsTypeIsSGFW5" style="float: left; margin-left: 10px;"></div>
				  </div>
				</div>    
			</div>


		</div>
		<div class="divbiaoti_t1">
			<img src="<%=request.getContextPath()%>/r3/imgs/zixunfankui.png" /><span style="font-size: 14pt; margin-left: 10px; margin-right: 40px;">咨询反馈</span>
			<span>受理编号：</span><input name="sunshineNumber" type="text" id="sunshineNumberInput"/>
			<button class="layui-btn layui-btn-sm" id="findSunshineNumber">查询</button>
			<span>结办码：</span><input name="sunshineEnd" type="text" id="sunshineEndInput"/>
			<button class="layui-btn layui-btn-sm" id="findSunshineEnd">提交</button>
		</div>
		<div class="divbiaoti_t3">
			<table class="layui-table" style="margin: 0px;" lay-size="sm">
			  <thead>
			    <tr>
			      <th style="width: 3px;">受理单号</th>
			      <th style="width: 30px;">标题</th>
			      <th style="width: 3px;">日期</th>
			      <th style="width: 3px;">来访人</th>
			      <th style="width: 3px;">办理状态</th>
			    </tr> 
			  </thead>
			</table>
		</div>
		<div class="divbiaoti_t4" id="three">
			<!--<script id="demoPublish" type="text/html">
			<table class="layui-table" style="margin: 0px;" lay-size="sm">
			  <thead>
					{{# layui.each(d.list, function(index, item){ }} 
					    <ul>
					      <li class="liclass1">
					      	<span>{{ item.sunshineNumber }}</span>
					      	<span>{{ item.sunshineTitle }}</span>
					      	<span>{{ item.sunshineLetterTime.substring(0,10) }}</span>
					      	<span>{{ item.sunshineName }}</span>
					      	<span>{{ item.sunshineState }}</span>
					      </li>
					    </ul>
					{{# }); }} {{# if(d.list.length === 0){ }} 无数据 {{# } }}
			  </thead>
			</table>
			</script>-->
			<!--<div id="three">
				 <ul id="sunshineNumberTmpe">
					<li class="liclass1">1</li>   	             
				 </ul>
			</div>-->
				 <ul id="sunshineNumberTmpe">
					 	             
				 </ul>
		</div>
		<div class="divbiaoti_t5">
			<img id="img_class1" class="img_class" src="<%=request.getContextPath()%>/r3/imgs/mk1.jpg" />
			<img id="img_class2" class="img_class" src="<%=request.getContextPath()%>/r3/imgs/mk2.jpg" />
			<img id="img_class3" class="img_class" src="<%=request.getContextPath()%>/r3/imgs/mk3.jpg" />
			<img id="img_class4" class="img_class" src="<%=request.getContextPath()%>/r3/imgs/mk4.jpg" />
		</div>
<!--		<div class="divbiaoti_t1">
			<img src="<%=request.getContextPath()%>/r3/imgs/bianmingfuwu.png" /><span style="font-size: 14pt; margin-left: 10px;">便民服务</span>
		</div>
		<div class="divbiaoti_t6">
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;"><img src="<%=request.getContextPath()%>/r3/imgs/bmfw1.jpg"/></a>
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;">一个可跳转的按钮</a>
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;">一个可跳转的按钮</a>
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;">一个可跳转的按钮</a>
			<br />
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;">一个可跳转的按钮</a>
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;">一个可跳转的按钮</a>
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;">一个可跳转的按钮</a>
			<a href="http://www.layui.com" class="layui-btn layui-btn-primary" style="width: 265px; height: 68px;">一个可跳转的按钮</a>
		</div>-->
		<div class="divbiaoti_t1">
			<img src="<%=request.getContextPath()%>/r3/imgs/youqinglianjie.png" /><span style="font-size: 14pt; margin-left: 10px;">友情连接</span>
		</div>
		<div class="divbiaoti_t7">
			<a target="_blank" href="http://fuwu.hnedu.cn/web/index.jsp" style="margin: 10px;">湖南省教育阳光服务大厅</a>
			<a target="_blank" href="http://www.gov.hnedu.cn/" style="margin: 10px;">湖南省教育政务网</a>
		</div>
	</div>
	
	<div id="from1" class="from_class">
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
		  <ul class="layui-tab-title"> 
		    <li class="layui-this" id="form1_1">政策咨询</li>
<!--		    <li class="layui-icon" id="form1_2">投诉举报</li>
		    <li class="layui-icon" id="form1_3">群众表扬</li>
		    <li class="layui-icon" id="form1_4">群众建议</li>-->
		  </ul>
		  <div class="layui-tab-content">
				<span class="layui-badge-dot" style="margin-right: 20px;"></span>个人信息（注意：标有 <span class="fontRed">*</span> 的必须填写,请尽量填写真实资料，我们将为您严格保密）
				<hr class="layui-bg-green">
				<form class="layui-form" action="#" name="formStudent">
				  <div class="layui-form-item">
				    <label class="layui-form-label"><span class="fontRed">*</span>姓&nbsp;&nbsp;名：</label>
				    <div class="layui-input-block">
				      <input type="text" name="sunshineName" required  lay-verify="required|userCode" placeholder="请输入姓名" autocomplete="off" class="layui-input imputFrom">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label"><span class="fontRed">*</span>手机号：</label>
				    <div class="layui-input-block">
				      <input type="text" name="sunshinePhone" required  lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input imputFrom">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">电子邮箱：</label>
				    <div class="layui-input-block">
				      <input type="text" name="sunshineMailbox" placeholder="请输入电子邮箱" autocomplete="off" class="layui-input imputFrom">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">联系地址：</label>
				    <div class="layui-input-block">
				      <input type="text" name="sunshineAddress" placeholder="请输入联系地址" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">性  别：</label>
				    <div class="layui-input-block">
				      <input type="radio" name="sunshineSex" value="男" title="男" checked>
				      <input type="radio" name="sunshineSex" value="女" title="女">
				    </div>
				  </div>
				  <span class="layui-badge-dot" style="margin-right: 20px;"></span>政策咨询事项信息（注意：标有 <span class="fontRed">*</span>
				   的必须填写,请尽量填写真实资料，我们将为您严格保密）
				  <hr class="layui-bg-green">
				  <div class="layui-form-item" id="zczxDiv">
				    <label class="layui-form-label"><span class="fontRed">*</span>选择类别：</label>
				    <div class="layui-input-block">
				    <!-- 政策咨询 -->
				      <input  lay-verify="aihao" type="radio" name="sunshineCategory" value="1" title="热点咨询" checked>
				      <input  lay-verify="aihao" type="radio" name="sunshineCategory" value="2" title="学生/家长" >
				      <input  lay-verify="aihao" type="radio" name="sunshineCategory" value="3" title="教师" >
				      <input  lay-verify="aihao" type="radio" name="sunshineCategory" value="4" title="教育机构" >
				      <input  lay-verify="aihao" type="radio" name="sunshineCategory" value="5" title="社会人员" >
				    </div>
				  </div>
				  <div class="layui-form-item" id="tsjbDiv">
				    <label class="layui-form-label"><span class="fontRed">*</span>选择类别：</label>
				    <div class="layui-input-block">
				    <!-- 投诉举报  -->
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="6" title="教育收费" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="7" title="师德师风" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="8" title="教师权益" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="9" title="学生权益" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="10" title="校园安全" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="11" title="教育培训" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="12" title="教学管理" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="13" title="后勤服务" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="14" title="服务质量" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="15" title="其他" >
				    </div>
				  </div>
				  <div class="layui-form-item" id="qzbyDiv"> 
				    <label class="layui-form-label"><span class="fontRed">*</span>选择类别：</label>
				   <div class="layui-input-block">
				    <!-- 群众表扬-->
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="16" title="群众表扬" id="qzbyRadio" >
				    </div>
				  </div>
				  <div class="layui-form-item" id="qzjyDiv">
				    <label class="layui-form-label"><span class="fontRed">*</span>选择类别：</label>
				    <div class="layui-input-block">
				    <!-- 群众建议-->
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="17" title="群众建议" >
				    </div>
				  </div>
				  <div class="layui-form-item" id="yqfyDiv">
				    <label class="layui-form-label"><span class="fontRed">*</span>选择类别：</label>
				    <div class="layui-input-block">
				    <!-- 群众建议-->
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="18" title="高等学校" >
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="19" title="社会公众或机构" >
				      <!--<input lay-verify="aihao" type="radio" name="sunshineCategory" value="20" title="其他" >-->
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label"><span class="fontRed">*</span>标&nbsp;&nbsp;题：</label>
				    <div class="layui-input-block">
				      <input type="text" name="sunshineTitle" required  lay-verify="required|title" placeholder="请输入标题" autocomplete="off" class="layui-input imputFrom">
				    </div>
				  </div>
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label"><span class="fontRed">*</span>文本域：</label>
				    <div class="layui-input-block">
				      <textarea name="sunshineContent" placeholder="请输入内容" class="layui-textarea"  lay-verify="required|content"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">附&nbsp;&nbsp;件：</label>
				    <div class="layui-input-block">
				    	<span class="fontRed">(文件大小不超过5M，允许上传的文件类型(.jpg,.png,.txt,.doc,.ppt,.xls,.pdf,.docx,.xlsx))</span><br />
						<button type="button" class="layui-btn layui-btn-normal" id="test6">
							选择文件
						</button>
						<button type="button" class="layui-btn" id="test7">
							开始上传
						</button>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">是否公开：</label>
				    <div class="layui-input-block">
				      <input type="radio" name="sunshinePublic" value="1" title="是" checked>
				      <input type="radio" name="sunshinePublic" value="0" title="否">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				</form>
		  </div>
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
		//高亮变色
		$(document).on("mouseover",".liclass",function() {
			//$(".liclass01").eq(this).children().css("color","#0055AA");
			$(this).children().css("color","#0055AA");
			
		}).on("mouseout",".liclass", function() {
			//$(".liclass01").eq(this).children().css("color","#000000");
			$(this).children().css("color","#000000");
		});
	
	//轮播图
	layui.use('carousel', function() {
		var carousel2 = layui.carousel;

		carousel2.render({
			elem: '#carousel1',
			width: '366px',
			height: '320px',
			interval: 4000
		});
	});
	
	
	
	
	
	$(function(){
		
		$("#findSunshineNumber").on("click",function(){
			//查询阳光服务
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/findSunshineServiceBySunshineNumber",
				async: true,
				data: {
					sunshineNumber: $("#sunshineNumberInput").val()
				},
				success: function(data) {
					//console.log(data);
					if(data!=null&&data!=''){
						layer.msg('查询到了服务信息');
						
						var url = '<%=request.getContextPath()%>/pages/anon/detailed_information.jsp?sunshineNumber=' + $("#sunshineNumberInput").val();
						
						window.open(url);
					}else{
						layer.msg('没有服务信息');
					}
				}
			});
		});

		$("#findSunshineEnd").on("click",function(){
			//查询阳光服务
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/updateSunshineStateBySunshineEnd",
				async: true,
				data: {
					sunshineEnd: $("#sunshineEndInput").val()
				},
				success: function(data) {
					//console.log(data);
					if(data>0){
						layer.msg('感谢你的合作');
					}else{
						layer.msg('结办码错误或已结办');
					}
				}
			});
			
			
			
		});



			//查询教务处图片
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/selectGsxySunshineServiceTypeIsImg",
				async: false,
				data: {
					newType: "SGFW4"
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data) {
					var temp01 = [];
					for(var i = 0; i < 5; i++) {
						temp01.push("<div><img src='" + data[i].newsCarouselPath + "'></div>");
						//if(i === 5){return true;}
					}
					if(temp01.length>0){
						$("#lbtrq").append(temp01);
					}
				}
			});
	
			//查询信息
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/selectSunshineServiceByPublish1",
				async: false,
				data: {
					// sunshineNumber  sunshineTitle
					
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data) {
					var temp01 = [];
					for(var i = 0; i < data.length; i++) {
					
						if(data[i].sunshineState==1){
							temp01.push(
							"<li class='liclass1'>"+
										"<div style='float: left; width: 130px;'>"+
											data[i].sunshineNumber+
										"</div>"+ 
										"<div style='float: left; width: 195px;'>"+
											data[i].sunshineTitle+
										"</div>"+
										"<div style='float: left; width: 125px;'>"+
											data[i].sunshineLetterTime.substring(0,10)+
										"</div>"+
										"<div style='float: left; width: 130px;'>"+
											data[i].sunshineName.substring(0,1)+"**"+
										"</div>"+
										"<div style='float: left;'>"+
											"<span style='color:#009900;'>已办理</span>"+
										"</div>"+
							"</li>"
							);
						}else if(data[i].sunshineState==2){
							temp01.push(
							"<li class='liclass1'>"+
										"<div style='float: left; width: 130px;'>"+
											data[i].sunshineNumber+
										"</div>"+ 
										"<div style='float: left; width: 195px;'>"+
											data[i].sunshineTitle+
										"</div>"+
										"<div style='float: left; width: 125px;'>"+
											data[i].sunshineLetterTime.substring(0,10)+
										"</div>"+
										"<div style='float: left; width: 130px;'>"+
											data[i].sunshineName.substring(0,1)+"**"+
										"</div>"+
										"<div style='float: left;'>"+
											"<span style='color:#0066CC;'>已结办</span>"+
										"</div>"+
							"</li>"
							);
						}else if(data[i].sunshineState==0){
							temp01.push(
							"<li class='liclass1'>"+
										"<div style='float: left; width: 130px;'>"+
											data[i].sunshineNumber+
										"</div>"+ 
										"<div style='float: left; width: 195px;'>"+
											data[i].sunshineTitle+
										"</div>"+
										"<div style='float: left; width: 125px;'>"+
											data[i].sunshineLetterTime.substring(0,10)+
										"</div>"+
										"<div style='float: left; width: 130px;'>"+
											data[i].sunshineName+
										"</div>"+
										"<div style='float: left;'>"+
											"<span style='color:#ff0000;'>办理中</span>"+
										"</div>"+
							"</li>"
							);
						}

					}
					if(temp01.length>0){
						$("#sunshineNumberTmpe").append(temp01);
					}
				}
			});
			
			
			
	});
	
	
				$("#dinews1_1").show();
				$("#dinews1_2").hide();
				$("#dinews1_3").hide();
	
				$("#dinews1").on("mouseover", function() {
					$("#dinews1").addClass("layui-this");
					$("#dinews2").removeClass("layui-this");
					$("#dinews3").removeClass("layui-this");

					$("#dinews1_1").show();
					$("#dinews1_2").hide();
					$("#dinews1_3").hide();
				}).on("mouseout", function() {
					//			$("#newsli1").removeClass("layui-this");
				});

				$("#dinews2").on("mouseover", function() {
					$("#dinews2").addClass("layui-this");
					$("#dinews1").removeClass("layui-this");
					$("#dinews3").removeClass("layui-this");
					
					$("#dinews1_1").hide();
					$("#dinews1_2").show();
					$("#dinews1_3").hide();
				}).on("mouseout", function() {
					//			$("#newsli1").removeClass("layui-this");
				});

				$("#dinews3").on("mouseover", function() {
					$("#dinews3").addClass("layui-this");
					$("#dinews2").removeClass("layui-this");
					$("#dinews1").removeClass("layui-this");
					$("#dinews1_1").hide();
					$("#dinews1_2").hide();
					$("#dinews1_3").show();
				}).on("mouseout", function() {
					//			$("#newsli1").removeClass("layui-this");
				});
	
	//新闻
	layui.use('laytpl', function() {
		var laytpl = layui.laytpl;
		
			//查询阳光新闻信息公开
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/findGsxySunshineServiceNewsTypeIs",
				async: false,
				data: {
					newType: "SGFW0"
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data) {
					//console.log(data)
					var tempSGFW0 = JSON.parse(data);
					var getTplSGFW0 = demoSGFW0.innerHTML,
						newsTypeIsSGFW0 = document.getElementById('newsTypeIsSGFW0');
					laytpl(getTplSGFW0).render(tempSGFW0, function(html) {
						newsTypeIsSGFW0.innerHTML = html;
					});

				}
			});
			//查询阳光新闻常见问题
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/findGsxySunshineServiceNewsTypeIs",
				async: false,
				data: {
					newType: "SGFW2"
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data) {
					//console.log(data)
					var tempSGFW2 = JSON.parse(data);
					var getTplSGFW2 = demoSGFW2.innerHTML,
						newsTypeIsSGFW2 = document.getElementById('newsTypeIsSGFW2');
					laytpl(getTplSGFW2).render(tempSGFW2, function(html) {
						newsTypeIsSGFW2.innerHTML = html;
					});

				}
			});
			//查询阳光新闻热点问题
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/findGsxySunshineServiceNewsTypeIs",
				async: false,
				data: {
					newType: "SGFW3"
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data) {
					//console.log(data)
					var tempSGFW3 = JSON.parse(data);
					var getTplSGFW3 = demoSGFW3.innerHTML,
						newsTypeIsSGFW3 = document.getElementById('newsTypeIsSGFW3');
					laytpl(getTplSGFW3).render(tempSGFW3, function(html) {
						newsTypeIsSGFW3.innerHTML = html;
					});

				}
			});
			//查询阳光新闻阳光咨询
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/findGsxySunshineServiceNewsTypeIs",
				async: false,
				data: {
					newType: "SGFW5"
				},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(data) {
					//console.log(data)
					var tempSGFW5 = JSON.parse(data);
					var getTplSGFW5 = demoSGFW5.innerHTML,
						newsTypeIsSGFW5 = document.getElementById('newsTypeIsSGFW5');
					laytpl(getTplSGFW5).render(tempSGFW5, function(html) {
						newsTypeIsSGFW5.innerHTML = html;
					});

				}
			});

		
	});
	
	
	
	//Demo
	layui.use('form', function(){
	  var form = layui.form;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
//	    layer.msg(JSON.stringify(data.field));
//	    console.log(data.field);
	    
	   var uu = uuid();
	   var uu2 = uuid2();
			$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/insertGsxySunshineService",
					data: {
						sunshineNumber :uu,
						sunshineName: data.field.sunshineName,
						sunshinePhone: data.field.sunshinePhone,
						sunshineMailbox: data.field.sunshineMailbox,
						sunshineAddress: data.field.sunshineAddress,
						sunshineSex: data.field.sunshineSex,
						sunshineCategory: data.field.sunshineCategory,
						sunshineTitle:data.field.sunshineTitle,
						sunshineContent: data.field.sunshineContent,
						sunshinePublic: data.field.sunshinePublic,
						sunshineEnclosure: $("#studentPicture").val(),
						sunshineEnd:uu2
					},
					async: true,
					//timeout:12000,
					success: function(data) {
						if(data > 0) {
							layer.msg("信息发送成功<br>受理编号:"+uu+"<br>结办码:"+uu2,{
							time: 216000000, //20s后自动关闭
							btn: ['收到了']
							});
							var f3 = document.forms['formStudent'];
								f3.reset();

						} else {
							layer.msg("信息发送失败");
						}
					}
				});

	    return false;
	  });
			
	  
	  
	});
		
	
	
	
		$("#from1").hide();  
		$("#zczxDiv").hide();$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
		
			$("#img_class1").on("click",function(){
				$(".divbiaoti").hide();
				$("#form1_1").text("政策咨询");
				$("#zczxDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
			});
			$("#inzczx").on("click",function(){
				$(".divbiaoti").hide();
				$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
				$("#form1_1").text("政策咨询");
				$("#zczxDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
			});
			$("#intszx").on("click",function(){
				$(".divbiaoti").hide();
				$("#zczxDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
				$("#form1_1").text("投诉举报");
				$("#tsjbDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
			});
		
		
			$("#img_class2").on("click",function(){
				$(".divbiaoti").hide();
				$("#form1_1").text("投诉举报");
				$("#tsjbDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
			});
	
			$("#img_class3").on("click",function(){
				$(".divbiaoti").hide();
				$("#form1_1").text("群众表扬");
				$("#qzbyRadio").addClass("checked",'checked');
				$("#qzbyDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
			});
			
			$("#img_class4").on("click",function(){
				$(".divbiaoti").hide();
				$("#form1_1").text("群众建议");
				$("#qzjyDiv").show();
				//$("#qzjyChecked").attr("checked","checked");
				$("#from1").show();
			});
			
			$("#img_class5").on("click",function(){
				$(".divbiaoti").hide();
				$("#zczxDiv").hide();$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();
				$("#form1_1").text("舆情反映");
				$("#yqfyDiv").show();
				//$("#qzjyChecked").attr("checked","checked");
				$("#from1").show();
			});
	
	
	
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use('element', function(){
		  var element = layui.element;
		  
		  //…
		});
		
		//上传附件
		layui.use('upload', function() {
			var $ = layui.jquery,
				upload = layui.upload;

			upload.render({
				elem: '#test6',
				url: '<%=request.getContextPath()%>/anon/studentUploadPhotos',
				auto: false,
				method: 'post',
				field: 'myfile'
					//,multiple: true
					,
			    size: 5120, //限制文件大小，单位 KB
				accept: 'file',
				bindAction: '#test7',
				data: {
//					"fileFolderId": fileFolderIdtemp,
//					"fileCreateUser": name,
//					"userId": userId
				} //一同上传的数据
				,
				done: function(res) {
					//如果上传失败
					if(res.code > 0) {
						return layer.msg('上传失败');
					}else{
						layer.msg("上传成功");
					}
					
					//返回值
					//console.log(res)
					//console.log(res.studentTuPian);
					$("#studentPicture").val(res.studentTuPian);
				}
			});

		});

		function selectOne(newsId){
			var url = '<%=request.getContextPath()%>/pages/anon/sunshine_service_news_temp.jsp?newsId=' + newsId;
			window.open(url);
		}

		//uuid
		function uuid() {
		    var s = [];
		    var hexDigits = "0123456789abcdef";
		    for (var i = 0; i < 36; i++) {
		        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
		    }
		    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
		    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
		    s[8] = s[13] = s[18] = s[23] = "-";
		    var uuid = s.join("");
		    var uuid2 = uuid.substring(0,13);
		    return uuid2;
		}
		//uuid
		function uuid2() {
		    var s = [];
		    var hexDigits = "0123456789abcdef";
		    for (var i = 0; i < 36; i++) {
		        s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
		    }
		    s[14] = "4";  // bits 12-15 of the time_hi_and_version field to 0010
		    s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);  // bits 6-7 of the clock_seq_hi_and_reserved to 01
		    s[8] = s[13] = s[18] = s[23] = "-";
		    var uuid = s.join("");
		    var uuid2 = uuid.substring(0,10);
		    return uuid2;
		}
		
    //滚动公告
    function dd(){
        //每一秒减去25px----->一个li的高度
        //linear----->滚动更加流畅
        $('#three ul').animate({marginTop:'-=25px'},1000,"linear",function(){
            var top = $('#three ul').attr('style');
            //当有一个li出去时改变top值并克隆第一个li在ul内部进行追加
            if(top=='margin-top: -25px;'){
                $('#three ul').attr('style','margin-top: 0px;')
                $("#three ul li:first").remove().clone(true).appendTo("#three ul");
            }
        });
    }
    var int = setInterval(dd,1000);
    $('#three').hover(function(){
        clearInterval(int);
    },function(){
        int = setInterval(dd,1000);
    });
	</script>
</html>