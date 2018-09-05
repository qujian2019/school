<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<title>学校结构管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<!--<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />-->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/zTree-zTree_v3-master/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<style>
			body {
				margin: 0px;
			}
			
			.dvi1 {
				width: 20%;
				height: 868px;
				background-color: #D2DCF8;
				float: left;
			}
			
			.dvi2 {
				/*margin:0 auto; */
				width: 80%;
				height: 868px;
				/*background-color: #E7C3C3;*/
				float: right;
			}
			
			#xuexiao {
				width: 100%;
				height: 100%;
			}
			
			#bumen {
				width: 100%;
				height: 100%;
			}
			
			#yuangong {
				width: 100%;
				height: 100%;
			}
			/*#jues {
				width: 500px;
				height: 200px;
				background-color: #E7C3C3;
			}*/
			
			
		</style>
	</head>

	<body>
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		<input type="hidden" value="" id="deptId" />

		<div class="dvi1">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
		<div class="dvi2">
			<!--描述：最顶层节点暂时不给操作-->
			<div id="xuexiao">
				<!--描述：-->
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a name="color-design">部门管理</a>
					</legend>
				</fieldset>
				<!--描述：-->
				<blockquote class="layui-elem-quote">
					<a href="javascript:;" class="layui-btn" id="newDept">
						<i class="layui-icon">&#xe608;</i>新增部门
					</a>
					<a href="javascript:;" class="layui-btn layui-btn-danger" id="deleteBatchDept">
						<i class="layui-icon">&#x1006;</i>批量删除部门
					</a>
				</blockquote>
				<!--描述：-->
				<fieldset class="layui-elem-field" id="DeptTable">
					<legend>部门列表</legend>
					<div class="demoTable">
						部门查询：
						<div class="layui-inline">
							<input class="layui-input" name="findDeptVal" id="findDeptVal" />
						</div>
						<button class="layui-btn" id="findDeptBtn">搜索</button>
					</div>
					<!--描述：文件夹列表 -->
					<table id="findDept" lay-filter="test"></table>
					<!--	描述：控制按钮 -->
					<div class="layui-hide" id="barDemo">
						

						<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>

						<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
					</div>

				</fieldset>
				<!--描述：-->
				<fieldset class="layui-elem-field" id="newDeptPanel">
					<legend>新增部门</legend>
					<form class="layui-form" action="">
						<div class="layui-form-item">
							<label class="layui-form-label">部门名称:</label>
							<div class="layui-input-block">
								<input type="text" id="dname" name="dname" required lay-verify="required" placeholder="请输入部门名称" autocomplete="off" class="layui-input" style="width: 200px;">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="formDept">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				</fieldset>

			</div>
			<!--描述：部门节点的操作div-->
			<div id="bumen">
				<!--描述：-->
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a name="color-design">用户管理</a>
					</legend>
				</fieldset>
				<!--描述：-->
				<blockquote class="layui-elem-quote">
					<a href="javascript:;" class="layui-btn " id="newUser">
						<i class="layui-icon">&#xe608;</i>新增用户
					</a>
					<a href="javascript:;" class="layui-btn layui-btn-danger " id="deleteBatchUser">
						<i class="layui-icon">&#x1006;</i>批量删除用户
					</a>
					<!--<a href="javascript:;" class="layui-btn layui-btn-danger " id="deleteBatchUser">
						<i class="layui-icon">&#x1006;</i>返回到
					</a>-->
				</blockquote>
				<!--描述：-->
				<fieldset class="layui-elem-field" id="UserTable">
					<legend>用户列表</legend>
					<div class="demoTable">
						用户查询：
						<div class="layui-inline">
							<input class="layui-input" name="findUserVal" id="findUserVal" />
						</div>
						<button class="layui-btn" id="findUserBtn">搜索</button>
					</div>
					<!--描述：文件夹列表 -->
					<table id="findUser" lay-filter="test"></table>
					<!--	描述：控制按钮 -->
					<div class="layui-hide" id="barDemo">
						
							<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
						<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>
					
					</div>

				</fieldset>

				<fieldset class="layui-elem-field" id="newUserFieldset">
					<legend>新增用户</legend>
					<form class="layui-form" action="">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名:</label>
							<div class="layui-input-block">
								<input type="text" name="userCode" required lay-verify="required" placeholder="姓名建议:XXX_电话号码" autocomplete="off" class="layui-input" style="width: 200px;">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">密码:</label>
							<div class="layui-input-inline">
								<input type="password" name="userPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 200px">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">用户年龄:</label>
							<div class="layui-input-block">
								<input type="text" name="userAge" required lay-verify="required" placeholder="请输入用户年龄" autocomplete="off" class="layui-input" style="width: 200px;">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">单选框:</label>
							<div class="layui-input-block">
								<input type="radio" name="userGender" value="男" title="男">
								<input type="radio" name="userGender" value="女" title="女" checked>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">入职时间</label>
							<div class="layui-input-block">
								<input type="text" name="userEntryTime" required lay-verify="required" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" style="width: 200px;" id="tt1">
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

			</div>
			<!--描述：员工节点的操作div-->
			<div id="yuangong">
				<!--<h1 style="font-size: 54px;font-weight: 400;">员工操作</h1>-->
				<!--描述：-->
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a name="color-design">用户权限管理</a>
					</legend>
				</fieldset>
				<!--描述：-->
				<blockquote class="layui-elem-quote">
					<a href="javascript:;" class="layui-btn layui-bg-green" id="userMoveDeptBtn">
						<i class="layui-icon">&#xe613;</i>用户部门调度
					</a>
					<a href="javascript:;" class="layui-btn layui-bg-green" id="UserPermissionstBtn">
						<i class="layui-icon">&#xe613;</i>添加权限
					</a>
					<a href="javascript:;" class="layui-btn layui-btn-danger" id="deleteUserPermissionstBtn">
						<i class="layui-icon">&#xe613;</i>删除用户权限
					</a>
					<a href="javascript:;" class="layui-btn layui-btn-normal" id="initialization">
						<i class="layui-icon">&#xe613;</i>初始化用户密码
					</a>
				</blockquote>
				<!--描述：-->
				<fieldset class="layui-elem-field" id="UserPermissions">
					<legend>添加权限</legend>
					<form class="layui-form" action="">
						<div class="layui-form-item">
							<label class="layui-form-label">用户姓名:</label>
							<div class="layui-input-block">
								<input type="text" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="userNameInput" disabled="disabled">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">系统角色:</label>
							<div class="layui-input-block" id="findGsxyRole">

							<c:if test="${activeUser.rolemenus!=null }">
								<c:forEach items="${activeUser.rolemenus}" var="rolemenu">
										 <input type="checkbox" name="roleIds"  value="${rolemenu.roleId}" title="${rolemenu.roleName}" class="roleTemp">
								</c:forEach>
							</c:if>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="formPermissions">立即提交</button>
								<!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
							</div>
						</div>
					</form>
					<div id="jues">
					</div>
				</fieldset>

				<!--描述：-->
				<fieldset class="layui-elem-field" id="userMoveDept">
					<legend>用户部门调度</legend>
					<form class="layui-form" action="">
						<div class="layui-form-item">
							<label class="layui-form-label">用户姓名:</label>
							<div class="layui-input-block">
								<input type="text" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="userNameInput1" disabled="disabled">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">部门选择框:</label>
							<div class="layui-input-block">
								<select name="deptno" lay-verify="required" id="deptSelect">
									<option value=""></option>
									<c:if test="${activeUser.depts!=null }">
										<c:forEach items="${activeUser.depts}" var="dept">
													<option value="${dept.deptno}">${dept.dname}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="userMoveDeptform">立即提交</button>
								<!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
							</div>
						</div>
					</form>
				</fieldset>
				
				<!--描述：删除角色-->
				<fieldset class="layui-elem-field" id="deleteUserPermissionst">
					<legend>删除角色</legend>
					<form class="layui-form" action="">
						<div class="layui-form-item">
							<label class="layui-form-label">用户姓名:</label>
							<div class="layui-input-block">
								<input type="text" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input" id="userNameInput2" disabled="disabled">
							</div>
						</div>

						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="deleteUserPermissionstForm">立即提交</button>
								<!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
							</div>
						</div>
					</form>
				</fieldset>
				
				

			</div>

		</div>
	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/r3/zTree-zTree_v3-master/zTree_v3/js/jquery.ztree.core.js"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>

	<script>
		layui.use('laydate', function() {
			var laydate = layui.laydate;

			//执行一个laydate实例
			laydate.render({
				elem: '#tt1' //指定元素
			});

		});

		//树型结构
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "pId",
					rootPId: -1
				}
			},
			view: {
				dblClickExpand: false,
				selectedMulti: false
			},
			callback: {
				onClick: zTreeOnClick
			}
		};

		//获取ztree数据
		function ztreeFind() {
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/UserManagemenController/findZtreeOrganiza",
				data: {

				},
				async: true,
				//timeout:12000,
				success: function(data) {
					//console.log(data);
					$.fn.zTree.init($("#treeDemo"), setting, data);

				}
			});
		};

		$(document).ready(function() {

			$("#newDeptPanel").hide();
			$("#newUserFieldset").hide();
			$("#xuexiao").hide();
			$("#bumen").hide();
			$("#yuangong").hide();
			$("#deleteBatchDept").hide();
			$("#UserPermissionstBtn").hide();

			//查询ztree
			ztreeFind();

		});
		//获取节点信息
		function zTreeOnClick(event, treeId, treeNode) {
			//alert(treeNode.id + ", " + treeNode.name);
			//showv == 0 表示部门
			if(treeNode.showv == 0) {
				// 	$("#deptId").val(treeNode.id);

				//console.log($("#deptId").val())
				$("#newDeptPanel").hide();
				$("#xuexiao").show();
				$("#bumen").hide();
				$("#yuangong").hide();
				$("#DeptTable").show();
				
				layui.use('table', function() {
					//当用户选择了学校就查询部门	

					//部门table用户管理
					var table = layui.table;
					//部门table
					var tableIns = table.render({
						elem: '#findDept',
						method: 'post',
						url: '<%=request.getContextPath()%>/UserManagemenController/findDeptTable',
						width: 900
							//,height: 274
							,
						cols: [
							[ //标题栏
								//								{
								//									checkbox: true,
								//									LAY_CHECKED: false
								//								},
								{
									field: 'dname',
									title: '部门名称',
									width: 266
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
							deptno: treeNode.id
						} //如果无需传递额外参数，可不加该参数
						,
						done: function(res, curr, count) {

							//监听表格复选框选择
							table.on('checkbox(test)', function(obj) {

								if(obj.checked) {
									$("#deleteBatchDept").show();
								} else {
									$("#deleteBatchDept").hide();
								}

							});

							//监听工具条
							table.on('tool(test)', function(obj) {

								var data = obj.data;
								if(obj.event === 'del') {
									layer.confirm('真的删除这个部门么', function(index) {

										$.ajax({
											type: "post",
											url: "<%=request.getContextPath()%>/UserManagemenController/deleteDept",
											data: {
												deptno: data.deptno
											},
											async: true,
											//timeout:12000,
											success: function(data) {
												if(data > 0) {
													$("#deleteBatchDept").hide();
													layer.msg("删除成功");
													//刷新
													tableIns.reload({
														where: {
															deptno: treeNode.id
														}
													});
													//删除后查询
													ztreeFind();

												} else {
													layer.msg("部门下还有成员,需要转移到其他部门或是删除成员才能删除部门");
												}

											}
										});

										layer.close(index);
									});
								} else if(obj.event === 'edit') {
									var updateindex = layer.open({
										title: '修改部门信息',
										type: 1,
										offset: 't' //具体配置参考：offset参数项
											,
										content: '<div style="padding: 20px 80px;">' +
											'<div class="layui-form-item">' +
											'<label class="layui-form-label">部门名称:</label>' +
											'<div class="layui-input-block">' +
											'<input type="text" name="fileDeptName" id="fileDeptName" lay-verify="required|title" required placeholder="请输入部门名称" autocomplete="off" class="layui-input">' +
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

											var fileDeptName = $("#fileDeptName").val();

											$.ajax({
												type: "post",
												url: "<%=request.getContextPath()%>/UserManagemenController/updateDept",
												data: {
													deptno: data.deptno,
													dname: fileDeptName
												},
												async: true,
												//			timeout:12000,
												success: function(data) {
													if(data > 0) {
														layer.msg("修改成功");
														//刷新
														tableIns.reload({
															where: {
																deptno: treeNode.id,
															}

														});
														//查询ztree
														ztreeFind();

													}
												}
											});

											layer.close(updateindex);
										}
									});

								} else if(obj.event === 'aaaa') {
									
									
									//console.log('xxxx');
									
									
									
									//										var url = 'filemanage.jsp?fileFolderId='+data.fileFolderId+'&fileFolderName='+data.fileFolderName;
									//									    window.location.href=url;
								}
							});
						}
					});

					//模糊查询文件夹
					$("#findDeptBtn").on("click", function() {
						var findDeptVal = $("#findDeptVal").val();
						$("#deleteFileFolder").hide();
						//刷新也可以用
						tableIns.reload({
							where: {
								deptno: treeNode.id,
								dname: $("#findDeptVal").val()
							} //如果无需传递额外参数，可不加该参数

						});
					});

					//新增部门按钮
					$("#newDept").on("click", function() {

						$("#newDeptPanel").show();
						$("#DeptTable").hide();

						layui.use('form', function() {
							var newDeptform = layui.form;

							//监听提交
							newDeptform.on('submit(formDept)', function(data) {
								//layer.msg(JSON.stringify(data.field));
								//console.log(data.field.userName);

								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/UserManagemenController/insertDept",
									data: {
										deptno: treeNode.id,
										dname: data.field.dname
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											layer.msg("新增成功");
											$("#dname").val("");
											//刷新
											tableIns.reload({
												where: {
													deptno: treeNode.id
												}

											});

											//查询ztree
											ztreeFind();

										}
									}
								});

								//显示新增页面
								$("#newUserFieldset").hide();
								//隐藏用户表hide
								$("#UserTable").show();

								return false;
							});
						});

					});

				});

			} else if(treeNode.showv == 1) {

				//console.log("修改部门");
				$("#xuexiao").hide();
				$("#bumen").show();
				$("#yuangong").hide();
				$("#deleteBatchUser").hide();
				$("#newUserFieldset").hide();
				$("#UserTable").show();

				//用户table
				layui.use('table', function() {
					//当用户选择了学校就查询部门	

					//用户table
					var table = layui.table;
					//用户table
					var tableIns = table.render({
						elem: '#findUser',
						method: 'post',
						url: '<%=request.getContextPath()%>/UserManagemenController/findUserTable',
						width: 900
							//,height: 274
							,
						cols: [
							[ //标题栏
								{
									checkbox: true,
									LAY_CHECKED: false
								},
								{
									field: 'userCode',
									title: '用户名称',
									width: 266
								},
								{
									field: 'userAge',
									title: '用户年龄',
									width: 266
								},
								{
									field: 'userEntryTime',
									title: '入职时间',
									width: 266
								},
								{
									fixed: 'right',
									title: '操作',
									toolbar: '#barDemo',
									width: 268,
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
							deptno: treeNode.id
						} //如果无需传递额外参数，可不加该参数
						,
						done: function(res, curr, count) {

							//监听表格复选框选择
							table.on('checkbox(test)', function(obj) {

								if(obj.checked) {
									$("#deleteBatchUser").show();
								} else {
									$("#deleteBatchUser").hide();
								}

							});

							//监听工具条
							table.on('tool(test)', function(obj) {
								var data = obj.data;
								if(obj.event === 'del') {
									layer.confirm('真的删除这个用户么', function(index) {

										$.ajax({
											type: "post",
											url: "<%=request.getContextPath()%>/UserManagemenController/deleteUser",
											data: {
												userId: data.userId
											},
											async: true,
											//timeout:12000,
											success: function(data) {
												if(data > 0) {
													$("#deleteBatchUser").hide();
													layer.msg("删除成功");
													//刷新
													tableIns.reload({
														where: {
															deptno: treeNode.id
														}
													});
													//删除后查询
													ztreeFind();

												}
											}

										});

										layer.close(index);
									});
								} else if(obj.event === 'edit') {
									var updateindex = layer.open({
										title: '修改用户信息',
										type: 1,
										offset: 't', //具体配置参考：offset参数项
										content: '<div style="padding: 20px 80px;">' +
											'<div class="layui-form-item">' +
											'<label class="layui-form-label">用户名称:</label>' +
											'<div class="layui-input-block">' +
											'<input type="text" name="userCode" id="userCode" lay-verify="required|title" required placeholder="请输入用户名称" autocomplete="off" class="layui-input">' +
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
											var userCode = $("#userCode").val();

											$.ajax({
												type: "post",
												url: "<%=request.getContextPath()%>/UserManagemenController/updateUserCode",
												data: {

													userId: data.userId,
													userCode: userCode
												},
												async: true,
												//			timeout:12000,
												success: function(data) {
													if(data > 0) {
														layer.msg("修改成功");
														//刷新
														$("#deleteBatchUser").hide();
														tableIns.reload({
															where: {
																deptno: treeNode.id,
															}

														});
														//查询ztree
														ztreeFind();

													} else {
														layer.msg("用户名被占用");
													}

												}
											});

											layer.close(updateindex);
										}
									});

								} else if(obj.event === 'initialization') {
									//初始化密码
//									layer.confirm('真的初始化这个用户的密码么', function(index) {
//
//										$.ajax({
//											type: "post",
//											url: "<%=request.getContextPath()%>/UserManagemenController/initializationPassword",
//											data: {
//												userId: data.userId
//											},
//											async: true,
//											//timeout:12000,
//											success: function(data) {
//												if(data > 0) {
//													$("#deleteBatchUser").hide();
//													layer.msg("初始化成功");
//													//刷新
//													tableIns.reload({
//														where: {
//															deptno: treeNode.id
//														}
//													});
//													//删除后查询
//													ztreeFind();
//
//												}
//											}
//
//										});
//
//										layer.close(index);
//									});
								}
							});
						}
					});

					//模糊查询文件夹
					$("#findUserBtn").on("click", function() {
						//var findUserVal = $("#findUserVal").val();
						$("#deleteBatchUser").hide();
						//刷新也可以用
						tableIns.reload({
							where: {
								deptno: treeNode.id,
								userCode: $("#findUserVal").val()
							} //如果无需传递额外参数，可不加该参数

						});
					});

					//批量删除
					$("#deleteBatchUser").on("click", function() {
						var checkStatus = table.checkStatus('test'),
							data = checkStatus.data;

						var temp = "";
						$.each(data, function(i, n) {
							//alert(“索引:”+i,”对应值为：”+n.name);
							temp += n.userId + ",";
						});
						//console.log(temp)
						$.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/UserManagemenController/deleteBatchUser",
							data: {
								userIds: temp
							},
							async: true,
							//			timeout:1200,
							success: function(data) {
								if(data > 0) {
									//刷新
									tableIns.reload({
										where: {
											deptno: treeNode.id
										}
									});
									ztreeFind();
									layer.msg("删除了" + data + "个用户");
									$("#deleteBatchUser").hide();
								} else {
									layer.msg("删除失败或没有勾选");
								}
							}
						});

					});

					//新增用户按钮
					$("#newUser").on("click", function() {
						//显示新增页面
						$("#newUserFieldset").show();
						//隐藏用户表
						$("#UserTable").hide();

					});
					//新增用户from
					layui.use('form', function() {
						var userForm = layui.form;

						//监听提交
						userForm.on('submit(formDemo)', function(data) {
							//layer.msg(JSON.stringify(data.field));
							//console.log(data.field.userName);

							$.ajax({
								type: "post",
								url: "<%=request.getContextPath()%>/UserManagemenController/insertUser",
								data: {
									deptno: treeNode.id,
									userCode: data.field.userCode,
									userPassword: data.field.userPassword,
									userAge: data.field.userAge,
									userGender: data.field.userGender,
									userEntryTime: data.field.userEntryTime
								},
								async: true,
								//timeout:12000,
								success: function(data) {
									if(data > 0) {

										layer.msg("新增成功");
										//刷新
										tableIns.reload({
											where: {
												deptno: treeNode.id
											}
										});
										//console.log(treeNode.id);
										//后查询
										ztreeFind();

									} else {
										layer.msg("用户名被占用");
									}

								}
							});

							//显示新增页面
							$("#newUserFieldset").hide();
							//隐藏用户表hide
							$("#UserTable").show();

							return false;
						});
					});

				});

			} else if(treeNode.showv == 2) {

				$("#xuexiao").hide();
				$("#bumen").hide();
				$("#yuangong").show();
				$("#userNameInput").val(treeNode.name);
				$("#userNameInput1").val(treeNode.name);
				$("#userNameInput2").val(treeNode.name);
				$("#userMoveDept").hide();
				$("#UserPermissions").show();
				$("#userMoveDeptBtn").show();
				$("#UserPermissionstBtn").hide();
				$("#deleteUserPermissionst").hide();
				
				
				
				function deleteGsxyUserRole(){
						
						$.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/UserManagemenController/deleteGsxyUserRole",
							data: {
								userId: treeNode.id
							},
							async: true,
							success: function(data) {
									layer.msg("该用户所有角色删除成功!");
									$("#jues").html('');
									var roleList = [];
									roleList.push('<span class="layui-badge layui-bg-green">用户没有任何角色</span>');
									$("#jues").append(roleList);
									
							}
						});

				}
				
				//查询部门
