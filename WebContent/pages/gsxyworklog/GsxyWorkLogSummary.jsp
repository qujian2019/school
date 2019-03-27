<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
			<title>员工工作日志总结</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="renderer" content="webkit">
			<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
			<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
			<link rel="shortcut icon" href="http://www.hngsxy.com/r3/imgs/sign/bitbug_favicon.ico" />
    </head>
    <body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">员工工作日志总结</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<button class="layui-btn layui-btn-warm" id="Return">
				<i class="layui-icon">&#xe65c;</i> 返回上一级
			</button>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>员工工作日志总结表单</legend>
				<form class="layui-form" action="" name="formSummary">
				  <div class="layui-form-item">
				    <label class="layui-form-label">月周数:</label>
				    <div class="layui-input-block">
				      <input type="text" name="weeks" id="week1" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">部门:</label>
				    <div class="layui-input-block">
				      <input type="text" name="deptName" id="deptName" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">姓名:</label>
				    <div class="layui-input-block">
				      <input type="text" name="workName" id="userName" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">人事考核:</label>
				    <div class="layui-input-block">
				      <textarea name="personnelVerification2" id="assessment" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">工作重点:</label>
				    <div class="layui-input-block">
				      <textarea style="height: 300px;" name="jobKey" id="focus" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item layui-form-text">
				    <label class="layui-form-label">其他:</label>
				    <div class="layui-input-block">
				      <textarea name="jobOther" id="jobOther" placeholder="请输入内容" class="layui-textarea"></textarea>
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
		<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
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
			// alert(v['fileFolderId']);//就是你要的结果 workLogId
			if(v != null) {
			
					var temp = v['temp'];
				
			
					var workLogId = v['workLogId'];
					//console.log(workLogId)
		

			}
				
			$(function(){
				
				$("#Return").on("click",function(){
					location.href = "GsxyWorkLogManage.jsp";
				});
				
				
				
				
				if(temp == '' || temp == null || temp == undefined){

				}else{
					//查询一篇日志 
					$.ajax({
						type: "post",
						url: "/GsxyWorkLogController/selectGsxyWorkLogS",
						data: {
							workLogIds: temp
						},
						async: false,
						success: function(data) {
						var gsxyWorkLogList_week1 = [];
						var gsxyWorkLogList_personnelVerification = [];
						var gsxyWorkLogList_focus = [];
						//查看单个信息
						$("#week1").val(data[0].weeks1);
						$("#deptName").val(data[0].deptName);
						$("#userName").val(data[0].workName);
						$('#assessment').val(data[0].personnelVerification2);
						$('#focus').val(data[0].jobKey);$('#jobOther').val(data[0].jobOther);

							if(data.length > 0){
								for(var a = 0; a < data.length; a++) {
									gsxyWorkLogList_week1.push(data[a].week1);
									gsxyWorkLogList_personnelVerification.push(data[a].personnelVerification);
									gsxyWorkLogList_focus.push(data[a].jobContent1+"\r\n");gsxyWorkLogList_focus.push(data[a].jobContent2+"\r\n");
									gsxyWorkLogList_focus.push(data[a].jobContent3+"\r\n");gsxyWorkLogList_focus.push(data[a].jobContent4+"\r\n");
									gsxyWorkLogList_focus.push(data[a].jobContent5);
								}
							}
								$("#week1").val(gsxyWorkLogList_week1);
								$("#assessment").val(gsxyWorkLogList_personnelVerification);
								$("#focus").val(gsxyWorkLogList_focus);
						}
					});
				}
				
				if(workLogId == '' || workLogId == null || workLogId == undefined){

				}else{
					//
					$.ajax({
						type: "post",
						url: "/GsxyWorkLogController/selectGsxyWorkLogS",
						data: {
							workLogIds: workLogId
						},
						async: false,
						success: function(data) {
							//console.log(data[0])
							$("#week1").val(data[0].weeks);
							$("#deptName").val(data[0].deptName);
							$("#userName").val(data[0].workName);
							$("#assessment").val(data[0].personnelVerification2);
							$("#focus").val(data[0].jobKey);
							$("#jobOther").val(data[0].jobOther);
							
						}
					});
				}
				
				
				
				
			})
			
			
			
			//Demo
				layui.use('form', function(){
				  var form = layui.form;
				  
				  //监听提交
				  form.on('submit(formDemo)', function(data){
				    //layer.msg(JSON.stringify(data.field));
				    //新增员工工作总结
							$.ajax({
								type: "post",
								url: "/GsxyWorkLogController/insertYGRZZJ",
								data: {
									workLogId: workLogId,
									jobKey:$("#focus").val(),
									jobOther:$("#jobOther").val(),
									personnelVerification2:$("#assessment").val(),
									weeks:$("#week1").val(),
									deptName:$("#deptName").val(),
									workName:$("#userName").val()
								},
								async: true,
								success: function(data) {
									if(data > 0){
										layer.msg('已写入日志总结');
									}
									
								}
							});
				    
				    formSummary.reset();
				    return false;
				  });
				});
		</script>
</html>