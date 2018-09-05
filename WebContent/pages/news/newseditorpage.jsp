<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<title>新闻编辑</title>
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
			.layui-form-label {
			    float: left;
			    display: block;
			    padding: 9px 15px;
			    width: 100px;
			    font-weight: 400;
			    text-align: right;
			}
		</style>
	</head>

	<body>
		<!--<input type="hidden" value="${sessionScope.activeUser.userCode}" id="userName" />-->
		<input type="hidden" value="${sessionScope.activeUser.userName}" id="userName" />
		<input type="hidden" value="${sessionScope.activeUser.userId}" id="userId" />

		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">新闻编辑</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<button class="layui-btn layui-btn-warm" id="Return">
				<i class="layui-icon">&#xe65c;</i> 返回上一级
			</button>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>编辑板</legend>
			<form class="layui-form layui-form-pane1" action="" id="insertNews">
				<div class="layui-form-item">
					<label class="layui-form-label">文章标题：</label>
					<div class="layui-input-block">
						<input type="text" id="newsTitle" name="newsTitle" lay-verify="required|title" required placeholder="请输入标题" autocomplete="off" class="layui-input" style="width: 800px;">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">文章作者：</label>
					<div class="layui-input-block">
						<input type="text" id="newsAuthor" name="newsAuthor" lay-verify="required" required placeholder="请输入作者" autocomplete="off" class="layui-input" style="width: 300px;">
					</div>
				</div>
				<div class="layui-form-item" style="width:1024px;">
					<div class="layui-input-block" style="width:1024px;">
						<script id="editor" name="newsContext" type="text/plain" style="width:1024px;height:500px;"></script>
					</div>
				</div>
				<div class="layui-form-item" style="float: left;">
					<label class="layui-form-label">新闻类型：</label>
					<div class="layui-input-inline">
						<select id="newType" name="newType" lay-filter="aihao" lay-search lay-verify="required">
							<option value=""></option>
							<c:if test="${activeUser.departments!=null }">
								<c:forEach items="${activeUser.departments}" var="department">
										${department.permissionUrl}"
								</c:forEach>
							</c:if>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">文章发送部门：</label>
					<div class="layui-input-inline">
						<input type="text" id="newsPush" name="newsPush" lay-verify="required" value="本站整理" required placeholder="请输入发送部门" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-input-inline">
						<select id="deptSelect" lay-filter="filter" lay-search lay-verify="required">
							<option value="本站整理">本站整理</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">发布日期：</label>
					<div class="layui-input-block">
						<input type="text" id="newsReleaseTime" name="newsReleaseTime" lay-verify="required" required placeholder="请输入日期" autocomplete="off" class="layui-input" style="width: 300px;">
					</div>
				</div>
				<div class="layui-form-item" id="newsHyperlink" style="display: none;">
					<label class="layui-form-label">超链接：</label>
					<div class="layui-input-block">
						<input type="text" id="newsHyperlink1" value="1" name="newsHyperlink" lay-verify="" placeholder="请输入超链接" autocomplete="off" class="layui-input" style="width: 800px;">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button id="submitNews" class="layui-btn" lay-submit lay-filter="*">立即提交</button>
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
			//$("#tempppp").hide();
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
				var newsId1 = v['newsId'];
				/*var temp01 = v['temp01'];*/
				//console.log(temp01) 1:发送 2：编辑

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
//				,
// 				iframeCssUrl: 'r3/ueditor1_4_3_3-utf8-jsp/utf8-jsp/themes/iframe.css'// 引入css
//			    autoHeightEnabled: true,//???
//			    autoFloatEnabled: true//???
			});
			
			layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  var date01 = new Date();
			  
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#newsReleaseTime' //指定元素
			    ,format: 'yyyy-MM-dd HH:mm:ss' //可任意组合
			     ,value: date01
			  });
			});

			$(function() {
//--------------------
				$("#Return").on("click", function() {
					var url = "newRelease.jsp";
					window.location.href = url;
				});
//--------------------
				//查询的方法
				if(newsId1 != null) {
					//查询一个新闻信息
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/anon/selectOneNews",
						data: {
							"newsId": newsId1
						},
						async: true,
						dateType: "json",
						//timeout:12000,
						success: function(data) {

							$("#newsTitle").val(data.newsTitle);
							$("#newType").val(data.newType);
							
							setTimeout(function(){
								$("#newsReleaseTime").val(data.newsReleaseTime);
							},666);
							
							
							$("#newsAuthor").val(data.newsAuthor);
							$("#newsPush").val(data.newsPush);
							$("#newsHyperlink1").val(data.newsHyperlink);
							//玄学.....
							setTimeout(function(){
								ue.setContent(data.newsContext,false);
							},666);
						}
					})

				}
