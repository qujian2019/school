<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="/r3/layui-v2.2.5/layui/css/layui.css" />
		<!--<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />-->
		<link rel="shortcut icon" href="http://www.hngsxy.com/r3/imgs/sign/bitbug_favicon.ico" />
		<title>网上看校图片管理</title>
	</head>

	<body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">网上看校图片管理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<div class="layui-upload">
				<button class="layui-btn layui-btn-danger" style="display: none;" id="deleteImg">
						<i class="layui-icon">&#x1006;</i> 批量删除文件
				</button>
				<button class="layui-btn" id="Release">
						<i class="layui-icon">&#xe64a;</i> 发布新图片
				</button>
			</div>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>网上看校图片查询</legend>
			<div class="demoTable">
				图片名查询：
				<div class="layui-inline">
					<input class="layui-input" name="wskximgNameQuery" id="wskximgNameQuery" />
				</div>
				<div class="layui-inline" style="top: 6px">
					<form class="layui-form" action="">
					  <div class="layui-form-item">
					    <label class="layui-form-label">图片类型：</label>
					    <div class="layui-input-block">
					      <select name="wskximgType" lay-verify="required" lay-filter="wskximgTypeFilter">
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
					</form>
				</div>
				<button class="layui-btn" id="findWskximg">搜索</button>
			</div>
			<!--描述：文件夹列表 -->
			<table id="wskximgNameManage" lay-filter="wskximgNameManage"></table>
			<script type="text/html" id="wskximgTypeTpl">
				{{# if(d.wskximgType == 'xyfj'){ }}
				<span>校园风景</span> 
				{{# }else if(d.wskximgType == 'shss'){ }}
				<span>生活设施</span> 
				{{# }else if(d.wskximgType == 'sxsx'){ }}
				<span>实习实训</span> 
				{{# }else if(d.wskximgType == 'tyss'){ }}
				<span>体育设施</span> 
				{{# }else if(d.wskximgType == 'xywh'){ }}
				<span>校园文化</span> 
				{{# }else if(d.wskximgType == 'xqhz'){ }}
				<span>校企合作</span> 
				{{# } }}
			</script>
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
				<shiro:hasPermission name="wskx:all">
					<a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</a>
				</shiro:hasPermission>
			</div>
		</fieldset>

	</body>
	<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<!--<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>-->
	<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
	<script>
		
		
		
		
		
		$("#Release").on("click",function(){
			location.href = 'releaseImg.jsp';
		});
		
		layui.use(['table','form'], function() {
			var table = layui.table,form = layui.form;

			//方法级渲染
			var tableIns = table.render({
				elem: '#wskximgNameManage',
				method: 'post',
				url: '<%=request.getContextPath()%>/GsxyWskxImgController/findGsxyWskxImg',
				width: 1000
					//,height: 274
					,
				cols: [
					[ //标题栏
						{
							checkbox: true,
							LAY_CHECKED: false
						}, {
							field: 'wskximgName',
							title: '图片名称',
							width: 290
						}, {
							field: 'wskximgTime',
							title: '图片创建时间',
							width: 200
						}, {
							field: 'wskximgType',
							title: '图片类型',
							templet: '#wskximgTypeTpl',
							width: 200
						}, {
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
					table.on('checkbox(wskximgNameManage)', function(obj) {

						//  console.log(obj.checked); //当前是否选中状态

						if(obj.checked) {
							$("#deleteImg").show();
						} else {
							$("#deleteImg").hide();
						}

					});

					//监听工具条
					table.on('tool(wskximgNameManage)', function(obj) {

						var data = obj.data;
						if(obj.event === 'del') {
							layer.confirm('真的删除行么', function(index) {

								$.ajax({
									type: "post",
									url: "/GsxyWskxImgController/updateGsxyWskxImgStatus",
									data: {
										"wskximgId": data.wskximgId
									},
									async: true,
									//			timeout:12000,
									success: function(data) {
										if(data > 0) {
											$("#deleteImg").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({where: {}});
										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							//编辑图片信息
							location.href = 'releaseImg.jsp?wskximgId=' + data.wskximgId;
							
						} else if(obj.event === 'download') {
							
						} else if(obj.event === 'preview') {
						
						}

					});

				}

			});

			$(function(){
				var wskximgType = '';
				  //监听提交
				  form.on('select(wskximgTypeFilter)', function(data){
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
						temp += n.wskximgId + ",";
					});
					//	console.log(temp)
					$.ajax({
						type: "post",
						url: "/GsxyWskxImgController/updateGsxyWskxImgStatusBatch",
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