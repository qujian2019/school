<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<title>基本资料</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/zTree-zTree_v3-master/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<style>
			body {
				margin: 0px;
			}
			.basbox{
				height: 300px;
				width: 300px;
				/*background-color: #7274A7;*/
			}
		</style>
    </head>
    <body>
    	<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">基本资料</a>
			</legend>
		</fieldset>
		
		<blockquote class="layui-elem-quote">

		</blockquote>
		
	<fieldset class="layui-elem-field">
			<legend>
				<a name="color-design">修改基本资料</a>
			</legend>
			<!--style="padding: 10px;-->
  		<div class="basbox">
			<form class="layui-form" action="">
			  <div class="layui-form-item">
			    <label class="layui-form-label">账号：</label>
			    <div class="layui-input-block">
			      <input type="text" value="${sessionScope.activeUser.userCode}" name="userCode" required  lay-verify="required|userCode" placeholder="请输入用户账号" autocomplete="off" class="layui-input" style="width: 230px;">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">昵称：</label>
			    <div class="layui-input-block">
			      <input type="text" name="userName" required  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input" style="width: 230px;">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">电话号码：</label>
			    <div class="layui-input-block">
			      <input type="text" name="userPhone" required  lay-verify="required|phone" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">身份证：</label>
			    <div class="layui-input-block">
			      <input type="text" name="idCard" required  lay-verify="required" placeholder="请输入身份证" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">密码：</label>
			    <div class="layui-input-block">
			      <input type="password" name="userPassword" required  lay-verify="required|pass" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 230px">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit lay-filter="userForm">立即提交</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div>
			</form>
    	</div>

	</fieldset>
		

 	</body>
 	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
 	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
	<script>
	//Demo
	layui.use('form', function(){
	  var userForm = layui.form;
	  //监听提交
	  userForm.on('submit(userForm)', function(data){
	   // layer.msg(JSON.stringify(data.field));
						$.ajax({
							type: "post",
							url: '<%=request.getContextPath()%>/updateUserInfo',
							data: {
								userId:$("#userId").val(),
								userCode:data.field.userCode,
								userName:data.field.userName,
								userPhone:data.field.userPhone,
								userPassword:data.field.userPassword,
								idCard:data.field.idCard
							},
							async: true,
							//timeout:1200,
							success: function(data) {
								if(data > 0) {
									layer.msg("修改成功");
								}
							}
						});

	    return false;
	  });
	  
			userForm.verify({
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
			  ] 
			}); 
	  
	  
	  
	});
	</script>
 	
</html>