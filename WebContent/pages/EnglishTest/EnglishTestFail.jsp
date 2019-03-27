<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.3.0/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://www.hngsxy.com/r3/imgs/sign/bitbug_favicon.ico" />
		<title>英语考试管理不通过理由</title>
    </head>
    <body>
			<fieldset class="layui-elem-field layui-field-title site-title">
				<legend>
					<a name="color-design">英语考试管理不通过理由</a>
				</legend>
			</fieldset>
			<blockquote class="layui-elem-quote">
				<div class="layui-upload">
	
				</div>
			</blockquote>
			<fieldset class="layui-elem-field">
				<legend>英语考试管理</legend>
				
				<form class="layui-form" action="">
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">不通过理由</label>
				    <div class="layui-input-block">
				      <textarea name="unqualifiedReason" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				</form>

			</fieldset>
			
	 	</body>
		<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="/r3/layui-v2.3.0/layui/layui.js"></script>
		<script>
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
				var id = v['id'];
				var examinationStatus = v['examinationStatus'];
				/*var temp01 = v['temp01'];*/
				//console.log(temp01) 1:发送 2：编辑
			}
			
			//Demo
			layui.use('form', function(){
			  var form = layui.form;
			  //监听提交
			  form.on('submit(formDemo)', function(data){
			  	
			    //layer.msg(JSON.stringify(data.field));
					$.ajax({
							type: "post",
							url: "/EnglishTestController/updateEnglishTestUnqualifiedReason",
							data: {
								id:id,
								unqualifiedReason:data.field.unqualifiedReason,
								examinationStatus:examinationStatus
							},
							async: true,
							//timeout:12000,
							success: function(data) {
 								//console.log(data)
										if(data > 0) {
											layer.msg("成功");
										}else{
											layer.msg("失败");
										}
							
							
							}
					});

			    
			    return false;
			  });
			});
			
			
			
			
			
			
			
		</script>
</html>