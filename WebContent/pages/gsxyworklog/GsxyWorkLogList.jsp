<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
			<title>湖南工商职业学院员工工作日志列表</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="renderer" content="webkit">
			<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
			<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
			<link rel="shortcut icon" href="http://www.hngsxy.com/r3/imgs/sign/bitbug_favicon.ico" />
    </head>
    <body>
		<input type="hidden" value="${sessionScope.activeUser.userName}" id="userName" />
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />
		<input type="hidden" value="${sessionScope.activeUser.deptno}" id="deptNo" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">湖南工商职业学院员工工作日志列表</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
<!--			<a href="GsxyWorkLogList.jsp" class="layui-btn ">
				<i class="layui-icon">&#xe608;</i> 工作日志列表
			</a>-->
			<a href="javascript:;" class="layui-btn layui-btn-danger" style="display: none;" id="deleteGsxyWorkLog">
				<i class="layui-icon">&#x1006;</i> 批量删除文件夹
			</a>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>工作日志列表管理</legend>
<!--			<div class="demoTable">
				查询数据的时间范围:
				开始时间-
				<div class="layui-inline">
					<input class="layui-input" name="time2" id="time2" />
				</div>
				结束时间-
				<div class="layui-inline">
					<input class="layui-input" name="writeTime" id="writeTime" />
				</div>
				<button class="layui-btn" id="findGsxyWorkLogBtn">搜索</button>-->
			</div>
			<!--描述：文件夹列表 -->
			<table id="findGsxyWorkLog" lay-filter="tableId"></table>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<!--	<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail" id="detail">预览</a>-->
				<a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">查看</a>
				<!--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</a>-->
			</div>
		</fieldset>
 		</body>
		<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
		<script>
			
		layui.use('table', function() {

			//毕业生table
			var table = layui.table;
			//毕业生table
			var tableIns = table.render({
				elem: '#findGsxyWorkLog',
				method: 'post',
				url: '/GsxyWorkLogController/findGsxyWorkLog',
				width: 1000
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						},{
							field: 'writeTime',
							title: '日志写入时间',
							width: 248
						}, {
							field: 'deptName',
							title: '部门',
							width: 248
						},{
							field: 'workName',
							title: '姓名',
							width: 248
						},{
							fixed: 'right',
							title: '操作',
							toolbar: '#barDemo',
							width: 248,
							align: 'center'
						}
					]
				],
				skin: 'row',
				even: true,
				page: true,
				limits: [10, 20, 30],
				limit: 10,
				id: 'tableId' //ID
					,
				where: {
					userId: $("#userId").val(),
					workLogStatus:'1'
				} //如果无需传递额外参数，可不加该参数
				,
				done: function(res, curr, count) {

					//监听表格复选框选择
					table.on('checkbox(tableId)', function(obj) {
						if(obj.checked) {
							$("#deleteGsxyWorkLog").show();
						} else {
							$("#deleteGsxyWorkLog").hide();
						}

					});

					//监听工具条
					table.on('tool(tableId)', function(obj) {

						var data = obj.data;
						if(obj.event === 'del') {
							layer.confirm('真的删除这一篇日志吗?', function(index) {

								$.ajax({
									type: "post",
									url: "/GsxyWorkLogController/updateWorkLogStatus",
									data: {
										workLogId: data.workLogId
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteGsxyWorkLog").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({
												where: {
													userId: $("#userId").val()
												}
											});

										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							//window.location.href = "GsxyWorkLogFrom.jsp?workLogId=" + data.workLogId;
							location.href="http://www.hngsxy.com/notH5/xt/mt/p192.html?workLogId="+data.workLogId;
						} else if(obj.event === 'shenhe') {}
					});
				}

			});

			//模糊查询文件夹  findStudentIdCardVal
			$("#findGsxyWorkLogBtn").on("click", function() {
				$("#deleteGsxyWorkLog").hide();
				//刷新也可以用
				tableIns.reload({
					where: {
						userId:$("#userId").val(),
						writeTime:$("#writeTime").val(),
						time2:$("#time2").val()
					} //如果无需传递额外参数，可不加该参数

				});
			});

			//批量删除学生
			$("#deleteGsxyWorkLog").on("click", function() {
				var checkStatus = table.checkStatus('tableId'),
					data = checkStatus.data;

				var temp = "";
				$.each(data, function(i, n) {
					//alert(“索引:”+i,”对应值为：”+n.name);
					temp += n.workLogId + ",";
				});
				//console.log(temp)
				$.ajax({
					type: "post",
					url: "/GsxyWorkLogController/updateGsxyWorkLogState",
					data: {
						"workLogIds": temp
					},
					async: true,
					//timeout:1200,
					success: function(data) {
						if(data > 0) {
							//刷新
							tableIns.reload({
								where: {
									userId: $("#userId").val()
								}
							});

							layer.msg("删除了" + data + "条数据");
							$("#deleteGsxyWorkLog").hide();
						} else {
							layer.msg("删除失败或没有勾选");
						}
					}
				});

			});

		});
		</script>
</html>