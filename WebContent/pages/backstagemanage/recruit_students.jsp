<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>招生就业</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
		<style>
			body {
				margin: 0px;
			}
		</style>
	</head>

	<body>
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />

		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">招生就业</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">

			<!--	<i class="layui-icon">&#xe608;</i> 上传文件
				 <input class="layui-btn" id="file1" type="file" name="myfile" value="上传文件">-->
			<div class="layui-upload">
				<!--				<button type="button" class="layui-btn layui-btn-normal" id="test6">选择文件</button>
				<button type="button" class="layui-btn" id="test7">开始上传</button>
				<button class="layui-btn layui-btn-danger" id="deleteFile">
						<i class="layui-icon">&#x1006;</i> 批量删除文件
				  </button>-->
				<button class="layui-btn" id="studentSystem1">
					<!--<i class="layui-icon"></i>-->学生录入系统
				</button>
				<button class="layui-btn layui-btn-warm" id="studentSystem2">
					<!--<i class="layui-icon"></i>-->学生列表
				</button>
				<button type="button" class="layui-btn layui-btn-normal" id="test6">选择excel文件</button>
				<button type="button" class="layui-btn" id="test7">开始上传</button>
<!--				<button class="layui-btn layui-btn-normal" id="studentSystem3">
						在线报名学生列表
				</button>-->
				<button class="layui-btn layui-btn-danger" id="deleteBatchStudent">
					<!--<i class="layui-icon"></i>-->学生批量删除
				</button>

			</div>

			<!--			<a href="javascript:;" class="layui-btn layui-btn-small" id="">
				<button id="UploadFileBut" type="button" class="btn btn-default" data-dismiss="modal">添加文件</button>
			</a>-->

		</blockquote>
		<fieldset class="layui-elem-field" id="student1" style="width: 500px;">
			<legend>学生录入系统</legend>
			<form class="layui-form" action="" name="formStudent">
				<div class="layui-form-item">
					<label class="layui-form-label">学生姓名</label>
					<div class="layui-input-block">
						<input type="text" name="studentName" required lay-verify="required|studentName" placeholder="请输学生姓名" autocomplete="off" class="layui-input">
					</div>
				</div>
<!--				<div class="layui-form-item">
					<label class="layui-form-label">学号</label>
					<div class="layui-input-block">
						<input type="text" name="number" required lay-verify="required|number" placeholder="请输学号" autocomplete="off" class="layui-input">
					</div>
				</div>-->
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号码</label>
					<div class="layui-input-block">
						<input type="text" name="idCard" required lay-verify="required|number" placeholder="请输身份证号码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学生年龄</label>
					<div class="layui-input-block">
						<input type="text" name="age" required lay-verify="required|age" placeholder="请输学生年龄" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">
						<input type="radio" name="sex" value="男" title="男">
						<input type="radio" name="sex" value="女" title="女" checked>
					</div>
				</div>
<!--				<div class="layui-form-item">
					<label class="layui-form-label">入学时间</label>
					<div class="layui-input-block">
						<input type="text" name="entranceTime" required lay-verify="required" placeholder="请输入学时间" autocomplete="off" class="layui-input" id="test1">
					</div>
				</div>-->
<!--				<div class="layui-form-item">
					<label class="layui-form-label">毕业时间</label>
					<div class="layui-input-block">
						<input type="text" name="graduationTime" required lay-verify="required" placeholder="请输毕业时间" autocomplete="off" class="layui-input" id="test2">
					</div>
				</div>-->
<!--				<div class="layui-form-item">
					<label class="layui-form-label">专业</label>
					<div class="layui-input-block">
						<input type="text" name="major" required lay-verify="required" placeholder="请输学生专业" autocomplete="off" class="layui-input">
					</div>
				</div>-->
