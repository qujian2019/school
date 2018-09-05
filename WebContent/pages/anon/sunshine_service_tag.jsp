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
					    <a href="javascript:;">点击进入</a>
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
					    <a href="javascript:;">点击进入</a>
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
		  <li class="layui-nav-item"><a href=""><span style="color: #000000; font-size: 18px;">首页</span></a></li>
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
		  <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/index.jsp"><span style="color: #000000; font-size: 18px;">学院网首页</span></a></li>
		</ul>
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
				<form class="layui-form" action="#">
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
				      <input lay-verify="aihao" type="radio" name="sunshineCategory" value="20" title="其他" >
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
				      <button class="layui-btn" lay-submit lay-filter="zczxform">立即提交</button>
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
	
		//$("#from1").hide();  
		//$("#zczxDiv").hide();
		$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
		
			$("#img_class1").on("click",function(){
				//$(".divbiaoti").hide();
				$("#form1_1").text("政策咨询");
				$("#zczxDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
				$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
			});
			$("#inzczx").on("click",function(){
				//$(".divbiaoti").hide();
				$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
				$("#form1_1").text("政策咨询");
				$("#zczxDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
				$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
			});
			$("#intszx").on("click",function(){
				//$(".divbiaoti").hide();
				$("#zczxDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
				$("#form1_1").text("投诉举报");
				$("#tsjbDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
				$("#zczxDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
			});
		
		
			$("#img_class2").on("click",function(){
				//$(".divbiaoti").hide();
				$("#form1_1").text("投诉举报");
				$("#tsjbDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
				$("#zczxDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();
			});
	
			$("#img_class3").on("click",function(){
				//$(".divbiaoti").hide();
				$("#form1_1").text("群众表扬");
				$("#qzbyRadio").addClass("checked",'checked');
				$("#qzbyDiv").show();
				//$(".zczxInput:first").attr("checked","checked");
				$("#from1").show();
				$("#zczxDiv").hide();$("#qzjyDiv").hide();$("#yqfyDiv").hide();$("#zczxDiv").hide();$("#tsjbDiv").hide();
			});
			
			$("#img_class4").on("click",function(){
				//$(".divbiaoti").hide();
				$("#form1_1").text("群众建议");
				$("#qzjyDiv").show();
				//$("#qzjyChecked").attr("checked","checked");
				$("#from1").show();
				$("#zczxDiv").hide();$("#yqfyDiv").hide();$("#zczxDiv").hide();$("#qzbyDiv").hide();$("#tsjbDiv").hide();
			});
			
			$("#img_class5").on("click",function(){
				//$(".divbiaoti").hide();
				//$("#zczxDiv").hide();$("#tsjbDiv").hide();$("#qzbyDiv").hide();$("#qzjyDiv").hide();
				$("#form1_1").text("舆情反映");
				$("#yqfyDiv").show();
				//$("#qzjyChecked").attr("checked","checked");
				$("#from1").show();
			
				$("#zczxDiv").hide();$("#zczxDiv").hide();$("#qzbyDiv").hide();$("#tsjbDiv").hide();$("#qzjyDiv").hide();
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

		//新增一条阳光服务。。。
		layui.use('form', function(){
		  var zczxform = layui.form;
		  //监听提交
		  zczxform.on('submit(zczxform)', function(data){
		   // layer.msg(JSON.stringify(data.field));   $("#studentPicture").val()
		    
			$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/anon/insertGsxySunshineService",
					data: {
						sunshineName: data.field.sunshineName,
						sunshinePhone: data.field.sunshinePhone,
						sunshineMailbox: data.field.sunshineMailbox,
						sunshineAddress: data.field.sunshineAddress,
						sunshineSex: data.field.sunshineSex,
						sunshineCategory: data.field.sunshineCategory,
						sunshineTitle:data.field.sunshineTitle,
						sunshineContent: data.field.sunshineContent,
						sunshinePublic: data.field.sunshinePublic,
						sunshineEnclosure: $("#studentPicture").val()
					},
					async: true,
					//timeout:12000,
					success: function(data) {
						if(data > 0) {
							layer.msg("信息发送成功");
						} else {
							layer.msg("信息发送失败");
						}
					}
				});
		    return true;
		  });
			zczxform.verify({
			  userCode: function(value, item){ //value：表单的值、item：表单的DOM对象
				if(value.length < 1) {
					return '名字也太短了吧';
				}
			    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
			      return '用户名不能有特殊字符';
			    }
			    if(/(^\_)|(\__)|(\_+$)/.test(value)){
			      return '用户名首尾不能出现下划线\'_\'';
			    }
			    if(/^\d+\d+\d$/.test(value)){
			      return '用户名不能全为数字';
			    }
			  }
			  //我们既支持上述函数式的方式，也支持下述数组的形式
			  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
			  ,pass: [
			    /^[\S]{6,12}$/
			    ,'密码必须6到12位，且不能出现空格'
			  ] ,
			    title: function(value){
			      if(value.length < 5){
			        return '标题至少得5个字符啊';
			      }
			    }
			    ,content: function(value){
			      layedit.sync(editIndex);
			    }
			}); 
		});

		
	</script>
</html>