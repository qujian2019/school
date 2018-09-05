<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>文档管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<style>
			body{margin: 0px;}
		</style>
	</head>

	<body>
		<input type="hidden" value="${sessionScope.activeUser.userCode}" id="userName" />
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">文档管理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<a href="javascript:;" class="layui-btn " id="insertFileFolder">
				<i class="layui-icon">&#xe608;</i> 新增文件夹
			</a>
			<a href="javascript:;" class="layui-btn layui-btn-danger " id="deleteFileFolder">
				<i class="layui-icon">&#x1006;</i> 批量删除文件夹
			</a>

		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>文档列表</legend>
			<div class="demoTable">
				文件夹名查询：
				<!--
                  	 autocomplete="off"
                  -->
				<div class="layui-inline">
					<input class="layui-input" name="fileQuery" id="fileQuery" />
				</div>
				<button class="layui-btn" id="findFolder">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="fileManage" lay-filter="test"></table>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail" id="detail">查看</a>
				<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>
				<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>
		<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/r3/layui-v2.1.0/layui/layui.js"></script>
		<script src="<%=request.getContextPath()%>/r3/jquery/ajaxfileupload.js"></script>
		<script>

			var name = $("#userName").val();
			var userId = $("#userId").val();
			//console.log(name)
			$("#deleteFileFolder").hide();
			
			layui.use('table', function() {
				var table = layui.table;

				//方法级渲染
				var tableIns = table.render({
					elem: '#fileManage',
					method: 'post',
					url: '<%=request.getContextPath()%>/FileFolderController/findFileFolder',
					width: 900
						//,height: 274
						,
					cols: [
						[ //标题栏
							{
								checkbox: true,
								LAY_CHECKED: false
							}, {
								field: 'fileFolderName',
								title: '文件夹名称',
								width: 120
							}, {
								field: 'fileFolderCreateUser',
								title: '文档创建人',
								width: 150
							}, {
								field: 'fileFolderCreateTime',
								title: '文档创建时间',
								width: 180
							}, {
								field: 'fileFolderRemarks',
								title: '备注',
								width: 260
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
						userId: userId,
						//$("#fileQuery").val()
						fileFolderName: document.getElementById("fileQuery").value
					} //如果无需传递额外参数，可不加该参数
					,
					done: function(res, curr, count) {

						//监听表格复选框选择
						table.on('checkbox(test)', function(obj) {

							//  console.log(obj.checked); //当前是否选中状态

							if(obj.checked) {
								$("#deleteFileFolder").show();
							} else {
								$("#deleteFileFolder").hide();
							}

						});

						//监听工具条
						table.on('tool(test)', function(obj) {

							var data = obj.data;
							if(obj.event === 'del') {
								layer.confirm('真的删除行么', function(index) {

									$.ajax({
										type: "post",
										url: "<%=request.getContextPath()%>/FileFolderController/deleteFileFolder",
										data: {
											"fileFolderId": data.fileFolderId,
											"fileFolderState": 0
										},
										async: true,
										//			timeout:12000,
										success: function(data) {
											if(data > 0) {
												$("#deleteFileFolder").hide();
												layer.msg("删除成功");
												//刷新
												tableIns.reload({
													where: {
														userId: userId,
													}

												});
											}
										}
									});

									layer.close(index);
								});
							} else if(obj.event === 'edit') {
								var updateFileFolderindex = layer.open({
									title: '修改文件夹',
									type: 1,
									offset: 't' //具体配置参考：offset参数项
										,
									content: '<div style="padding: 20px 80px;">' +
										'<div class="layui-form-item">' +
										'<label class="layui-form-label">文件名称:</label>' +
										'<div class="layui-input-block">' +
										'<input type="text" name="fileFolderName" id="fileFolderName" lay-verify="required|title" required placeholder="请输入文件名称" autocomplete="off" class="layui-input">' +
										'</div>' +
										'</div>' +
										'<div class="layui-form-item">' +
										'<label class="layui-form-label">备注信息:</label>' +
										'<div class="layui-input-block">' +
										'<input type="text" name="fileFolderRemarks" id="fileFolderRemarks" lay-verify="required|title" required placeholder="请输入备注信息" autocomplete="off" class="layui-input">' +
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

										var fileFolderName = $("#fileFolderName").val();
										var fileFolderRemarks = $("#fileFolderRemarks").val();
										$.ajax({
											type: "post",
											url: "<%=request.getContextPath()%>/FileFolderController/updateFileFolder",
											data: {
												"fileFolderId": data.fileFolderId,
												"fileFolderName": fileFolderName,
												"fileFolderRemarks": fileFolderRemarks,
											},
											async: true,
											//			timeout:12000,
											success: function(data) {
												if(data > 0) {
													layer.msg("修改成功");
													//刷新
													tableIns.reload({
														where: {
															userId: userId,
														}

													});

												}
											}
										});

										layer.close(updateFileFolderindex);
									}
								});

							}else if(obj.event === 'detail'){
										var url = 'filemanage.jsp?fileFolderId='+data.fileFolderId+'&fileFolderName='+data.fileFolderName;
									    window.location.href=url;
							}

						});

					}

				});

				$(function() {
					//批量删除
					$("#deleteFileFolder").on("click", function() {
						var checkStatus = table.checkStatus('test'),
							data = checkStatus.data;

						var temp = "";
						$.each(data, function(i, n) {
							//alert(“索引:”+i,”对应值为：”+n.name);
							temp += n.fileFolderId + ",";
						});
						//console.log(temp)
						$.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/FileFolderController/updateFileFolderState",
							data: {
								"fileFolderIds": temp
							},
							async: true,
							//			timeout:1200,
							success: function(data) {
								if(data > 0) {
									//刷新
									tableIns.reload({
										where: {
											userId: userId,
										}

									});
									layer.msg("删除了" + data + "条数据");
									$("#deleteFileFolder").hide();
								} else {
									layer.msg("删除失败或没有勾选");
								}
							}
						});

					});

					//模糊查询文件夹
					$("#findFolder").on("click", function() {
						var fileQueryName = $("#fileQuery").val();
						$("#deleteFileFolder").hide();
						//刷新也可以用
						tableIns.reload({
							where: {
								userId: userId,
								fileFolderName: fileQueryName
							} //如果无需传递额外参数，可不加该参数

						});
					});
					//添加文件夹按钮
					$("#insertFileFolder").on("click", function() {
						var insertFileFolderindex = layer.open({
							title: '新增文件夹',
							type: 1,
							offset: 't' //具体配置参考：offset参数项
								,
							content: 
								'<div style="padding: 20px 80px;">' +
									'<div class="layui-form-item">' +
										'<label class="layui-form-label">文件名称:</label>' +
										'<div class="layui-input-block">' +
											'<input type="text" name="fileFolderName" id="fileFolderName" lay-verify="required|title" required placeholder="请输入文件名称" autocomplete="off" class="layui-input">' +
										'</div>' +
									'</div>' +
									'<div class="layui-form-item">' +
										'<label class="layui-form-label">备注信息:</label>' +
										'<div class="layui-input-block">' +
										'	<input type="text" name="fileFolderRemarks" id="fileFolderRemarks" lay-verify="required|title" required placeholder="请输入备注信息" autocomplete="off" class="layui-input">' +
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

								var fileFolderName = $("#fileFolderName").val();
								var fileFolderRemarks = $("#fileFolderRemarks").val();
								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/FileFolderController/insertFileFolder",
									data: {
										"userId": userId,
										"FileFolderCreateUser": name,
										"fileFolderName": fileFolderName,
										"fileFolderRemarks": fileFolderRemarks,
									},
									async: true,
									//			timeout:12000,
									success: function(data) {
										if(data > 0) {
											layer.msg("新增成功");
											//刷新
											tableIns.reload({
												where: {
													userId: userId,
												}

											});
										}
									}
								});

								layer.close(insertFileFolderindex);
							}
						});
					});

				});

			});
		</script>
	</body>

</html>