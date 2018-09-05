<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
			<title>湖南工商职业学院员工工作日志</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="renderer" content="webkit">
			<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
			<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
			<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
			<style>
				.inputleft{
					float: left;
				}
			</style>
    </head>
    <body>
		<input type="hidden" value="${sessionScope.activeUser.userName}" id="userName" />
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		<input type="hidden" value="${sessionScope.activeUser.deptno}" id="deptNo" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">湖南工商职业学院员工工作日志</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<a href="GsxyWorkLogList.jsp" class="layui-btn ">
				<i class="layui-icon">&#xe608;</i> 工作日志列表
			</a>
<!--			<a href="javascript:;" class="layui-btn layui-btn-danger " id="deleteFileFolder">
				<i class="layui-icon">&#x1006;</i> 批量删除文件夹
			</a>-->
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>工作日志录入系统</legend>
			<form class="layui-form" action="" name="form1">
			  <div class="layui-form-item">
			    <label class="layui-form-label inputleft">姓名:</label>
			    <div class="layui-input-block inputleft" style="margin-left: 1px;">
			      <input type="text" name="workName"   lay-verify="" placeholder="请输入姓名" autocomplete="off" class="layui-input" id="workName">
			    </div>
			    <label class="layui-form-label inputleft">部门名称:</label>
			    <div class="layui-input-block inputleft" style="margin-left: 1px;">
			      <input type="text" name="deptName"   lay-verify="" placeholder="请输入部门名称" autocomplete="off" class="layui-input" id="deptName">
			    </div>
			    <label class="layui-form-label inputleft">填表日期:</label>
			    <div class="layui-input-block inputleft" style="margin-left: 1px;">
			    	<input type="text" class="layui-input" name="writeTime" id="writeTime" placeholder="请输入填表日期" autocomplete="off">
			     <!-- <input type="text" name="writeTime"   lay-verify="" placeholder="请输入填表日期" autocomplete="off" class="layui-input">-->
			    </div>
			    <label class="layui-form-label inputleft">周数:</label>
			    <div class="layui-input-block inputleft" style="margin-left: 1px;">
			      <input type="text" name="week1" id="week1"  lay-verify="" placeholder="请输入周数" autocomplete="off" class="layui-input">
			    </div>
			    <label class="layui-form-label inputleft">星期:</label>
			    <div class="layui-input-block inputleft" style="margin-left: 1px;">
			      <input type="text" name="week2" id="week2"  lay-verify="" placeholder="请输入星期" autocomplete="off" class="layui-input">
			    </div>
			  </div>
				<table class="layui-table">
				  <tbody>
				    <tr>
				     <td rowspan="5" width="20px">
				     	今日计划完成工作
				     </td>
				    </tr>
				    <tr>
				     <td colspan="2">紧 急</td>
				     <td colspan="2">一般</td>
				    </tr>
				    <tr>
				     <td rowspan="3" colspan="2">
					      <textarea name="urgent" id="urgent" placeholder="请输入内容" class="layui-textarea"></textarea>
				     </td>
						 <td rowspan="3" colspan="2">
					      <textarea name="commonly" id="commonly" placeholder="请输入内容" class="layui-textarea"></textarea>
						 </td>
				    </tr>
				    <tr>
				    </tr>
				    <tr>
				    </tr>
				    <tr>
				     <td rowspan="7">
							今日实际完成工作
				     </td>
				    </tr>
				    <tr>
				     <td width="150px">时间段</td>
				     <td>具体工作内容</td>
				     <td width="150px">完成工作时间</td>
				     <td>核定工作时间（人事处）</td>
				    </tr>
				    <tr>
				     <td><input type="text" name="timeSlot1" id="timeSlot1"   lay-verify="" placeholder="请输入时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="jobContent1" id="jobContent1"   lay-verify="" placeholder="请输入工作内容" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="completeTime1" id="completeTime1"   lay-verify="" placeholder="请输入完成时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="ratifiedTime1" id="ratifiedTime1"  lay-verify="" placeholder="请输入核定时间" autocomplete="off" class="layui-input"></td>
				    </tr>
				    <tr>
				     <td><input type="text" name="timeSlot2" id="timeSlot2"  lay-verify="" placeholder="请输入时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="jobContent2" id="jobContent2"  lay-verify="" placeholder="请输入工作内容" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="completeTime2" id="completeTime2"  lay-verify="" placeholder="请输入完成时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="ratifiedTime2" id="ratifiedTime2"  lay-verify="" placeholder="请输入核定时间" autocomplete="off" class="layui-input"></td>
				    </tr>
				    <tr>
				     <td><input type="text" name="timeSlot3" id="timeSlot3"  lay-verify="" placeholder="请输入时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="jobContent3" id="jobContent3"  lay-verify="" placeholder="请输入工作内容" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="completeTime3" id="completeTime3"  lay-verify="" placeholder="请输入完成时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="ratifiedTime3" id="ratifiedTime3"  lay-verify="" placeholder="请输入核定时间" autocomplete="off" class="layui-input"></td>
				    </tr>
				    <tr>
				     <td><input type="text" name="timeSlot4" id="timeSlot4"  lay-verify="" placeholder="请输入时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="jobContent4" id="jobContent4"  lay-verify="" placeholder="请输入工作内容" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="completeTime4" id="completeTime4"  lay-verify="" placeholder="请输入完成时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="ratifiedTime4" id="ratifiedTime4"  lay-verify="" placeholder="请输入核定时间" autocomplete="off" class="layui-input"></td>
				    </tr>
				    <tr>
				     <td><input type="text" name="timeSlot5" id="timeSlot5"  lay-verify="" placeholder="请输入时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="jobContent5" id="jobContent5"  lay-verify="" placeholder="请输入工作内容" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="completeTime5" id="completeTime5"  lay-verify="" placeholder="请输入完成时间" autocomplete="off" class="layui-input"></td>
				     <td><input type="text" name="ratifiedTime5" id="ratifiedTime5"  lay-verify="" placeholder="请输入核定时间" autocomplete="off" class="layui-input"></td>
				    </tr>
				    <tr>
				     <td rowspan="3">工作总用时</td>
				     <td colspan="2">自我核定</td>
				     <td colspan="2">人事处核定</td>
				    </tr>
				    <tr>
				     <td rowspan="2" colspan="2">
				     	<textarea name="selfVerification" id="selfVerification" placeholder="请输入自我核定" class="layui-textarea"></textarea>
				     </td>
				     <td rowspan="2" colspan="2">
				     	<textarea name="personnelVerification" id="personnelVerification" placeholder="请输入人事处核定" class="layui-textarea"></textarea>
				     </td>
				    </tr>
				    <tr></tr>
				    <tr>
				     <td rowspan="3">今日未完成工作</td>
				     <td colspan="1">尚未完成的工作</td>
				     <td colspan="1">存在的问题</td>
				     <td colspan="2">改进措施</td>
				    </tr>
				    <tr>
				     <td rowspan="2">
				     	<textarea name="notCompleted" id="notCompleted" placeholder="请输入尚未完成的工作" class="layui-textarea"></textarea>
				     </td>
				     <td rowspan="2">
				     	<textarea name="problem" id="problem" placeholder="请输入存在的问题" class="layui-textarea"></textarea>
				     </td>
				     <td rowspan="2" colspan="2">
				     	<textarea name="Improvement" id="Improvement" placeholder="请输入改进措施" class="layui-textarea"></textarea>
				     </td>
				    </tr>
				    <tr></tr>
				    <tr>
				     <td rowspan="3">领导核实</td>
				     <td rowspan="4" colspan="4">
				     	<textarea name="leadershipVerification" id="leadershipVerification" placeholder="请输入领导核实" class="layui-textarea"></textarea>
				     </td>
				    </tr>
				    <tr></tr>
				    <tr></tr>
				  </tbody>
				</table>
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
			// alert(v['fileFolderId']);//就是你要的结果

			if(v != null) {
				var workLogId = v['workLogId'];
				//console.log(workLogId)
				
					//查询一篇日志
					$.ajax({
						type: "post",
						url: "/GsxyWorkLogController/selectGsxyWorkLogOne",
						data: {
							workLogId: workLogId
						},
						async: true,
						success: function(data) {
							//console.log(data.Improvement)
							setTimeout(function(){
								$("#workName").val(data.workName);$("#deptName").val(data.deptName);$("#writeTime").val(data.writeTime);
								$("#week1").val(data.week1);$("#week2").val(data.week2);$("#urgent").val(data.urgent);
								$("#commonly").val(data.commonly);$("#timeSlot1").val(data.timeSlot1);$("#timeSlot2").val(data.timeSlot2);
								$("#timeSlot3").val(data.timeSlot3);$("#timeSlot4").val(data.timeSlot4);$("#timeSlot5").val(data.timeSlot5);
								$("#jobContent1").val(data.jobContent1);$("#jobContent2").val(data.jobContent2);$("#jobContent3").val(data.jobContent3);
								$("#jobContent4").val(data.jobContent4);$("#jobContent5").val(data.jobContent5);$("#completeTime1").val(data.completeTime1);
								$("#completeTime2").val(data.completeTime2);$("#completeTime3").val(data.completeTime3);$("#completeTime4").val(data.completeTime4);
								$("#completeTime5").val(data.completeTime5);$("#ratifiedTime1").val(data.ratifiedTime1);$("#ratifiedTime2").val(data.ratifiedTime2);
								$("#ratifiedTime3").val(data.ratifiedTime3);$("#ratifiedTime4").val(data.ratifiedTime4);$("#ratifiedTime5").val(data.ratifiedTime5);
								$("#selfVerification").val(data.selfVerification);$("#personnelVerification").val(data.personnelVerification);$("#notCompleted").val(data.notCompleted);
								$("#problem").val(data.problem);$("#Improvement").val(data.improvement);$("#leadershipVerification").val(data.leadershipVerification);
							},666);
						}
					});
			}

			layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  var date01 = new Date();
			  
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#writeTime' //指定元素
			    ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
			     ,value: date01
			  });
			});

			//Demo
			layui.use(['form','layer'], function(){
				  var layer = layui.layer
				  ,form = layui.form;

			  //监听提交
			  form.on('submit(formDemo)', function(data){
			    //layer.msg(JSON.stringify(data.field));
			    
						//查询部门名称
						$.ajax({
							type: "post",
							url:"/GsxyWorkLogController/insertGsxyWorkLog",
							data: {
								workLogId:workLogId,
								userId:$("#userId").val(),
								workName:data.field.workName,
								deptId:$("#deptNo").val(),
								deptName:data.field.deptName,
								writeTime:data.field.writeTime,
								week1:data.field.week1,
								week2:data.field.week2,
								urgent:data.field.urgent,
								commonly:data.field.commonly,
								timeSlot1:data.field.timeSlot1,
								timeSlot2:data.field.timeSlot2,
								timeSlot3:data.field.timeSlot3,
								timeSlot4:data.field.timeSlot4,
								timeSlot5:data.field.timeSlot5,
								jobContent1:data.field.jobContent1,
								jobContent2:data.field.jobContent2,
								jobContent3:data.field.jobContent3,
								jobContent4:data.field.jobContent4,
								jobContent5:data.field.jobContent5,
								completeTime1:data.field.completeTime1,
								completeTime2:data.field.completeTime2,
								completeTime3:data.field.completeTime3,
								completeTime4:data.field.completeTime4,
								completeTime5:data.field.completeTime5,
								ratifiedTime1:data.field.ratifiedTime1,
								ratifiedTime2:data.field.ratifiedTime2,
								ratifiedTime3:data.field.ratifiedTime3,
								ratifiedTime4:data.field.ratifiedTime4,
								ratifiedTime5:data.field.ratifiedTime5,
								selfVerification:data.field.selfVerification,
								personnelVerification:data.field.personnelVerification,
								notCompleted:data.field.notCompleted,
								problem:data.field.problem,
								Improvement:data.field.Improvement,
								leadershipVerification:data.field.leadershipVerification
							},
							async: true,
							success: function(data) {
								if(data > 0){
									layer.msg('已写入日志');
									document.forms['form1'].reset();
								
								}

							}
						});

			    return false;
			  });
			});
			
			$("#workName").val($("#userName").val());
			//$("#deptName").val($("#deptNo").val());
			
			$(function(){
						//查询部门名称
						$.ajax({
							type: "post",
							url: "/UserManagemenController/findUserIdByDept",
							data: {
								deptno: $("#deptNo").val()
							},
							async: true,
							success: function(data) {
								$("#deptName").val(data.dname);
							}
						});
				//
				
				
			})
			
			
			
			
		</script>
</html>