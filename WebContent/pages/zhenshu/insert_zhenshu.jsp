<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://124.228.83.236/r3/imgs/sign/bitbug_favicon.ico" />
		<title>添加证书</title>
		<style>

		</style>
	</head>

	<body>
		<input type="hidden" id="studentPicture" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">新增学生证书</a>
			</legend>
		</fieldset>
		<fieldset class="layui-elem-field" style="width: 600px; padding: 10px;">
			<legend>学生表单</legend>

			<form class="layui-form" action="">
				<div class="layui-form-item">
					<label class="layui-form-label">证件号码</label>
					<div class="layui-input-block">
						<input type="text" id="title" name="title" required lay-verify="required" placeholder="证件号码" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">学生姓名</label>
					<div class="layui-input-block">
						<input type="text" id="content" name="content" required lay-verify="required" placeholder="学生姓名" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证</label>
					<div class="layui-input-block">
						<input type="text" id="idcard" name="idcard" required lay-verify="required" placeholder="身份证" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">添加时间</label>
					<div class="layui-input-block">
						<input type="text" id="adddate" name="adddate" lay-verify="required" required placeholder="添加时间" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">毕业时间</label>
					<div class="layui-input-block">
						<input type="text" id="data" name="data" lay-verify="required" required placeholder="毕业时间" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">生日</label>
					<div class="layui-input-block">
						<input type="text" id="birthday" name="birthday" lay-verify="required" required placeholder="生日" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">选择专业</label>
					<div class="layui-input-block">
						<select id="classid" name="classid" lay-verify="required">
							<option value=""></option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">
						<input type="radio" id="sex1" name="sex" value="1" title="男">
						<input type="radio" id="sex2" name="sex" value="2" title="女" checked>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">上传照片:</label>
					<div class="layui-input-block">
						<div class="layui-upload">
							<button type="button" class="layui-btn" id="uploadPhotos">上传照片</button>
							<div class="layui-upload-list">
								<img class="layui-upload-img" src="" id="studentImg">
								<p id="demoText"></p>
							</div>
						</div>
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
			var id = v['id'];
			//console.log(id)

		}

		//Demo
		layui.use('form', function() {
			var form = layui.form;
			//监听提交
			form.on('submit(formDemo)', function(data) {

				//layer.msg(JSON.stringify(data.field.sex));
				//console.log(data.field.sex)

				$.ajax({
					type: "post",
					url: "/ZheShuController/insertZheShu",
					data: {
						id: id,
						title: data.field.title,
						pic: $("#studentPicture").val(),
						content: data.field.content,
						classid: data.field.classid,
						adddate: data.field.adddate,
						idcard: data.field.idcard,
						data: data.field.data,
						sex: data.field.sex,
						birthday: data.field.birthday
					},
					async: true,
					//timeout:12000,
					success: function(data) {
						if(data > 0) {
							layer.msg("添加成功");
							//刷新
							//tableIns.reload({where: {}});
						}
					}
				});

				return false;
			});
		});

		layui.use('laydate', function() {

			var laydate = layui.laydate;

			var date01 = new Date();

			//执行一个laydate实例
			laydate.render({
				elem: '#adddate' //指定元素
					,
				format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
					,
				value: date01
			});
			//执行一个laydate实例
			laydate.render({
				elem: '#data' //指定元素
					,
				format: 'yyyy-MM-dd HH:mm:ss'
			});
			//执行一个laydate实例
			laydate.render({
				elem: '#birthday' //指定元素
					,
				format: 'yyyy-MM-dd HH:mm:ss'
			});

		});

		//图片上传
		layui.use('upload', function() {
			var $ = layui.jquery,
				upload = layui.upload;
			//field: 'myfile'
			var uploadInst = upload.render({
				elem: '#uploadPhotos',
				url: '/ZheShuController/insertZhenshuTuPian',
				size: 500 //限制文件大小，单位 KB
					,
				accept: 'images' //允许上传的文件类型
					,
				field: 'myfile',
				before: function(obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result) {
						$('#studentImg').attr('src', result); //图片链接（base64）
					});
				},
				done: function(res) {
					//console.log(res.studentTuPian);//图片路径
					$("#studentPicture").val(res.studentTuPian);
					//如果上传失败
					if(res.code > 0) {
						return layer.msg('上传失败');
					}
					//上传成功
				},
				error: function() {
					//演示失败状态，并实现重传
					var demoText = $('#demoText');
					demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
					demoText.find('.demo-reload').on('click', function() {
						uploadInst.upload();
					});
				}
			});

		});

		$(function() {
			$.ajax({
				type: "post",
				url: "/ZheShuController/selectMajor",
				data: {},
				async: false,
				//timeout:12000,
				success: function(data) {
	
					var List = [];
					for(var a = 0; a < data.length; a++) {
						List.push('<option value="' + data[a].id + '">' + data[a].title + '</option>');
					}
					$("#classid").append(List);
				}
			});
			if(id == null || id == '' || id == undefined) {} else {
				$.ajax({
					type: "post",
					url: "/ZheShuController/selectZsById",
					data: {
						id: id
					},
					async: false,
					//timeout:12000,
					success: function(data) {
						//console.log(data)
						$("#title").val(data.title);
						$("#content").val(data.content);
						$("#idcard").val(data.idcard);
						$("#adddate").val(data.adddate);
						$("#data").val(data.data);
						$("#birthday").val(data.birthday);
						$("#classid").val(data.classid);
						$("#studentImg").attr('src', data.pic);
						$("#sex1").attr('checked', '');
						$("#sex2").attr('checked', '');
						if(data.sex == '1') {
							$("#sex1").attr('checked', 'checked');
						} else if(data.sex == '2') {
							$("#sex2").attr('checked', 'checked');
						}

					}
				});
			}
		})
	</script>

</html>