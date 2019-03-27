<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>员工工作日志总结信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://www.hngsxy.com/r3/imgs/sign/bitbug_favicon.ico" />
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">员工工作日志总结信息</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<!--			<button class="layui-btn layui-btn-warm" id="Return">
				<i class="layui-icon">&#xe65c;</i> 返回上一级
			</button>-->
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>员工工作日志总结信息列表</legend>
			<div class="demoTable">
				<form class="layui-form" action="" style="width: 300px;">
					<div class="layui-form-item">
						<label class="layui-form-label">月周数:</label>
						<div class="layui-input-block">
							<select name="weeks" id="weeks" lay-verify="" lay-filter="weeks">
								<option value="">请选择月周数</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">部门名称:</label>
						<div class="layui-input-block">
							<select name="deptName" id="findDeptName" lay-verify="" lay-filter="deptname">
								<option value="">请选择部门</option>
							</select>
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
			<!--<div class="layui-container">  -->
			<div class="layui-row">
				<div class="layui-col-md12" id="addTable">
					<!--							<table class="layui-table">
								<tr >
									<td colspan="3" align="center" style="font-size:30px;">
										院办
									</td>
									<td width="100px" style="font-size:20px;">
										九月第四周
									</td>
								</tr>
								<tr>
									<td width="70px" style="font-size:20px;">
										姓名
									</td>
									<td height="150px" width="80px" rowspan="2" style="font-size:20px;">
										重点
									</td>
									<td rowspan="2">
										
									</td>
									<td style="font-size:20px;">
										人事考核
									</td>
								</tr>
								<tr>
									<td rowspan="2" style="font-size:20px;">
										阳幕瑛
									</td>
									<td rowspan="2"></td>
								</tr>
								<tr>
									<td style="font-size:20px;">
										其他
									</td>
									<td height="150px">
										
									</td>
								</tr>
							</table>-->
				</div>
			</div>
		</fieldset>
	</body>
	<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
	<script>
		//Demo
		layui.use(['layer', 'form'], function() {
			var layer = layui.layer,
				form = layui.form;

			form.on('select(weeks)', function(data) {
				//console.log(data.value); //得到被选中的值
				if(data.value == null || data.value == "") {
					//console.log('空的呀!!')
				} else {
					//console.log(data.value)
				}
			});
			form.on('select(deptname)', function(data) {
				//console.log(data.value); //得到被选中的值
			});

			//监听提交
			form.on('submit(formDemo)', function(data) {
				//layer.msg(JSON.stringify(data.field)); 
				$.ajax({
					type: "get",
					url: "/GsxyWorkLogController/findGsxyWorkLogTable",
					data: {
						weeks: $("#weeks").val(),
						deptName: $("#findDeptName").val()
					},
					async: true,
					//timeout:1200,
					success: function(data) {
						if($("#weeks").val() == null || $("#weeks").val() == "") {
							layer.msg('请选择周数');
						} else {
							$("#addTable").html("");
							//console.log(data)
							var GsxyWorkLogTable = [];
							if(data.length > 0) {
								for(var a = 0; a < data.length; a++) {
									GsxyWorkLogTable.push(
										'<table class="layui-table">' +
										'<tr >' +
										'<td colspan="3" align="center" style="font-size:30px;">' +
										data[a].deptName +
										'</td>' +
										'<td width="100px" style="font-size:20px;">' +
										data[a].weeks +
										'</td>' +
										'</tr>' +
										'<tr>' +
										'<td width="70px" style="font-size:20px;">' +
										'姓名' +
										'</td>' +
										'<td height="150px" width="80px" rowspan="2" style="font-size:20px;">' +
										'重点' +
										'</td>' +
										'<td rowspan="2">' +
										data[a].jobKey +
										'</td>' +
										'<td style="font-size:20px;">' +
										'人事考核' +
										'</td>' +
										'</tr>' +
										'<tr>' +
										'<td rowspan="2" style="font-size:20px;">' +
										data[a].workName +
										'</td>' +
										'<td rowspan="2">' +
										data[a].personnelVerification2 +
										'</td>' +
										'</tr>' +
										'<tr>' +
										'<td style="font-size:20px;">' +
										'其他' +
										'</td>' +
										'<td height="150px">' +
										data[a].jobOther +
										'</td>' +
										'</tr>' +
										'</table>'
									);
								}
							}
							$("#addTable").append(GsxyWorkLogTable);
						}
					}
				});

				return false;
			});
		});

		$(function() {

			$.ajax({
				type: "get",
				url: "/GsxyWorkLogController/findyzs",
				data: {},
				async: false,
				//timeout:1200,
				success: function(data) {
					var weeksList = [];
					if(data.length > 0) {
						for(var a = 0; a < data.length; a++) {
							weeksList.push('<option value="' + data[a].weeks + '">' + data[a].weeks + '</option>');
						}
					}
					$("#weeks").append(weeksList);
				}
			});

			$.ajax({
				type: "get",
				url: "/UserManagemenController/findDept",
				data: {},
				async: false,
				//timeout:1200,
				success: function(data) {
					var deptList = [];
					if(data.length > 0) {
						for(var a = 0; a < data.length; a++) {
							if(data[a].deptno == 'hngszyxy') {} else {
								deptList.push('<option value="' + data[a].dname + '">' + data[a].dname + '</option>');
							}
						}
					}
					$("#findDeptName").append(deptList);
				}
			});

		})
	</script>

</html>