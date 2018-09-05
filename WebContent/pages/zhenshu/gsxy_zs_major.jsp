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
			<title>证书专业名称管理</title>
			<style>
					.layui-input, .layui-textarea {
					    display: block;
					    width: 20%;
					    padding-left: 10px;
					}
					.layui-form-label {
					    float: left;
					    display: block;
					    padding: 9px 15px;
					    width: 100px;
					    font-weight: 400;
					    line-height: 20px;
					    text-align: right;
					}
			</style>
    </head>
    <body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">证书专业名称管理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<div class="layui-upload">
<!--				<button class="layui-btn layui-btn-danger" style="display: none;" id="deleteImg">
						<i class="layui-icon">&#x1006;</i> 批量删除文件
			</button>-->
			</div>
		</blockquote>
		
			<form class="layui-form" action="">
			  <div class="layui-form-item">
			    <label class="layui-form-label">输入专业名称:</label>
			    <div class="layui-input-block">
			      <input type="text" name="title" required  lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
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
			<table id="findZhenShuManage" lay-filter="findZhenShuManage"></table>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
					<a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</a>
			</div>

	 	</body>
		<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
		<script>
			
			
			
		//Demo
		layui.use('form', function(){
		  var form = layui.form;
		  
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    //layer.msg(JSON.stringify(data.field));
								$.ajax({
									type: "post",
									url: "/ZheShuController/insertMajor",
									data: {
										title: data.field.title
									},
									async: true,
									//timeout:12000,
									success: function(data) {
										if(data > 0) {
											layer.msg("专业添加成功");
											//刷新
											//tableIns.reload({where: {}});
										}
									}
								});

		    return false;
		  });
		});
			
		layui.use('table', function() {
			var table = layui.table,form = layui.form;

			//方法级渲染
			var tableIns = table.render({
				elem: '#findZhenShuManage',
				method: 'post',
				url: '<%=request.getContextPath()%>/ZheShuController/findZhenShuMajor',
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
							field: 'title',
							title: '专业名称',
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
									url: "/ZheShuController/updateMajorZsMajorStatus",
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
									title: '修改专业名称',
									type: 1,
									offset: 't' //具体配置参考：offset参数项
										,
									content: '<div style="padding: 20px 80px;">' +
										'<div class="layui-form-item">' +
										'<label class="layui-form-label">专业名称:</label>' +
										'<div class="layui-input-block">' +
										'<input type="text" name="title" id="fileRemarks" lay-verify="required|title" required placeholder="请输入专业名称" autocomplete="off" class="layui-input" style="width:100%;">' +
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
											url: "<%=request.getContextPath()%>/ZheShuController/updateMajorZsMajorTitle",
											data: {
												id: data.id,
												title:fileRemarks
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