//				function findDeptUserMoveDept(){
//					//查询所有部门用于人员调度
//					$.ajax({
//						type: "post",
//						url: "<%=request.getContextPath()%>/UserManagemenController/findDeptUserMoveDept",
//						async: false,
//						success: function(data) {
//							var deptList = [];
//							for(var a = 0; a < data.length; a++) {
//								deptList.push('<option value="' + data[a].deptno + '">' + data[a].dname + '</option>');
//
//							}
//
//							//$("#deptSelect").append(deptList);
//							//layui.form.render();
//						}
//					});
//
//				}


				//查询用户角色的方法
				function findUserGsxyRole(){
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/UserManagemenController/findUserGsxyRole",
						data: {
							userId: treeNode.id
						},
						async: false,
						success: function(data) {
							
							$("#jues").html('');
							var roleList = [];
							
							if(data.length==0){
								roleList.push('<span class="layui-badge layui-bg-green">用户没有任何角色</span>');
							}
							if(data.length>0){
								for(var a = 0; a < data.length; a++) {
									roleList.push('<span class="layui-badge layui-bg-green">用户的角色:'+data[a].roleName+'</span>');
								}
							}
							$("#jues").append(roleList);
						}
					});
				}
				
//				function findGsxyRole(){
//					//查询所有角色信息
//					$.ajax({
//						type: "post",
//						url: "<%=request.getContextPath()%>/UserManagemenController/findGsxyRole",
//						async: true,
//						success: function(data) {
//						//console.log(data);
//							var roleList = [];
//							for(var a = 0; a < data.length; a++) {
//								roleList.push('<input type="checkbox" name="roleIds" title="' + data[a].roleName + '" value="' + data[a].roleId + '" class="roleTemp">');
//							}
//							$("#findGsxyRole").append(roleList);
//
//						}
//					});
//				
//				}

				$(function() {
				
					var deleteUserPermissionstFalg = true;
					$("#deleteUserPermissionstBtn").on("click", function() {
						if(deleteUserPermissionstFalg){
							$("#deleteUserPermissionst").show();
							deleteUserPermissionstFalg = false;
						}else{
								
							$("#deleteUserPermissionst").hide();
							deleteUserPermissionstFalg = true;
						}
					});
				//刷新表达渲染效果
//				form.render(null, 'permissionsForm');
//				form.render(null, 'userMoveDeptform');
				//初始化密码
				$("#initialization").on("click",function(){
					var temp = $("#userId").val();

					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/UserManagemenController/initializationPassword",
						data: {
							userId: temp
						},
						async: true,
						//timeout:12000,
						success: function(data) {
							if(data > 0) {
								$("#deleteBatchUser").hide();
								layer.msg("初始化成功");
							}
						}

					});
				});


					//查询用户角色
					findUserGsxyRole();
					
					//查询所有角色信息
					//findGsxyRole();

					//查询所有部门用于人员调度
					//findDeptUserMoveDept();
					


				});

				//权限表单
				layui.use('form', function() {
					var permissionsForm = layui.form;

					permissionsForm.render(null, 'permissionsForm');
				
					//监听提交
					permissionsForm.on('submit(formPermissions)', function(data) {

						var roleIds1 = "";
						$("[name=roleIds]:checked").each(function(index, element) {
							roleIds1 += $(this).val() + ",";
						});

						$.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/UserManagemenController/insertUserRole",
							dataType: "JSON",
							async: true,
							data: {
								gsxyRole: roleIds1,
								userId: treeNode.id
							},
							success: function(data) {
								if(data > 0) {
									layer.msg("角色添加成功!");
									findUserGsxyRole();
								}
							}
						});

						return false;
					});

				});

				//人员部门调度
				layui.use('form', function() {
					var userMoveDeptform = layui.form;
					
					userMoveDeptform.render(null, 'userMoveDeptform');
					
					//监听提交
					userMoveDeptform.on('submit(userMoveDeptform)', function(data) {

						//查询所有部门用于人员调度
						$.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/UserManagemenController/updateUserDept",
							data: {
								userId: treeNode.id,
								deptno: data.field.deptno
							},
							async: true,
							success: function(data) {
								if(data > 0) {
									layer.msg("人员移动成功!");
									ztreeFind();
								}

							}

						});

						return false;
					});
				});
				
				//用户角色删除
				layui.use('form', function() {
					var deleteUserPermissionstForm = layui.form;
					//监听提交
					deleteUserPermissionstForm.on('submit(deleteUserPermissionstForm)', function(data) {
					
					//删除用户角色的方法
					deleteGsxyUserRole();
					$("#deleteUserPermissionst").hide();
						return false;
					});
				});

				//部门调度按钮
				$("#userMoveDeptBtn").on("click", function() {

					$("#userMoveDept").show();
					$("#UserPermissions").hide();
					$("#userMoveDeptBtn").hide();
					$("#UserPermissionstBtn").show();
				});

				//部门调度按钮
				$("#UserPermissionstBtn").on("click", function() {
					$("#userMoveDept").hide();
					$("#UserPermissions").show();
					$("#UserPermissionstBtn").hide();
					$("#userMoveDeptBtn").show();
				});

			}

		};
	</script>

</html>