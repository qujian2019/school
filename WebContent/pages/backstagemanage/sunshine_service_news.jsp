<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>

	<head>
		<title>阳光新闻发布</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<!--<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />-->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
		<style>
			body {
				margin: 0px;
			}
		</style>
	</head>

	<body>
		<input type="hidden" value="${sessionScope.activeUser.userCode}" id="userName" />
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">阳光新闻发布</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			
				<a href="javascript:;" class="layui-btn " id="release">
					<i class="layui-icon">&#xe608;</i>发布新闻
				</a>

				<a href="javascript:;" class="layui-btn layui-btn-danger " id="deleteBatchNews">
					<i class="layui-icon">&#x1006;</i> 批量删除新闻
				</a>
			
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>阳光新闻列表</legend>
			<div class="demoTable">
				阳光新闻标题查询：
				<!--
                  	 autocomplete="off"
                  -->
				<div class="layui-inline">
					<input class="layui-input" name="newsTitle" id="newsTitle" />
				</div>
				<button class="layui-btn" id="findnewsTitle">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="findSunshineServiceNews" lay-filter="findNewsFilter"></table>
			<script type="text/html" id="newTypeTpl">
				{{# if(d.newType == 'SGFW0'){ }}
				<span >信息公开</span> 
				{{# }else if(d.newType == 'SGFW1'){ }}
				<span>办事指南</span> 
				{{# }else if(d.newType == 'SGFW2'){ }}
				<span>常见问题</span> 
				{{# }else if(d.newType == 'SGFW3'){ }}
				<span>热点问题</span> 
				{{# }else if(d.newType == 'SGFW4'){ }}
				<span>图片新闻</span> 
				{{# }else if(d.newType == 'SGFW5'){ }}
				<span>阳光咨询</span> 
				{{# } }}
			</script>
			
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail" id="detail">预览</a>
				<!--<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>-->
				<a class="layui-btn layui-btn-warm layui-btn-mini" lay-event="editTime" id="editTime">编辑新闻发布时间</a>
				<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>

	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
	<script>
		$("#deleteBatchNews").hide();
		var userName = $("#userName").val();
		var userId = $("#userId").val();
		//console.log(name,userId)


		layui.use('table', function() {
			var table = layui.table;

			//方法级渲染
			var tableIns = table.render({
				elem: '#findSunshineServiceNews',
				method: 'post',
				url: '<%=request.getContextPath()%>/SunshineServiceController/findSunshineServiceNews',
				width: 1000
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						},
/*						{
							field: 'newsAuditStatus',
							title: '审核状态',
							sort: true,
							templet: '#newsAuditStatusTpl',
							width: 200
						},*/
						{
							field: 'newsTitle',
							title: '新闻标题',
							width: 220
						}, {
							field: 'newsReleaseUser',
							title: '新闻发布者',
							width: 100
						}, {
							field: 'newType',
							title: '新闻类型',
							templet: '#newTypeTpl',
							width: 100
						}, {
							field: 'newsReleaseTime',
							title: '发布时间',
							sort: true,
							width: 220
						}, 
/*						{
							field: 'newsVisitConut',
							title: '访问量',
							sort: true,
							width: 90
						},*/
						{
							fixed: 'right',
							title: '操作',
							toolbar: '#barDemo',
							width: 400,
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
					newsReleaseUser: userName
				} //如果无需传递额外参数，可不加该参数
				,
				done: function(res, curr, count) {

					//监听表格复选框选择
					table.on('checkbox(findNewsFilter)', function(obj) {
						//  console.log(obj.checked); //当前是否选中状态
						if(obj.checked) {
							$("#deleteBatchNews").show();
						} else {
							$("#deleteBatchNews").hide();
						}
					});

					//监听工具条
					table.on('tool(findNewsFilter)', function(obj) {

						var data = obj.data;

						if(obj.event === 'detail') {
							//http://172.16.1.83:8080/school/pages/anon/sunshine_service_news_temp.jsp
							var url = '<%=request.getContextPath()%>/pages/anon/sunshine_service_news_temp.jsp?newsId=' + data.newsId;
							window.open(url);
							
						} else if(obj.event === 'del') {
							layer.confirm('真的删除行么', function(index) {

								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/SunshineServiceController/deleteSunshineServiceNews",
									data: {
										newsId: data.newsId,
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteBatchNews").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({
												where: {
													userId: userId
												}
											});
										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							//var url = "newseditorpage.jsp?newsId=" + data.newsId;
							//window.location.href = url;
						} else if(obj.event === 'editTime') {
							
							//时间
							layui.use('laydate', function() {
								var laydate = layui.laydate;
								//执行一个laydate实例
								laydate.render({
									elem: '#newsReleaseTime' //指定元素
								});
					
							});
							
							
							//console.log('xxx');
								var updateNewTimeindex = layer.open({
									title: '修改新闻时间',
									type: 1,
									offset: 't' //具体配置参考：offset参数项
										,
									content: '<div style="padding: 20px 80px;">' +
										'<div class="layui-form-item">' +
										'<label class="layui-form-label">时间信息:</label>' +
										'<div class="layui-input-block">' +
										'<input type="text" name="newsReleaseTime" id="newsReleaseTime" lay-verify="required" required placeholder="请输入时间" autocomplete="off" class="layui-input">' +
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

										var newsReleaseTime = $("#newsReleaseTime").val();
										$.ajax({
											type: "post",
											url: "<%=request.getContextPath()%>/SunshineServiceController/updateNewsReleaseTime",
											data: {
												newsId:data.newsId,
												newsReleaseTime:newsReleaseTime
											},
											async: true,
											//			timeout:12000,
											success: function(data) {
												if(data > 0) {
													layer.msg("修改成功");
													//刷新
													$("#deleteBatchNews").hide();
													tableIns.reload({
														where: {
															userId: userId
														
														}

													});

												}
											}
										});

										layer.close(updateNewTimeindex);
									}
								});
						}

					});

				}

			});

			$(function() {

				$("#deleteBatchNews").on("click", function() {
					var checkStatus = table.checkStatus('id'),
						data = checkStatus.data;

					var temp = "";
					$.each(data, function(i, n) {
						//alert(“索引:”+i,”对应值为：”+n.name);
						temp += n.newsId + ",";
					});
					//	console.log(temp)
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/SunshineServiceController/updateGsxySunshineServiceNewsState",
						data: {
							"newsIds": temp
						},
						async: true,
						//			timeout:1200,
						success: function(data) {
							if(data > 0) {
								//刷新
								$("#deleteBatchNews").hide();
								layer.msg("删除了" + data + "条数据");
								tableIns.reload({
									where: {
										userId: userId,
										newsReleaseUser: userName
									}
								});
							} else {
								layer.msg("删除失败或没有勾选");
							}
						}
					});

				});

				//跳到发布编辑页面
				$("#release").on("click", function() {
					var url = 'sunshine_service_seditorpage.jsp';
					window.location.href = url;
				});
				//模糊查询
				$("#findnewsTitle").on("click", function() {
					var newsTitle = $("#newsTitle").val();
					//$("#deleteFile").hide();
					//刷新也可以用
					tableIns.reload({
						where: {
							userId: userId,
							newsTitle: newsTitle,
							newsReleaseUser: userName
						} //如果无需传递额外参数，可不加该参数
					});
				});

			});

		});
		
		//跳到发布编辑页面
		$("#release").on("click", function() {
			var url = 'sunshine_service_seditorpage.jsp';
			window.location.href = url;
		});
		
	</script>

</html>