<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>阳光服务信息</title>
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
		<!--	 
			<input type="hidden" value="${sessionScope.activeUser.userCode}" id="userName" />
			<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		-->
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">阳光服务信息审理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">

			<a href="javascript:;" class="layui-btn layui-btn-danger " id="deleteBatchSunshineService">
				<i class="layui-icon">&#x1006;</i> 批量删除阳光服务信息
			</a>

		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>阳光服务信息审理列表</legend>
			<div class="demoTable">
				阳光服务信息审理标题查询：
				<!--
                  	 autocomplete="off"
                  -->
				<div class="layui-inline">
					<input class="layui-input" name="sunshineTitle" id="sunshineTitle" />
				</div>
				<button class="layui-btn" id="findSunshineTitle">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="findSunshineServiceHear" lay-filter="findNewsFilter"></table>
			<script type="text/html" id="sunshineStateTpl">
				{{# if(d.sunshineState == '0'){ }}
				<span style="color: red;">等待办理</span> {{# }else if(d.sunshineState == '1'){ }}
				<span style="color: #009900;">已办理</span> {{# }else if(d.sunshineState == '2'){ }}
				<span style="color: #0066CC;">已结办</span> {{# } }}
			</script>
			<script type="text/html" id="sunshineCategoryTpl">
				{{# if(d.sunshineCategory == '1'){ }}
				<span>热点咨询</span> {{# }else if(d.sunshineCategory == '2'){ }}
				<span>学生/家长</span> {{# }else if(d.sunshineCategory == '3'){ }}
				<span>教师</span> {{# }else if(d.sunshineCategory == '4'){ }}
				<span>教育机构</span> {{# }else if(d.sunshineCategory == '5'){ }}
				<span>社会人员</span> {{# }else if(d.sunshineCategory == '6'){ }}
				<span>教育收费</span> {{# }else if(d.sunshineCategory == '7'){ }}
				<span>师德师风</span> {{# }else if(d.sunshineCategory == '8'){ }}
				<span>教师权益</span> {{# }else if(d.sunshineCategory == '9'){ }}
				<span>学生权益</span> {{# }else if(d.sunshineCategory == '10'){ }}
				<span>校园安全</span> {{# }else if(d.sunshineCategory == '11'){ }}
				<span>教育培训</span> {{# }else if(d.sunshineCategory == '12'){ }}
				<span>教学管理</span> {{# }else if(d.sunshineCategory == '13'){ }}
				<span>后勤服务</span> {{# }else if(d.sunshineCategory == '14'){ }}
				<span>服务质量</span> {{# }else if(d.sunshineCategory == '15'){ }}
				<span>其他</span> {{# }else if(d.sunshineCategory == '16'){ }}
				<span>群众表扬</span> {{# }else if(d.sunshineCategory == '17'){ }}
				<span>群众建议</span> {{# }else if(d.sunshineCategory == '18'){ }}
				<span>高等学校</span> {{# }else if(d.sunshineCategory == '19'){ }}
				<span>社会公众或机构</span> {{# } }}
			</script>

			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail" id="detail">审理服务信息</a>
				<!--<a class="layui-btn layui-btn-mini" lay-event="edit" id="edit">编辑</a>-->
				<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>

	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
	<script>
		$("#deleteBatchSunshineService").hide();

		layui.use('table', function() {
			var table = layui.table;

			//方法级渲染
			var tableIns = table.render({
				elem: '#findSunshineServiceHear',
				method: 'post',
				url: '<%=request.getContextPath()%>/SunshineServiceController/findSunshineServiceHear',
				width: 1000
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						},
						{
							field: 'sunshineState',
							title: '审核状态',
							//	sort: true,
							templet: '#sunshineStateTpl',
							width: 200
						},
						{
							field: 'sunshineTitle',
							title: '来信主题',
							width: 220
						}, {
							field: 'sunshineCategory',
							title: '服务类别',
							templet: '#sunshineCategoryTpl',
							width: 100
						}, {
							field: 'sunshineName',
							title: '来信人姓名',
							//templet: '#newTypeTpl',
							width: 100
						}, {
							field: 'sunshineLetterTime',
							title: '来信时间',
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
							width: 210,
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

				} //如果无需传递额外参数，可不加该参数
				,
				done: function(res, curr, count) {

					//监听表格复选框选择
					table.on('checkbox(findNewsFilter)', function(obj) {
						//  console.log(obj.checked); //当前是否选中状态
						if(obj.checked) {
							$("#deleteBatchSunshineService").show();
						} else {
							$("#deleteBatchSunshineService").hide();
						}
					});

					//监听工具条
					table.on('tool(findNewsFilter)', function(obj) {
						var data = obj.data;
						if(obj.event === 'detail') {
							var url = "<%=request.getContextPath()%>/pages/backstagemanage/sunshine_service_trial_service.jsp?sunshineId="+data.sunshineId;
							window.location.href = url;
							//window.open(url);
						} else if(obj.event === 'del') {
							layer.confirm('真的删除行么', function(index) {

								$.ajax({
									type: "post",
									url: "<%=request.getContextPath()%>/SunshineServiceController/deleteSunshineServiceOne",
									data: {
										sunshineId: data.sunshineId
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteBatchSunshineService").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({
												where: {

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

						}

					});

				}

			});

			$(function() {

				$("#deleteBatchSunshineService").on("click", function() {
					var checkStatus = table.checkStatus('id'),
						data = checkStatus.data;

					var temp = "";
					$.each(data, function(i, n) {
						//alert(“索引:”+i,”对应值为：”+n.name);
						temp += n.sunshineId + ",";
					});
					//	console.log(temp)
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/SunshineServiceController/deleteSunshineServiceBatch",
						data: {
							sunshineIds: temp
						},
						async: true,
						//			timeout:1200,
						success: function(data) {
							if(data > 0) {
								//刷新
								$("#deleteBatchSunshineService").hide();
								layer.msg("删除了" + data + "条数据");
								tableIns.reload({
									where: {

									}
								});
							} else {
								layer.msg("删除失败或没有勾选");
							}
						}
					});

				});

				//模糊查询
				$("#findSunshineTitle").on("click", function() {
					var sunshineTitle = $("#sunshineTitle").val();
					//$("#deleteFile").hide();
					//刷新也可以用
					tableIns.reload({
						where: {
							sunshineTitle: sunshineTitle
						} //如果无需传递额外参数，可不加该参数
					});
				});

			});

		});
	</script>

</html>