<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>完善我的个人资料</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
		<link rel="stylesheet" href="../../../r3/layui-v2.4.3/layui/css/layui.css" />

	</head>

	<body>
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">完善我的个人资料</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<div class="layui-upload">
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_basics">
					<i class="layui-icon">&#xe608;</i> 基本信息
				</a>
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_research">
					<i class="layui-icon">&#xe608;</i> 在研课题
				</a>
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_winning">
					<i class="layui-icon">&#xe608;</i> 获奖项目
				</a>
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_papers">
					<i class="layui-icon">&#xe608;</i> 发表论文
				</a>
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_technology">
					<i class="layui-icon">&#xe608;</i> 专业技术
				</a>
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_enterprise">
					<i class="layui-icon">&#xe608;</i> 企业工作
				</a>
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_qualification">
					<i class="layui-icon">&#xe608;</i> 高校资格证书
				</a>
				<a href="javascript:;" class="layui-btn " id="gsxy_user_info_training">
					<i class="layui-icon">&#xe608;</i> 培训进修
				</a>
				
			</div>
		</blockquote>
		<fieldset class="layui-elem-field" id="user_info_basics">
			<legend id="fondId"></legend>
			<iframe src="" id="iFrameId" style="width: 700px; height: 500px;"  frameborder="no">
				
			</iframe>
		</fieldset>

	</body>
	<script src="../../../r3/jquery/jquery-1.8.2.js"></script>
	<script src="../../../r3/anonJs/transparency.min.js"></script>
	<script src="../../../r3/layui-v2.4.3/layui/layui.js"></script>
	<script src="../../../r3/anonJs/config.js"></script>
	<script src="../../../r3/anonJs/reJS.js"></script>
	<script>
		var userId = $('#userId').val();
		
		$(function(){
			$('#fondId').text('基本信息');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p184.html?userId='+userId);
		});

		//基本信息
		$('#gsxy_user_info_basics').on('click',function(){
			$('#fondId').text('基本信息');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p184.html?userId='+userId);
		});
		
		//在研课题
		$('#gsxy_user_info_research').on('click',function(){
			$('#fondId').text('在研课题');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p185.html?userId='+userId);
		});
		//获奖项目
		$('#gsxy_user_info_winning').on('click',function(){
			$('#fondId').text('获奖项目');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p186.html?userId='+userId);
		});
		//发表论文
		$('#gsxy_user_info_papers').on('click',function(){
			$('#fondId').text('发表论文');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p187.html?userId='+userId);
		});
		//培训进修
		$('#gsxy_user_info_training').on('click',function(){
			$('#fondId').text('培训进修');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p188.html?userId='+userId);
		});
		//专业技术
		$('#gsxy_user_info_technology').on('click',function(){
			$('#fondId').text('专业技术');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p189.html?userId='+userId);
		});
		//企业工作
		$('#gsxy_user_info_enterprise').on('click',function(){
			$('#fondId').text('企业工作');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p190.html?userId='+userId);
		});
		//高校资格证书
		$('#gsxy_user_info_qualification').on('click',function(){
			$('#fondId').text('高校资格证书');
			$('#iFrameId').attr('src','http://www.hngsxy.com/notH5/xt/mt/p191.html?userId='+userId);
		});

	</script>

</html>