//--------------------
				//查询部门
				//function findDeptUserMoveDept(){
					//查询所有部门用于人员调度
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/UserManagemenController/findDeptUserMoveDept",
						async: false,
						success: function(data) {
							//console.log(data)
							var deptList = [];
							for(var a = 0; a < data.length; a++) {
								deptList.push('<option value="' + data[a].dname + '">' + data[a].dname + '</option>');
							}
							$("#deptSelect").append(deptList);
						}
					});
				//}
//--------------------
			});

			layui.use('form', function() {
				var form = layui.form;
				var newsAuditStatusTemp = '1';
				//自定义验证规则
				form.verify({
					title: function(value) {
						if(value.length < 3) {
							return '标题也太短了吧';
						}
					},
					pass: [/(.+){6,12}$/, '密码必须6到12位']
				});
				
				
				form.on('select(filter)', function(data){
						//console.log(data.value);
					$("#newsPush").val(data.value);

				});  

				//
				form.on('select(aihao)', function(data){
						//console.log(data.value);
					 if(data.value == 'DZBGS13'){
					 		$("#newsHyperlink").show();
					 }

				});  

				//监听提交 这个方法修改 可以添加
				form.on('submit(*)', function(data) {
						$("#submitNews").hide();

//						var newsAuditStatusTemp = '1';
//						if(
//						data.field.newType=='0' ||data.field.newType=='1' ||data.field.newType=='2' ||
//						data.field.newType=='50' ||data.field.newType=='51' ||data.field.newType=='52' ||
//						data.field.newType=='53' ||data.field.newType=='54' ||data.field.newType=='55' ||
//						data.field.newType=='DZBGS1'||data.field.newType=='DZBGS2'||data.field.newType=='DZBGS3'||
//						data.field.newType=='DZBGS4'||data.field.newType=='DZBGS5'||data.field.newType=='DZBGS6'||
//						data.field.newType=='DZBGS7'||data.field.newType=='DZBGS8'||data.field.newType=='DZBGS9'||
//						data.field.newType=='DZBGS10'||data.field.newType=='DZBGS11'||data.field.newType=='DZBGS12'||data.field.newType=='DZBGS13'
//						){
//						 
//						}else{
//						 	newsAuditStatusTemp = '2'
//						}

					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/NewsController/insertNews",
						data: {
							userId: userId,
							newsId: newsId1,
							newsTitle: data.field.newsTitle,
							newsReleaseUser: userName,
							newType: data.field.newType,
							newsContext: data.field.newsContext,
							newTypeText:$("#newType").text(),
							newsAuditStatus:newsAuditStatusTemp,
							newsReleaseTime:data.field.newsReleaseTime,
							newsAuthor:data.field.newsAuthor,
							newsPush:data.field.newsPush,
							newsHyperlink:data.field.newsHyperlink
						},
						dateType: "json",
						async: false,
						success: function(data) {
							$("#submitNews").show();
							if(data > 1) {

							}

						}
					});
				});

			});
		</script>
	</body>

</html>