<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<title>学生录取审核</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.2.5/layui/css/layui.css" />
		<style>
			body {
				margin: 0px;
			}
		</style>
    </head>
    <body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">学生录取审核</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">

			<!--	<i class="layui-icon">&#xe608;</i> 上传文件
				 <input class="layui-btn" id="file1" type="file" name="myfile" value="上传文件">-->
			<div class="layui-upload">
				<!--				<button type="button" class="layui-btn layui-btn-normal" id="test6">选择文件</button>
				<button type="button" class="layui-btn" id="test7">开始上传</button>
				<button class="layui-btn layui-btn-danger" id="deleteFile">
						<i class="layui-icon">&#x1006;</i> 批量删除文件
				  </button>-->
				<button class="layui-btn" id="studentSystem1">
					<!--<i class="layui-icon"></i>-->毕业生录入系统
				</button>
				<button class="layui-btn layui-btn-warm" id="studentSystem2">
					<!--<i class="layui-icon"></i>-->毕业生列表
				</button>
				<button class="layui-btn layui-btn-normal" id="studentSystem3">
					<!--<i class="layui-icon"></i>-->报名学生列表
				</button>
				<button class="layui-btn layui-btn-danger" id="deleteBatchStudent">
					<!--<i class="layui-icon"></i>-->毕业生批量删除
				</button>

			</div>

			<!--			<a href="javascript:;" class="layui-btn layui-btn-small" id="">
				<button id="UploadFileBut" type="button" class="btn btn-default" data-dismiss="modal">添加文件</button>
			</a>-->

		</blockquote>
		
		
		
		
		
		
 	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.2.5/layui/layui.js"></script>
	<script>
		
	</script>
</html>