<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<title>阳光新闻编辑</title>
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
			
			.inputlength {
				width: 1024px;
			}
		</style>
	</head>

	<body>
		<input type="hidden" value="${sessionScope.activeUser.userName}" id="userName" />
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />

		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">阳光新闻编辑</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<button class="layui-btn layui-btn-warm" id="Return">
				<i class="layui-icon">&#x1006;</i> 返回上一级
			</button>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>编辑板</legend>
			<form class="layui-form layui-form-pane1" action="" id="insertNews">
				<div class="layui-form-item">
					<label class="layui-form-label">文章标题:</label>
					<div class="layui-input-block">
						<input type="text" id="newsTitle" name="newsTitle" lay-verify="required|title" required placeholder="请输入标题" autocomplete="off" class="layui-input inputlength">
					</div>
				</div>

				<div class="layui-form-item" style="width:100%;">

					<div class="layui-input-block" style="width:100%;">
						<script id="editor" name="newsContext" type="text/plain" style="width:1024px;height:500px;">

						</script>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新闻类型:</label>
					<div class="layui-input-inline">
						<select id="newType" name="newType" lay-filter="aihao" lay-search lay-verify="required">
							<option value=""></option>
						<!--<c:if test="${activeUser.departments!=null }">
								<c:forEach items="${activeUser.departments}" var="department">
										${department.permissionUrl}"
								</c:forEach>
							</c:if>-->
							<option value="SGFW0">信息公开</option>
							<option value="SGFW1">办事指南</option>
							<option value="SGFW2">常见问题</option>
							<option value="SGFW3">热点问题</option>
							<option value="SGFW4">图片新闻</option>
							<option value="SGFW5">阳光咨询</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>

			</form>
		</fieldset>
		<!--<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>-->
		<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.10.2.js" type="text/javascript"></script>
		
		<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
		<script type="text/javascript">
			var userName = $("#userName").val();
			var userId = $("#userId").val();

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
			//	var newsId1 = v['newsId'];
			}
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

			$(function() {
				//查询的方法
//				if(newsId1 != null) {
//					//查询一个新闻信息
//					$.ajax({
//						type: "post",
//						//url: "<%=request.getContextPath()%>/anon/findGsxySunshineServiceNewsOne",
//						data: {
//							"newsId": newsId1
//						},
//						async: true,
//						dateType: "json",
//						//timeout:12000,
//						success: function(data) {
//
//							$("#newsTitle").val(data.newsTitle);
//							$("#newType").val(data.newType);
//
//						}
//					})
//
//				}

				$("#Return").on("click", function() {
					var url = "sunshine_service_news.jsp";
					window.location.href = url;
				});

			});

			layui.use('form', function() {
				var form = layui.form;

				//自定义验证规则
				form.verify({
					title: function(value) {
						if(value.length < 3) {
							return '标题也太短了吧';
						}
					},
					pass: [/(.+){6,12}$/, '密码必须6到12位']
				});

				//事件监听
				form.on('select', function(data) {
					// console.log(this);
				})

				form.on('select(aihao)', function(data) {
					// console.log(data);
				});

				form.on('checkbox', function(data) {
					// console.log(this.checked, data.elem.checked);
				});

				form.on('switch', function(data) {
					// console.log(data);
				});

				form.on('radio', function(data) {
					// console.log(data);
				});

				//监听提交 这个方法修改 可以添加
				form.on('submit(*)', function(data) {

					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/SunshineServiceController/insertGsxySunshineServiceNews",
						data: {
							userId: userId,
							//newsId: newsId1,
							newsTitle: data.field.newsTitle,
							newsReleaseUser: userName,
							newType: data.field.newType,
							newsContext: data.field.newsContext,
							newTypeText:$("#newType").text()
							//newsAuditStatus:newTypeTemp
						},
						dateType: "json",
						async: false,
						success: function(data) {
							if(data > 1) {
								window.history.back();
								
							}
//							window.history.go(-1);
//							var url = "newRelease.jsp";
//							window.location.href = url;
							return true;
						}
					});
				});

			});
		</script>
	</body>

</html>