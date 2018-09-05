<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>用户管理</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="renderer" content="webkit">
			<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
			<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
			<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
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
    	<div class="userManag1" id="goGWLF">
    		湖南工商职业学院员工工作日志
    	</div>
    	<!--<div class="userManag2"></div>2222222222-->
 	</body>
		<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
		<script>
			$("#goGWLF").on("click",function(){
				location.href="/pages/gsxyworklog/GsxyWorkLogFrom.jsp";
			})
		</script>
</html>