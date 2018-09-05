<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.3.0/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
		<title>英语考试管理</title>
		<style>

		</style>
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">英语考试管理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<div class="layui-upload">
				<button class="layui-btn layui-btn-normal" id="gsxy_zs_major">
						<i class="layui-icon"></i>证书专业管理
				</button>
				<button class="layui-btn layui-btn-primary" id="gsxy_zs_factions">
						<i class="layui-icon"></i>系别管理
				</button>
				<button class="layui-btn layui-btn-primary" id="gsxy_zs_semester">
						<i class="layui-icon"></i>学期管理
				</button>
				<button class="layui-btn layui-btn-warm" id="export">导出Excel</button>
				<button type="button" class="layui-btn layui-btn-normal" id="test6">导入Excel</button>
				<button type="button" class="layui-btn" id="test7">开始上传</button>
				<button class="layui-btn layui-btn-danger" id="deleteBatch" style="display: none;">
						<i class="layui-icon"></i>批量删除
				</button>
			</div>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>英语考试管理</legend>
			身份证查询：
			<div class="layui-inline">
				<input class="layui-input" id="idcard" />
			</div>
			<div class="layui-inline">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">考期:</label>
						<div class="layui-input-block">
							<select id="examination" name="examination" lay-verify="required" lay-filter="examination">

							</select>
						</div>
					</div>
				</form>
			</div>
			<button class="layui-btn" id="findBKXX">搜索</button>

			<!--描述：文件夹列表 -->
			<table id="wskximgNameManage" lay-filter="wskximgNameManage"></table>
			<script type="text/html" id="examinationStatusTpl">
				{{# if(d.examinationStatus == '1'){ }}
				<span style="color: #0000CC;">审核中</span> {{# }else if(d.examinationStatus == '2'){ }}
				<span style="color: #ff0000;">审核没通过</span> {{# }else if(d.examinationStatus == '3'){ }}
				<span style="color: #336600;">审核通过</span> {{# } }}
			</script>
			<script type="text/html" id="wskximgTypeTpl">
				{{# if(d.studentsex == '1'){ }}
				<span style="color: #0000CC;">男</span> {{# }else if(d.studentsex == '2'){ }}
				<span style="color: #AF0000;">女</span> {{# } }}
			</script>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
				<a class="layui-btn layui-btn-xs" lay-event="fail" id="fail">没通过审核</a>
				<a class="layui-btn layui-btn-xs" lay-event="adopt" id="adopt">通过审核</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</a>

			</div>

		</fieldset>

	</body>
	<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="/r3/layui-v2.3.0/layui/layui.js"></script>
	<script>
		$("#gsxy_zs_major").on("click", function() {
			location.href = "/pages/zhenshu/gsxy_zs_major.jsp";
		});
		$("#gsxy_zs_factions").on("click", function() {
			location.href = "/pages/EnglishTest/factionsmanage.jsp";
		});
		$("#gsxy_zs_semester").on("click", function() {
			location.href = "/pages/EnglishTest/EnglishTestSemester.jsp";
		});

		layui.use(['table', 'form'], function() {
			var table = layui.table,
				form = layui.form;
			var examination = '';
			//方法级渲染
			var tableIns = table.render({
				elem: '#wskximgNameManage',
				method: 'post',
				url: '/EnglishTestController/findEnglishExamination',
				width: 1000
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						}, {
							field: 'examinationStatus',
							title: '审核状态',
							templet: '#examinationStatusTpl',
							width: 100
						}, {
							field: 'idcard',
							title: '身份证',
							width: 200
						}, {
							field: 'examination',
							title: '考期',
							width: 100
						}, {
							field: 'studentName',
							title: '学生姓名',
							width: 100
						}, {
							field: 'college',
							title: '学院',
							width: 100
						}, {
							field: 'campus',
							title: '校区',
							width: 100
						}, {
							field: 'factions',
							title: '系别',
							width: 200
						}, {
							field: 'studentsex',
							title: '学生性别',
							templet: '#wskximgTypeTpl',
							width: 100
						}, {
							field: 'classNumber',
							title: '班级',
							width: 100
						}, {
							field: 'schoolNumber',
							title: '学号',
							width: 100
						}, {
							field: 'enrollmentYear',
							title: '入学年份',
							width: 100
						}, {
							field: 'major',
							title: '专业',
							width: 200
						}, {
							field: 'admissionTicket',
							title: '准考证号',
							width: 200
						}, {
							field: 'centreNo',
							title: '考场编号',
							width: 200
						}, {
							field: 'unqualifiedReason',
							title: '不合格原因',
							width: 200
						}, {
							fixed: 'right',
							title: '操作',
							toolbar: '#barDemo',
							width: 300,
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
				, //渲染后的事件
				done: function(res, curr, count) {

					//监听表格复选框选择
					table.on('checkbox(wskximgNameManage)', function(obj) {
						//  console.log(obj.checked); //当前是否选中状态
						if(obj.checked) {
							$("#deleteBatch").show();
						} else {
							$("#deleteBatch").hide();
						}

					});

					//监听工具条
					table.on('tool(wskximgNameManage)', function(obj) {

						var data = obj.data;
						if(obj.event === 'del') {
							layer.confirm('真的删除行么', function(index) {

								$.ajax({
									type: "post",
									url: "/EnglishTestController/updateExaminationStatus",
									data: {
										"id": data.id
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteBatch").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({
												where: {}
											});
										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							//编辑图片信息
							//location.href = 'releaseImg.jsp?wskximgId=' + data.wskximgId;
							location.href = 'EnglishTestUpdata.jsp?id=' + data.id;

						} else if(obj.event === 'fail') {

							location.href = 'EnglishTestFail.jsp?id=' + data.id;

						} else if(obj.event === 'adopt') {
							layer.confirm('真的通过吗', function(index) {

								$.ajax({
									type: "post",
									url: "/EnglishTestController/updateEnglishTestStateByAdopt",
									data: {
										id: data.id,
										unqualifiedReason: data.unqualifiedReason
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteBatch").hide();
											layer.msg("通过成功");
											//刷新
											tableIns.reload({
												where: {}
											});
										}
									}
								});

								layer.close(index);
							});
						}

					});

				}

			});

			//监听提交
			form.on('select(examination)', function(data) {

				examination = data.value;
				//console.log(examination)
				return false;
			});

			$("#deleteBatch").on("click", function() {
				var checkStatus = table.checkStatus('id'),
					data = checkStatus.data;

				var temp = "";
				$.each(data, function(i, n) {
					//alert(“索引:”+i,”对应值为：”+n.name);
					temp += n.id + ",";
				});
				//	console.log(temp)
				$.ajax({
					type: "post",
					url: "/EnglishTestController/updateEnglishTestState",
					data: {
						"ids": temp
					},
					async: true,
					//timeout:1200,
					success: function(data) {
						if(data > 0) {
							//刷新
							$("#deleteBatch").hide();
							layer.msg("删除了" + data + "条数据");
							tableIns.reload({
								where: {}
							});
						} else {
							layer.msg("删除失败或没有勾选");
						}
					}
				});

			});

			//模糊查询
			$("#findBKXX").on("click", function() {
				var idcard = $("#idcard").val();

				//$("#deleteBatch").hide();
				//刷新也可以用
				tableIns.reload({
					where: {
						idcard: idcard,
						examination: examination
					} //如果无需传递额外参数，可不加该参数

				});
			});

			$("#deleteBatch").on("click", function() {
				var checkStatus = table.checkStatus('id'),
					data = checkStatus.data;

				var temp = "";
				$.each(data, function(i, n) {
					//alert(“索引:”+i,”对应值为：”+n.name);
					temp += n.id + ",";
				});
				//	console.log(temp)
				$.ajax({
					type: "post",
					url: "/EnglishTestController/updateEnglishTestState",
					data: {
						"ids": temp
					},
					async: true,
					//timeout:1200,
					success: function(data) {
						if(data > 0) {
							//刷新
							$("#deleteBatch").hide();
							layer.msg("删除了" + data + "条数据");
							tableIns.reload({
								where: {}
							});
						} else {
							layer.msg("删除失败或没有勾选");
						}
					}
				});

			});

			//导出Excel
			$("#export").on("click", function() {
				var url = '/EnglishTestController/export?examination=' + examination;
				window.location.href = url;
			});

		});

		$.ajax({
			type: "post",
			url: "/anon/selectSemesterByTow",
			data: {},
			async: false,
			//timeout:12000,
			success: function(data) {
				//console.log(data)
				var List = [];
				for(var a = 0; a < data.length; a++) {
					List.push('<option value="' + data[a].name + '">' + data[a].name + '</option>');
				}
				$("#examination").append(List);
			}
		});

		layui.use('upload', function() {
			var upload = layui.upload;

			//执行实例
			upload.render({
				elem: '#test6',
				url: '/EnglishTestController/updateAdmissionTicket',
				auto: false,
				method: 'post',
				field: 'myfile'
					//,multiple: true
					,
				accept: 'file',
				bindAction: '#test7',
				data: {} //一同上传的数据
				,
				done: function(res) {
					layer.msg("上传成功");
					//console.log(res.result)
				}
			});

		});
	</script>

</html>