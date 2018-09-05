<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>阳光服务审理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
		<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/r3/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/r3/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.all.js"></script>
		<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/r3/ueditor1_4_3_3-utf8-jsp/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
		<style>
			body {
				margin: 0px;
			}
		</style>
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">阳光服务信息审理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<button class="layui-btn layui-btn-warm" id="Return">
				<i class="layui-icon">&#x1006;</i> 返回上一级
			</button>
		</blockquote>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">阳光服务信息</a>
			</legend>
			<table class="layui-table" style="width: 900px; margin: auto;">
				<tbody>
					<tr>
						<td style="width: 15%;">编号:</td>
						<td id="sunshineNumber" style="width: 35%;"></td>
						<td style="width: 15%;">来信人：</td>
						<td id="sunshineName" style="width: 35%;"></td>
					</tr>
					<tr>
						<td style="width: 15%;">来信时间：</td>
						<td id="sunshineLetterTime" style="width: 35%;"></td>
						<td style="width: 15%;">服务类型：</td>
						<td id="sunshineCategory" style="width: 35%;"></td>
					</tr>
					<tr>
						<td style="width: 15%;">受理单位：</td>
						<td id="sunshineAdmissible" style="width: 35%;"></td>
						<td style="width: 15%;">办理状态：</td>
						<td style="width: 35%;"><span id="sunshineState"></span></td>
					</tr>
					<tr>
						<td style="width: 15%;">来信主题：</td>
						<td id="sunshineTitle" style="width: 85%;" colspan="3"></td>
					</tr>
					<tr>
						<td style="width: 15%;">来信内容：</td>
						<td id="sunshineContent" style="width: 85%;" colspan="3"></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">阳光服务回文</a>
			</legend>
			<form class="layui-form" action="">
				<div class="layui-form-item layui-form-text">
					<div class="layui-input-block">
						<script id="editor" name="sunshineResults" type="text/plain" style="width:1024px;height:500px;">
						</script>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
						<!--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
					</div>
				</div>
			</form>
		</fieldset>

	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
	<script>
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor', {
			toolbars: [
				[
					'fullscreen', 'source', '|', 'undo', 'redo', '|',
					'bold', 'italic', 'underline', 'fontborder', 'strikethrough',
					'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset',
					'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist',
					'insertunorderedlist', 'selectall', 'cleardoc', '|',
					'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
					'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
					'directionalityltr', 'directionalityrtl', 'indent', '|',
					'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
					'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
					'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map',
					'insertframe', 'insertcode', 'pagebreak', 'template', 'background', '|',
					'horizontal', 'date', 'time', 'spechars', 'wordimage', '|',
					'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow',
					'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells',
					'splittorows', 'splittocols', 'charts', '|',
					'print', 'preview', 'searchreplace', 'drafts', 'help'
				]
			]

		});

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
			var sunshineId = v['sunshineId'];
		}

		//查询
		function findSunshineServiceOne() {
			//查询的方法
			if(sunshineId != null) {
				//查询一个新闻信息
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/SunshineServiceController/findSunshineServiceOne",
					data: {
						sunshineId: sunshineId
					},
					async: false,
					dateType: "json",
					//timeout:12000,
					success: function(data) {
						//console.log(data);
						$("#sunshineNumber").text(data.sunshineNumber);
						$("#sunshineName").text(data.sunshineName);
						$("#sunshineLetterTime").text(data.sunshineLetterTime.substring(0, 10));

						if(data.sunshineCategory == '1') {
							$("#sunshineCategory").text('热点咨询');
						} else if(data.sunshineCategory == '2') {
							$("#sunshineCategory").text('学生/家长');
						} else if(data.sunshineCategory == '3') {
							$("#sunshineCategory").text('教师');
						} else if(data.sunshineCategory == '4') {
							$("#sunshineCategory").text('教育机构');
						} else if(data.sunshineCategory == '5') {
							$("#sunshineCategory").text('社会人员');
						} else if(data.sunshineCategory == '6') {
							$("#sunshineCategory").text('教育收费');
						} else if(data.sunshineCategory == '7') {
							$("#sunshineCategory").text('师德师风');
						} else if(data.sunshineCategory == '8') {
							$("#sunshineCategory").text('教师权益');
						} else if(data.sunshineCategory == '9') {
							$("#sunshineCategory").text('学生权益');
						} else if(data.sunshineCategory == '10') {
							$("#sunshineCategory").text('校园安全');
						} else if(data.sunshineCategory == '11') {
							$("#sunshineCategory").text('教育培训');
						} else if(data.sunshineCategory == '12') {
							$("#sunshineCategory").text('教学管理');
						} else if(data.sunshineCategory == '13') {
							$("#sunshineCategory").text('后勤服务');
						} else if(data.sunshineCategory == '14') {
							$("#sunshineCategory").text('服务质量');
						} else if(data.sunshineCategory == '15') {
							$("#sunshineCategory").text('其他');
						} else if(data.sunshineCategory == '16') {
							$("#sunshineCategory").text('群众表扬');
						} else if(data.sunshineCategory == '17') {
							$("#sunshineCategory").text('群众建议');
						} else if(data.sunshineCategory == '18') {
							$("#sunshineCategory").text('高等学校');
						} else if(data.sunshineCategory == '19') {
							$("#sunshineCategory").text('社会公众或机构');
						}

						//回文单位
						$("#sunshineAdmissible").text('湖南省工商职业学院');
						if(data.sunshineState == '0') {
							$("#sunshineState").text('等待办理');
							$("#sunshineState").css('color', 'red');
						}
						if(data.sunshineState == '1') {
							$("#sunshineState").text('已办理');
							$("#sunshineState").css('color', '#009900');
						}
						if(data.sunshineState == '2') {
							$("#sunshineState").text('已结办');
							$("#sunshineState").css('color', '#0066CC');
						}

						$("#sunshineTitle").text(data.sunshineTitle);
						$("#sunshineContent").text(data.sunshineContent);

					}
				})

			}
		}

		$(function() {

			findSunshineServiceOne();

			$("#Return").on("click", function() {
				var url = "sunshine_service_hear.jsp";
				window.location.href = url;
			});

		});

		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				// layer.msg(JSON.stringify(data.field));
				//layer.msg("回文成功");
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/SunshineServiceController/updatePalindromeInformation",
					data: {
						sunshineId: sunshineId,
						sunshineResults: data.field.sunshineResults
					},
					dateType: "json",
					async: true,
					success: function(data) {

						if(data > 0) {
							findSunshineServiceOne();
							layer.msg("回文成功");

						}
					}
				});

				return false;
			});
		});
	</script>

</html>