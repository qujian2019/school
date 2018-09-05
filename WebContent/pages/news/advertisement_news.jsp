<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>招生网浮游广告</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<style>
			body {
				margin: 0px;
			}
			
			.layui-input,
			.layui-textarea {
				display: block;
				width: 300px;
				padding-left: 10px;
			}
			
			.layui-form-label {
				float: left;
				display: block;
				padding: 9px 15px;
				width: 90px;
				font-weight: 400;
				line-height: 20px;
				text-align: right;
			}
		</style>
	</head>

	<body>
		<input type="hidden" value="" id="advertisementTemp" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">招生网浮游广告</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<shiro:hasPermission name="zsw:all">
				<button class="layui-btn layui-btn-warm" id="Return">
					<i class="layui-icon">&#xe65c;</i> 返回上一级
				</button>
			</shiro:hasPermission>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>招生网浮游广告操作</legend>
			<blockquote class="layui-elem-quote layui-quote-nm">
				当前浮游新闻：<span id="fycText"></span>
			</blockquote>
			<hr class="layui-bg-red">
			<form class="layui-form" action="#" name="formStudent">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
				<div class="layui-form-item">
					<span id="temp01"></span>
				</div>
			</form>

		</fieldset>
	</body>
	<script src="../../r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="../../r3/layui-v2.2.5/layui/layui.js"></script>
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
			var newsId = v['newsId'];
			//console.log(newsId)
		}

		//var advertisementTemp = 9;

		//处理浮游广告信息
		layui.use('form', function() {
			var formDemo = layui.form;
			//监听提交
			formDemo.on('submit(formDemo)', function(data) {
				// layer.msg(JSON.stringify(data.field));   $("#studentPicture").val()

				$.ajax({
					type: "post",
					url: "/NewsController/updateNewsAdvertisement",
					data: {
						newsId: newsId
						//newsAdvertisementText:data.field.newsAdvertisementText
					},
					async: true,
					//timeout:12000,
					success: function(data3) {
						if(data3 > 0) {
							findyuyouchuan();
							layer.msg('操作完成');
						} else {
							layer.msg('操作失败');
						}
					}
				});
				// return true;
			});

			formDemo.verify({
				advertisementText: function(value, item) { //value：表单的值、item：表单的DOM对象
						if(value.length < 1) {
							return '名字也太短了吧';
						}
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
				pass: [
					/^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格'
				],
				title: function(value) {
					if(value.length < 5) {
						return '标题至少得5个字符啊';
					}
				},
				content: function(value) {
					layedit.sync(editIndex);
				}
			});
		});

		function findyuyouchuan() {

			$.ajax({
				type: "get",
				url: "/anon/findAdvertisement",
				data: {

				},
				async: true,
				//timeout:12000,
				success: function(data) {

					$("#fycText").text(data.newsTitle);

				}
			});

		}

		$(function() {

			setTimeout(function() {
				findyuyouchuan();
			}, 666);

			$("#Return").on("click", function() {
				var url = '/pages/news/newRelease.jsp';
				window.location.href = url;
			});

		})
	</script>

</html>