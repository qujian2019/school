<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>用户管理</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="renderer" content="webkit">
			<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
			<meta name="viewport" content="width=device-width,initial-scale=1.0">
			<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
			<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
			<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<style>
			body{margin: 0px;}
			
			.userManag1{
				width: 300px;
				height: 300px;
				margin: 5px;
				background-color: #DDDDDD;
				
			}
			.userManag2{
				width: 300px;
				height: 300px;
				margin: 5px;
				background-color: #D2DCF8;
			}
		</style>
	</head>
    <body>
    	<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
    	<input type="hidden" value="${sessionScope.activeUser.userName}" id="userName" />
    	<input type="hidden" value="${sessionScope.activeUser.deptno}" id="deptno" />
    	
		<div class="layui-btn-container" style="margin: 10px;">
		  <button class="layui-btn" id="goGWLF">工作日志列表</button> 
		  <button class="layui-btn" id="goGWLF2">工作日志</button>
		  <button class="layui-btn" id="wsxxzl">完善我的个人资料</button>
		</div>
    	<!--<button class="layui-btn" id="goGWLF">湖南工商职业学院员工工作日志</button>-->
<!--    	<div class="userManag1" id="goGWLF">
    		湖南工商职业学院员工工作日志
    	</div>-->
    	<!--<div class="userManag2"></div>2222222222-->
 	</body>
		<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
		<script>
			var userId = $('#userId').val();
			
			//
			localStorage.setItem('userId',$('#userId').val());
			localStorage.setItem('userName',$('#userName').val());
			localStorage.setItem('deptno',$('#deptno').val());
			
			//var userId = localStorage.getItem('userId');
			//var userName = localStorage.getItem('userName');
			//var deptno = localStorage.getItem('deptno');
			
			$("#goGWLF").on("click",function(){
				location.href="/pages/gsxyworklog/GsxyWorkLogList.jsp";
			});
			
			$("#goGWLF2").on("click",function(){
				location.href="http://www.hngsxy.com/notH5/xt/mt/p192.html?userId="+userId;
			});
			
			$("#wsxxzl").on("click",function(){
				var userId = $('#userId').val();
				//location.href="http://www.hngsxy.com/notH5/xt/mt/p184.html?userId="+userId;
				location.href="/pages/anon/wswdgrzl/wswdgrzl_1.jsp";
			});
		</script>
</html>