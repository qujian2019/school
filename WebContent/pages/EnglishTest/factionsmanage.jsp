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
		<title>系别管理</title>
		<style>
			
		</style>
    </head>
    <body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">系别管理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<!--<div class="layui-upload">
				<button class="layui-btn layui-btn-normal" id="gsxy_zs_major">
						<i class="layui-icon"></i>证书专业管理
				</button>
				<button class="layui-btn layui-btn-primary" id="gsxy_zs_factions">
						<i class="layui-icon"></i>系别管理
				</button>
			</div>-->
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>系别管理系统</legend>
			
			<form class="layui-form" action="">
			  <div class="layui-form-item" style="width: 300px;">
			    <label class="layui-form-label">系别名称:</label>
			    <div class="layui-input-block">
			      <input type="text" name="name" required  lay-verify="required" placeholder="输入系别名称" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div>
			</form>
			
			<!--描述：文件夹列表 -->
			<table id="findGsxyFactions" lay-filter="findZhenShuManage"></table>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
					<a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</a>
			</div>

		</fieldset>
    	
 		</body>
		<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="/r3/layui-v2.3.0/layui/layui.js"></script>
		<script>
			
		//Demo
//		layui.use('form', function(){
//		  var form = layui.form;
//		  
//
//		});
			
				$("#gsxy_zs_major").on("click",function(){
					location.href = "/pages/zhenshu/gsxy_zs_major.jsp";
				});
//				$("#gsxy_zs_factions").on("click",function(){
//					location.href = "/pages/EnglishTest/";
//				});
		layui.use(['table','form'], function() {
			var table = layui.table,form = layui.form;

			//方法级渲染
			var tableIns = table.render({
				elem: '#findGsxyFactions',
				method: 'post',
				url: '<%=request.getContextPath()%>/ZheShuController/findGsxyFactions',
				width: 1000
					//,height: 274
					,
				cols: [
					[ //标题栏
//						{
//							checkbox: true,
//							LAY_CHECKED: false
//						},
						{
							field: 'name',
							title: '专业名称',
							width: 200
						},{
							field: 'insertTime',
							title: '信息载入时间',
							width: 200
						},{
							fixed: 'right',
							title: '操作',
							toolbar: '#barDemo',
							width: 200,
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
					table.on('checkbox(findZhenShuManage)', function(obj) {

						//  console.log(obj.checked); //当前是否选中状态

						if(obj.checked) {
							$("#deleteImg").show();
						} else {
							$("#deleteImg").hide();
						}

					});

					//监听工具条
					table.on('tool(findZhenShuManage)', function(obj) {

						var data = obj.data;
						if(obj.event === 'del') {
							layer.confirm('真的删除行么', function(index) {

								$.ajax({
									type: "post",
									url: "/ZheShuController/updateStatus",
									data: {
										id: data.id
									},
									async: true,
									//			timeout:12000,
									success: function(data) {
										if(data > 0) {
											
											layer.msg("删除成功");
											//刷新
											tableIns.reload({where: {}});
										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							//
								var updateFileFolderindex = layer.open({
									title: '修改系别名称',
									type: 1,
									offset: 't' //具体配置参考：offset参数项
										,
									content: '<div style="padding: 20px 80px;">' +
										'<div class="layui-form-item">' +
										'<label class="layui-form-label">系别名称:</label>' +
										'<div class="layui-input-block">' +
										'<input type="text" name="name" id="fileRemarks" lay-verify="required|title" required placeholder="请输入系别名称" autocomplete="off" class="layui-input" style="width:100%;">' +
										'</div>' +
										'</div>' +
										'</div>',
									btn: '确定',
									btnAlign: 'c' //按钮居中
										,
									area: ['500px', '300px'],
									shade: 0 //不显示遮罩
										,
									yes: function() {
										var fileRemarks = $("#fileRemarks").val();
										$.ajax({
											type: "post",
											url: "/ZheShuController/updateFactionsName",
											data: {
												id: data.id,
												name:fileRemarks
											},
											async: true,
											//timeout:12000,
											success: function(data) {
												if(data > 0) {
													layer.msg("修改成功");
													//刷新
													tableIns.reload({where: {}});
												}
											}
										});

										layer.close(updateFileFolderindex);
									}
								});
							
							
						
							
						} else if(obj.event === 'download') {
							
						} else if(obj.event === 'preview') {
						
						}

					});

				}

			});

			$(function(){
				
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    //layer.msg(JSON.stringify(data.field));
								$.ajax({
									type: "post",
									url: "/ZheShuController/insertFactions",
									data: {
										name: data.field.name
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											layer.msg("添加成功");
											//刷新
											tableIns.reload({where: {}});
										}
									}
								});

		    return false;
		  });

				
				var wskximgType = '';
				  //监听提交
				  form.on('select(findZhenShuManage)', function(data){
				   		wskximgType =	data.value;
				    return false;
				  });

					//模糊查询
					$("#findWskximg").on("click", function() {
						var wskximgNameQuery = $("#wskximgNameQuery").val();
						
						//$("#deleteFile").hide();
						//刷新也可以用
						tableIns.reload({
							where: {
								wskximgName: wskximgNameQuery,
								wskximgType: wskximgType
							} //如果无需传递额外参数，可不加该参数

						});
					});
					
				$("#deleteImg").on("click", function() {
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
						//url: "/GsxyWskxImgController/updateGsxyWskxImgStatusBatch",
						data: {
							"wskximgIds": temp
						},
						async: true,
						//			timeout:1200,
						success: function(data) {
							if(data > 0) {
								//刷新
								$("#deleteImg").hide();
								layer.msg("删除了" + data + "条数据");
								tableIns.reload({where: {}});
							} else {
								layer.msg("删除失败或没有勾选");
							}
						}
					});

				});
					
			})


		});
				
		</script>
</html>