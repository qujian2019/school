<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<link rel="shortcut icon" href="http://www.hngsxy.com/r3/imgs/sign/bitbug_favicon.ico" />
		<title>网上看校图片发布</title>
	</head>

	<body>
		<input type="hidden" id="Picture" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">网上看校图片发布</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<div class="layui-upload">
				<button class="layui-btn layui-btn-warm" id="Return">
						<i class="layui-icon">&#xe65c;</i>返回图片列表
				</button>
			</div>
		</blockquote>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">编辑面板</a>
			</legend>
			<form class="layui-form" action="" name="formStudent">
				<div class="layui-form-item">
					<label class="layui-form-label">图片名称:</label>
					<div class="layui-input-block">
						<input type="text" id="wskximgName" name="wskximgName" required lay-verify="required" placeholder="请输入图片名称" autocomplete="off" class="layui-input" style="width: 300px;">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">发布日期:</label>
					<div class="layui-input-block">
						<input type="text" id="wskximgTime" name="wskximgTime" lay-verify="required" required placeholder="请输入日期" autocomplete="off" class="layui-input" style="width: 300px;">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">图片类型:</label>
					<div class="layui-input-block" style="width: 300px;">
						<select name="wskximgType" lay-verify="required" id="wskximgType">
							<option value=""></option>
							<option value="xyfj">学校风景</option>
							<option value="shss">生活设施</option>
							<option value="sxsx">实习实训</option>
							<option value="tyss">体育设施</option>
							<option value="xywh">校园文化</option>
							<option value="xqhz">校企合作</option>
						</select>
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

			if(v != null) {
				var wskximgId = v['wskximgId'];

			}

		
		$("#Return").on("click", function() {
			location.href = 'GsxyWskxImg.jsp';
		});

		layui.use('laydate', function() {
			var laydate = layui.laydate;

			var date01 = new Date();

			//执行一个laydate实例
			laydate.render({
				elem: '#wskximgTime' //指定元素
					,
				format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
					,
				value: date01
			});
		});

		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {

				$.ajax({
					type: "post",
					url: "/GsxyWskxImgController/insertGsxyWskxImg",
					data: {
						wskximgId:wskximgId,
						wskximgName: data.field.wskximgName,
						wskximgUrl: $("#Picture").val(),
						wskximgTime: data.field.wskximgTime,
						wskximgType: data.field.wskximgType
					},
					async: true,
					//timeout:12000,
					success: function(data) {
						if(data > 0) {
							layer.msg("图片添加成功");
							var f3 = document.forms['formStudent'];
							f3.reset();
							//$('#studentImg').attr('src', '');

						} else {
							layer.msg("未知错误");
						}
					}
				});

				return false;
			});

		});

		//图片上传
		layui.use('upload', function() {
			var $ = layui.jquery,
				upload = layui.upload;
			//field: 'myfile'
			var uploadInst = upload.render({
				elem: '#uploadPhotos',
				url: '/anon/studentUploadPhotos',
				size: 10240 //限制文件大小，单位 KB
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
					$("#Picture").val(res.studentTuPian);
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
		
		$(function(){
					//查询一个图片信息
						$.ajax({
							type: "post",
							url: "/GsxyWskxImgController/findGsxyWskxImgOne",
							data: {
								wskximgId : wskximgId
							},
							async: false,
							//timeout:12000,
							success: function(data) {
								$("#wskximgName").val(data.wskximgName);
								$("#wskximgType").val(data.wskximgType);
								$('#studentImg').attr('src', data.wskximgUrl);
								
								setTimeout(function(){
									//$('#studentImg').attr('src', data.wskximgUrl);
									$("#wskximgTime").val(data.wskximgTime);
								},666)
							}
						});
				
		})
		
	</script>

</html>