<!--				<div class="layui-form-item">
					<label class="layui-form-label">班级</label>
					<div class="layui-input-block">
						<input type="text" name="studentClass" required lay-verify="required" placeholder="请输学生班级" autocomplete="off" class="layui-input">
					</div>
				</div>-->
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">备注</label>
					<div class="layui-input-block">
						<textarea name="studentRemarks" placeholder="请输入备注" class="layui-textarea"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="formStudent">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</fieldset>
		<!--style="width: 500px;"-->
		<fieldset class="layui-elem-field" id="student2">
			<legend>学生列表</legend>
			<div class="demoTable">
				身份证查询：
				<div class="layui-inline">
					<input class="layui-input" name="findStudentIdCardVal" id="findStudentIdCardVal" />
				</div>
				姓名查询：
				<div class="layui-inline">
					<input class="layui-input" name="findStudentNumberVal" id="findStudentNumberVal" />
				</div>
				<button class="layui-btn" id="findStudentBtn">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="findStudent" lay-filter="test"></table>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<!--	<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail" id="detail">预览</a>-->

				<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>

				<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>
		<!--描述：报名学生列表-->
		<fieldset class="layui-elem-field" id="student3">
			<legend>在线报名学生列表</legend>
			<div class="demoTable">
				身份证查询：
				<div class="layui-inline">
					<input class="layui-input" name="findStudentIdCardVal3" id="findStudentIdCardVal3" />
				</div>
				<button class="layui-btn" id="findStudentBtn3">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="findStudent3" lay-filter="test"></table>

			<script type="text/html" id="studentStateTpl">
				{{# if(d.studentState == '1'){ }}
				<span style="color: #C12E2A;">未审核</span> 
				{{# }else if(d.studentState == '2'){ }}
				<span style="color: #376B29;">审核通过</span> 
				{{# } }}
			</script>

			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo3">
				<!--	<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail" id="detail">预览</a>-->
				<a class="layui-btn layui-btn-mini" lay-event="shenhe" id="shenhe">审核</a>
				<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>

				<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>

	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
	<script>
		
			$("#studentSystem1").on("click", function() {
				$("#student1").show();
				$("#student2").hide();
				$("#student3").hide();
			});
			$("#studentSystem2").on("click", function() {
				$("#student2").show();
				$("#student1").hide();
				$("#student3").hide();
			});
		

		$("#student1").hide();
		$("#student3").hide();
		$("#deleteBatchStudent").hide();

		layui.use(['table','upload'], function() {
			//当用户选择了学校就查询部门	

			//毕业生table
			//var $ = layui.jquery;
			var table = layui.table
			,upload = layui.upload;

			//毕业生table
			var tableIns = table.render({
				elem: '#findStudent',
				method: 'post',
				url: '<%=request.getContextPath()%>/StudentController/findGraduate',
				width: 1200
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						}, {
							field: 'studentName',
							title: '学生姓名',
							width: 248
						},{
							field: 'idCard',
							title: '身份证',
							width: 248
						},{
							field: 'major',
							title: '专业',
							width: 248
						},{
							field: 'examineeNumber',
							title: '考生号',
							width: 248
						},{
							field: 'studentGraduationSchool',
							title: '毕业学校',
							width: 248
						}, {
							field: 'age',
							title: '年龄',
							width: 248
						}, {
							field: 'sex',
							title: '性别',
							width: 248
						},{
							field: 'studentRemarks',
							title: '备注',
							width: 248
						}, {
							fixed: 'right',
							title: '操作',
							toolbar: '#barDemo',
							width: 168,
							align: 'center'
						}
					]
				],
				skin: 'row',
				even: true,
				page: true,
				limits: [10, 20, 30],
				limit: 10,
				id: 'test' //ID
					,
				where: {
					//deptno: treeNode.id
				} //如果无需传递额外参数，可不加该参数
				,
				done: function(res, curr, count) {

					//监听表格复选框选择
					table.on('checkbox(test)', function(obj) {

						if(obj.checked) {
							$("#deleteBatchStudent").show();
						} else {
							$("#deleteBatchStudent").hide();
						}

					});

					//监听工具条
					table.on('tool(test)', function(obj) {

						var data = obj.data;
						if(obj.event === 'del') {
							layer.confirm('真的删除这个学生吗', function(index) {

								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/StudentController/deleteStudentOne",
									data: {
										studentId: data.studentId
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteBatchStudent").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({
												where: {
													//deptno: treeNode.id
												}
											});

										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							var updateindex = layer.open({
								title: '修改学生信息',
								type: 1,
								offset: 't' //具体配置参考：offset参数项
									,
								content: '<div style="padding: 20px 80px;">' +
									'<div class="layui-form-item">' +
									'<label class="layui-form-label">学生姓名:</label>' +
									'<div class="layui-input-block">' +
									'<input type="text" name="studentName" id="studentName" lay-verify="required|title" required placeholder="请输入学生姓名" autocomplete="off" class="layui-input">' +
									'</div>' +
									'</div>' +
									'<div class="layui-form-item">' +
									'<label class="layui-form-label">身份证:</label>' +
									'<div class="layui-input-block">' +
									'<input type="text" name="idCard" id="idCard" lay-verify="required|title" required placeholder="请输入身份证" autocomplete="off" class="layui-input">' +
									'</div>' +
									'</div>' +
									'</div>',
								btn: '确定',
								btnAlign: 'c' //按钮居中
									,
								area: ['500px', '300px'],
								shade: 0 //不显示遮罩
									,
								yes: function() {

									var studentName = $("#studentName").val();
									var number = $("#number").val();
									var idCard = $("#idCard").val();

									$.ajax({
										type: "post",
										url: "<%=request.getContextPath()%>/StudentController/updateStudentOne",
										data: {
											studentId: data.studentId,
											studentName: studentName,
											number: number,
											idCard: idCard
										},
										async: true,
										//timeout:12000,
										success: function(data) {
											if(data > 0) {
												layer.msg("修改成功");
												$("#deleteBatchStudent").hide();
												//刷新
												tableIns.reload({
													where: {
														//deptno: treeNode.id,
													}

												});

											}
										}
									});

									layer.close(updateindex);
								}
							});

						} else if(obj.event === 'detail') {
							//										var url = 'filemanage.jsp?fileFolderId='+data.fileFolderId+'&fileFolderName='+data.fileFolderName;
							//									    window.location.href=url;
						}
					});
				}
			});

			

			//模糊查询文件夹 findStudentNumberVal findStudentIdCardVal
			$("#findStudentBtn").on("click", function() {
				var findStudentNumberVal = $("#findStudentNumberVal").val();
				var findStudentIdCardVal = $("#findStudentIdCardVal").val();
				//console.log(findStudentNumberVal)
				$("#deleteBatchStudent").hide();
				//刷新也可以用
				tableIns.reload({
					where: {
						studentName: findStudentNumberVal,
						idCard: findStudentIdCardVal
					} //如果无需传递额外参数，可不加该参数

				});
			});

			//批量删除学生
			$("#deleteBatchStudent").on("click", function() {
				var checkStatus = table.checkStatus('test'),
					data = checkStatus.data;

				var temp = "";
				$.each(data, function(i, n) {
					//alert(“索引:”+i,”对应值为：”+n.name);
					temp += n.studentId + ",";
				});
				//console.log(temp)
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/StudentController/deleteBatchStudent",
					data: {
						"studentIds": temp
					},
					async: true,
					//timeout:1200,
					success: function(data) {
						if(data > 0) {
							//刷新
							tableIns.reload({
								where: {

								}
							});
							layer.msg("删除了" + data + "条数据");
							$("#deleteBatchStudent").hide();
						} else {
							layer.msg("删除失败或没有勾选");
						}
					}
				});

			});

			$(function(){
							//刷新
							tableIns.reload({
								where: {

								}
							});
			})

			upload.render({
				elem: '#test6',
				/*url: '<%=request.getContextPath()%>/StudentController/insertZs',*/
				url: '<%=request.getContextPath()%>/StudentController/insertStudentExcel',
				auto: false,
				method: 'post',
				field: 'myfile'
					//,multiple: true
					,
				accept: 'file',
				bindAction: '#test7',
				data: {
				} //一同上传的数据
				,
				done: function(res) {
					layer.msg("上传成功");
					$("#deleteBatchStudent").hide();
					//刷新
					tableIns.reload({where: {}});

					//console.log(res.result)
				}
			});



		});

		layui.use('table', function() {

			//毕业生table
			var table = layui.table;
			//毕业生table
			var tableIns = table.render({
				elem: '#findStudent3',
				method: 'post',
				url: '<%=request.getContextPath()%>/StudentController/findRegister',
				width: 1200
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						}, {
							field: 'studentName',
							title: '学生姓名',
							width: 248
						}, {
							field: 'sex',
							title: '性别',
							width: 248
						},
						{
							field: 'studentPlace',
							title: '籍贯',
							width: 248
						}, {
							field: 'studentEducation',
							title: '文化程度',
							width: 248
						}, {
							field: 'studentSpecialty',
							title: '学生特长',
							width: 248
						}, {
							field: 'studentPolitics',
							title: '学生政治面貌',
							width: 248
						}, {
							field: 'idCard',
							title: '身份证',
							width: 248
						}, {
							field: 'studentMedia',
							title: '通过何种媒体得知本校',
							width: 248
						}, {
							field: 'studentCategory',
							title: '考生类别',
							width: 248
						}, {
							field: 'studentGraduationSchool',
							title: '毕业学校地址',
							width: 248
						}, {
							field: 'studentEmail',
							title: '电子信箱',
							width: 248
						}, {
							field: 'studentQq',
							title: 'QQ号',
							width: 248
						}, {
							field: 'studentAddress',
							title: '家庭通信地址',
							width: 248
						}, {
							field: 'studentPostal',
							title: '邮政编码',
							width: 248
						}, {
							field: 'studentPhone',
							title: '联系电话',
							width: 248
						}, {
							field: 'studentResumea',
							title: '简历',
							width: 248
						}, {
							field: 'studentFamilya',
							title: '家庭成员',
							width: 248
						}, {
							field: 'studentMajor',
							title: '自愿专业',
							width: 248
						}, {
							field: 'studentTeacher',
							title: '报名自导老师',
							width: 248
						}, {
							field: 'studentAdmissionMajor',
							title: '经审定录取专业',
							width: 248
						}, {
							field: 'studentState',
							title: '审核状态',
							sort: true,
							templet: '#studentStateTpl',
							width: 248
						}, {
							fixed: 'right',
							title: '操作',
							toolbar: '#barDemo3',
							width: 168,
							align: 'center'
						}
					]
				],
				skin: 'row',
				even: true,
				page: true,
				limits: [10, 20, 30],
				limit: 10,
				id: 'test' //ID
					,
				where: {
					//deptno: treeNode.id
				} //如果无需传递额外参数，可不加该参数
				,
				done: function(res, curr, count) {

					//监听表格复选框选择
					table.on('checkbox(test)', function(obj) {

						if(obj.checked) {
							$("#deleteBatchStudent").show();
						} else {
							$("#deleteBatchStudent").hide();
						}

					});

					//监听工具条
					table.on('tool(test)', function(obj) {

						var data = obj.data;
						if(obj.event === 'del') {
							layer.confirm('真的删除这个学生吗', function(index) {

								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/StudentController/deleteStudentOne",
									data: {
										studentId: data.studentId
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteBatchStudent").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({
												where: {
													//deptno: treeNode.id
												}
											});

										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							var updateindex = layer.open({
								title: '修改学生信息',
								type: 1,
								offset: 't' //具体配置参考：offset参数项
									,
								content: '<div style="padding: 20px 80px;">' +
									'<div class="layui-form-item">' +
									'<label class="layui-form-label">学生姓名:</label>' +
									'<div class="layui-input-block">' +
									'<input type="text" name="studentName" id="studentName" lay-verify="required|studentName" required placeholder="请输入学生姓名" autocomplete="off" class="layui-input">' +
									'</div>' +
									'</div>' +
									'<div class="layui-form-item">' +
									'<label class="layui-form-label">学号:</label>' +
									'<div class="layui-input-block">' +
									'<input type="text" name="number" id="number" lay-verify="required|title" required placeholder="请输入学号" autocomplete="off" class="layui-input">' +
									'</div>' +
									'</div>' +
									'<div class="layui-form-item">' +
									'<label class="layui-form-label">身份证:</label>' +
									'<div class="layui-input-block">' +
									'<input type="text" name="idCard" id="idCard" lay-verify="required|title" required placeholder="请输入身份证" autocomplete="off" class="layui-input">' +
									'</div>' +
									'</div>' +
									'</div>',
								btn: '确定',
								btnAlign: 'c' //按钮居中
									,
								area: ['500px', '300px'],
								shade: 0 //不显示遮罩
									,
								yes: function() {

									var studentName = $("#studentName").val();
									var number = $("#number").val();
									var idCard = $("#idCard").val();

									$.ajax({
										type: "post",
										url: "<%=request.getContextPath()%>/StudentController/updateStudentOne",
										data: {
											studentId: data.studentId,
											studentName: studentName,
											idCard: idCard
										},
										async: true,
										//timeout:12000,
										success: function(data) {
											if(data > 0) {
												layer.msg("修改成功");
												$("#deleteBatchStudent").hide();
												//刷新
												tableIns.reload({
													where: {

													}
												});

											}
										}
									});

									layer.close(updateindex);
								}
							});

						} else if(obj.event === 'shenhe') {
							//var url = 'filemanage.jsp?studentId='+data.studentId;
							var url = 'student_shenhe.jsp?studentId=' + data.studentId;
							//window.location.href=url;
							window.open(url);
						}
					});
				}

			});

				$("#studentSystem3").on("click", function() {
					$("#student2").hide();
					$("#student1").hide();
					$("#student3").show();
					tableIns.reload({
						where: {

						}
					});
				});


			//模糊查询文件夹  findStudentIdCardVal
			$("#findStudentBtn3").on("click", function() {
				var findStudentIdCardVal3 = $("#findStudentIdCardVal3").val();
				$("#deleteBatchStudent").hide();
				//刷新也可以用
				tableIns.reload({
					where: {
						idCard: findStudentIdCardVal3
					} //如果无需传递额外参数，可不加该参数

				});
			});

			//批量删除学生
			$("#deleteBatchStudent").on("click", function() {
				var checkStatus = table.checkStatus('test'),
					data = checkStatus.data;

				var temp = "";
				$.each(data, function(i, n) {
					//alert(“索引:”+i,”对应值为：”+n.name);
					temp += n.studentId + ",";
				});
				//console.log(temp)
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/StudentController/deleteBatchStudent",
					data: {
						"studentIds": temp
					},
					async: true,
					//timeout:1200,
					success: function(data) {
						if(data > 0) {
							//刷新
							tableIns.reload({
								where: {

								}
							});

							layer.msg("删除了" + data + "条数据");
							$("#deleteBatchStudent").hide();
						} else {
							layer.msg("删除失败或没有勾选");
						}
					}
				});

			});
			
			
			
		});

		//录入学生信息
		layui.use('form', function() {
			var formStudent = layui.form;

			//监听提交
			formStudent.on('submit(formStudent)', function(data) {
				// layer.msg(JSON.stringify(data.field));

				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/StudentController/insertStudent",
					data: {
						studentName: data.field.studentName,
						//number: data.field.number,
						idCard: data.field.idCard,
						age: data.field.age,
						sex: data.field.sex,
						//entranceTime: data.field.entranceTime,
						//graduationTime: data.field.graduationTime,
						//major: data.field.major,
						//studentClass: data.field.studentClass,
						studentRemarks: data.field.studentRemarks
					},
					async: true,
					//timeout:12000,
					success: function(data) {
						if(data > 0) {
							layer.msg("新增成功");
							var f3 = document.forms['formStudent'];
							f3.reset();
						}

					}
				});

				return false;
			});

			formStudent.verify({
				studentName: function(value, item) { //value：表单的值、item：表单的DOM对象
						if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
							return '用户名不能有特殊字符';
						}
						if(/(^\_)|(\__)|(\_+$)/.test(value)) {
							return '用户名首尾不能出现下划线\'_\'';
						}
						if(/^\d+\d+\d$/.test(value)) {
							return '用户名不能全为数字';
						}
					}
					//我们既支持上述函数式的方式，也支持下述数组的形式
					//数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
					,
				age: [
					/^[\S]{1,2}$/, '年龄必须1到2位，且不能出现空格'
				]
			});

		});

		//时间
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem: '#test1' //指定元素
			});
			laydate.render({
				elem: '#test2' //指定元素
			});

		});
	</script>

</html>