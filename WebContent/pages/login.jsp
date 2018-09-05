<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>学院后台登录</title>
		<meta http-equiv="Pragma",content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/css/login.css" />
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
		<style>
			body {
				margin: 0px;
			}
		</style>
	</head>

	<body class="beg-login-bg">
		<div class="beg-login-box">
			<header>
				<h1>学院后台登录</h1>
			</header>
			<div class="beg-login-main">
				<span style="color: red;">${msg}</span>
				<form class="layui-form" method="post" action="<%=request.getContextPath()%>/findUserOne">
					<input name="__RequestVerificationToken" type="hidden" value="" />
					<div class="layui-form-item">
						<label class="beg-login-icon"> <i class="layui-icon">&#xe612;</i>
					</label>
						<input type="text" name="username" required lay-verify="required" placeholder="这里输入登录名" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-item">
						<label class="beg-login-icon"> <i class="layui-icon">&#xe642;</i>
					</label>
						<input type="password" name="password" required lay-verify="required" placeholder="这里输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-item">
						<div class="beg-pull-left beg-login-remember">
							<input type="checkbox" name="rememberMe" title="记住帐号？">
						</div>
						<div class="beg-pull-right">
							<input type="submit" class="layui-btn layui-btn-primary" value="登录" id="dlbtn"></input>
						</div>
						<div class="beg-clear"></div>
					</div>
				</form>
			</div>
			<footer>
				<p>Come from © www.hngsxy.com</p>
			</footer>
		</div>

		<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/r3/layui-v2.1.0/layui/layui.js"></script>
		<script>
			layui.use('form', function() {});
		</script>
	</body>

</html>