<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>文件管理</title>
		<meta charset="utf-8">
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
				<a name="color-design">文件管理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">

			<!--	<i class="layui-icon">&#xe608;</i> 上传文件
				 <input class="layui-btn" id="file1" type="file" name="myfile" value="上传文件">-->
			<div class="layui-upload">
				<button type="button" class="layui-btn layui-btn-normal" id="test6">选择文件</button>
				<button type="button" class="layui-btn" id="test7">开始上传</button>
				<button class="layui-btn layui-btn-danger" id="deleteFile">
						<i class="layui-icon">&#x1006;</i> 批量删除文件
				  </button>
				<button class="layui-btn layui-btn-warm" id="Return">
					<i class="layui-icon">&#x1006;</i> 返回上一级
				</button>

			</div>

			<!--			<a href="javascript:;" class="layui-btn layui-btn-small" id="">
				<button id="UploadFileBut" type="button" class="btn btn-default" data-dismiss="modal">添加文件</button>
			</a>-->

		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>文件列表</legend>
			<div class="demoTable">
				文件名查询：
				<div class="layui-inline">
					<input class="layui-input" name="fileQuery" id="fileQuery" />
				</div>
				<button class="layui-btn" id="findFile">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="fileManage" lay-filter="fileManage"></table>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="preview" id="preview" target="_Blank">预览</a>
				<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="download" id="download">下载</a>
				<!--<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>-->
				<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>

		<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/r3/layui-v2.1.0/layui/layui.js"></script>
		<script>
			var strFullPath = window.document.location.href;
			var Path1 = strFullPath.split("/");
			//项目名
			//consol(Path1[3]); <%=request.getContextPath()%>
		//	console.log(Path1[3])
			var project1 = Path1[3];
		//	console.log(typeof(project))
			var project2 = "/" + project1;

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
			var fileFolderIdtemp = v['fileFolderId'];
			var fileFolderNametemp = v['fileFolderName'];
			

			var name = $("#userName").val();
			var userId = $("#userId").val();

			$("#deleteFile").hide();
			layui.use('table', function() {
				var table = layui.table;

				//方法级渲染
				var tableIns = table.render({
					elem: '#fileManage',
					method: 'post',
					url: '<%=request.getContextPath()%>/FileController//findFile',
					width: 1250
						//,height: 274
						,
					cols: [
						[ //标题栏
							{
								checkbox: true,
								LAY_CHECKED: false
							}, {
								field: 'fileName',
								title: '文件名',
								width: 290
							}, {
								field: 'fileCreateUser',
								title: '文件创建人',
								width: 150
							}, {
								field: 'fileUploadTime',
								title: '文件上传时间',
								width: 180
							}, {
								field: 'fileAddress',
								title: '所在文件夹',
								width: 180
							}, {
								field: 'fileSize',
								title: '文件大小',
								width: 120
							}, {
								fixed: 'right',
								title: '操作',
								toolbar: '#barDemo',
								width: 230,
								align: 'center'
							}
						]
					],
					skin: 'row',
					even: true,
					page: true,
					limits: [10, 20, 30],
					limit: 10,
					id: 'id' //ID
						,
					where: {
						userId: userId,
						fileFolderId: fileFolderIdtemp,
						//$("#fileQuery").val()
						fileName: document.getElementById("fileQuery").value
					} //如果无需传递额外参数，可不加该参数
					, //渲染后的事件
					done: function(res, curr, count) {

						//监听表格复选框选择
						table.on('checkbox(fileManage)', function(obj) {

							//  console.log(obj.checked); //当前是否选中状态

							if(obj.checked) {
								$("#deleteFile").show();
							} else {
								$("#deleteFile").hide();
							}

						});

						//监听工具条
						table.on('tool(fileManage)', function(obj) {

							var data = obj.data;
							if(obj.event === 'del') {
								layer.confirm('真的删除行么', function(index) {

									$.ajax({
										type: "post",
										url: "<%=request.getContextPath()%>/FileController/deleteWorkFile",
										data: {
											"fileId": data.fileId,
										},
										async: true,
										//			timeout:12000,
										success: function(data) {
											if(data > 0) {
												$("#deleteFile").hide();
												layer.msg("删除成功");
												//刷新
												tableIns.reload({
													where: {
														userId: userId,
														fileFolderId: fileFolderIdtemp
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
										'<label class="layui-form-label">备注信息:</label>' +
										'<div class="layui-input-block">' +
										'<input type="text" name="fileRemarks" id="fileRemarks" lay-verify="required|title" required placeholder="请输入备注信息" autocomplete="off" class="layui-input">' +
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

										var fileRemarks = $("#fileRemarks").val();
										$.ajax({
											type: "post",
											url: "<%=request.getContextPath()%>/FileController/updateWorkFile",
											data: {
												"fileId": data.fileId,
												"fileRemarks": fileRemarks,
											},
											async: true,
											//			timeout:12000,
											success: function(data) {
												if(data > 0) {
													layer.msg("修改成功");
													//刷新
													$("#deleteFile").hide();
													tableIns.reload({
														where: {
															userId: userId,
															fileFolderId: fileFolderIdtemp
														}

													});

												}
											}
										});

										layer.close(updateFileFolderindex);
									}
								});

							} else if(obj.event === 'download') {
								var url = '<%=request.getContextPath()%>/FileController/DownloadFile?fileId=' + data.fileId;
								window.location.href = url;
							} else if(obj.event === 'preview') {
								var url = '<%=request.getContextPath()%>/FileController/PreviewFile?fileId=' + data.fileId;
								window.open(url);
								//  window.location.href=url;
							}

						});

					}

				});

				$(function() {
					
					
					$("#Return").on("click",function(){
						var url = "filefoldermanage.jsp"
						window.location.href = url;
					})

					layui.use('upload', function() {
						var $ = layui.jquery,
							upload = layui.upload;

						upload.render({
							elem: '#test6',
							url: '<%=request.getContextPath()%>/FileController/insertWorkFile',
							auto: false,
							method: 'post',
							field: 'myfile'
								//,multiple: true
								,
							accept: 'file',
							bindAction: '#test7',
							data: {
								"fileFolderId": fileFolderIdtemp,
								"fileCreateUser": name,
								"userId": userId
							} //一同上传的数据
							,
							done: function(res) {
								layer.msg("上传成功");
								$("#deleteFile").hide();
								tableIns.reload({
									where: {
										userId: userId,
										fileFolderId: fileFolderIdtemp
									}

								});

								//console.log(res)
							}
						});

					});

					$("#deleteFile").on("click", function() {
						var checkStatus = table.checkStatus('id'),
							data = checkStatus.data;

						var temp = "";
						$.each(data, function(i, n) {
							//alert(“索引:”+i,”对应值为：”+n.name);
							temp += n.fileId + ",";
						});
						//console.log(temp)
						$.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/FileController/updateFileState",
							data: {
								"fileIds": temp
							},
							async: true,
							//			timeout:1200,
							success: function(data) {
								if(data > 0) {
									//刷新
									$("#deleteFile").hide();
									tableIns.reload({
										where: {
											userId: userId,
											fileFolderId: fileFolderIdtemp
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
					$("#findFile").on("click", function() {
						var fileQueryName = $("#fileQuery").val();
						//$("#deleteFile").hide();
						//刷新也可以用
						tableIns.reload({
							where: {
								userId: userId,
								fileFolderId: fileFolderIdtemp,
								fileName: fileQueryName
							} //如果无需传递额外参数，可不加该参数

						});
					});

				});
			});
		</script>
	</body>

</html>