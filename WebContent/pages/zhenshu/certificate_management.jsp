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
		<title>证书管理</title>
		<style>
			
		</style>
	</head>
	<body>
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">证书管理</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
			<div class="layui-upload">
				<button class="layui-btn layui-btn-normal" id="gsxy_zs_major">
						<i class="layui-icon"></i>证书专业管理
				</button>
				<button class="layui-btn layui-btn-primary" id="insertCertificate">
						<i class="layui-icon"></i>添加学生信息
				</button>
				<button class="layui-btn" id="findWskximg">搜索</button>
			</div>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>证书管理系统</legend>
				证件号码：
				<div class="layui-inline">
					<input class="layui-input" name="title" id="title" />
				</div>
				身份证：
				<div class="layui-inline">
					<input class="layui-input" name="idcard" id="idcard" />
				</div>
				姓名：
				<div class="layui-inline">
					<input class="layui-input" name="content" id="content" />
				</div>
			<!--描述：文件夹列表 -->
			<table id="findZhenShuManage" lay-filter="findZhenShuManage"></table>
			<script type="text/html" id="wskximgTypeTpl">
				{{# if(d.sex == '1'){ }}
				<span style="color: #0000CC;">男</span> 
				{{# }else if(d.sex == '2'){ }}
				<span style="color:#DD0000;">女</span> 
				{{# } }}
			</script>
			<script type="text/html" id="classidTpl">
				{{# if(d.classid == '11'){ }}
				<span >计算机应用技术</span> 
				{{# }else if(d.classid == '12'){ }}
				<span>机电一体化</span> 
				{{# }else if(d.classid == '13'){ }}
				<span>机械制造与自动化</span> 
				{{# }else if(d.classid == '14'){ }}
				<span>模具设计与制造</span> 
				{{# }else if(d.classid == '15'){ }}
				<span>汽车运用技术</span> 
				{{# }else if(d.classid == '16'){ }}
				<span>工程监理</span> 
				{{# }else if(d.classid == '17'){ }}
				<span>房屋建筑工程</span> 
				{{# }else if(d.classid == '18'){ }}
				<span>室内装潢设计</span> 
				{{# }else if(d.classid == '19'){ }}
				<span>应用电子技术</span> 
				{{# }else if(d.classid == '20'){ }}
				<span>工商企业管理</span> 
				{{# }else if(d.classid == '21'){ }}
				<span>财务会计</span> 
				{{# }else if(d.classid == '22'){ }}
				<span>市场营销</span> 
				{{# }else if(d.classid == '23'){ }}
				<span>广告设计与制作</span> 
				{{# }else if(d.classid == '24'){ }}
				<span>旅游酒店管理</span> 
				{{# }else if(d.classid == '25'){ }}
				<span>机械设计制造及自动化</span> 
				{{# }else if(d.classid == '26'){ }}
				<span>电子工程</span> 
				{{# }else if(d.classid == '27'){ }}
				<span>房屋建筑工程</span> 
				{{# }else if(d.classid == '28'){ }}
				<span>计算机及应用</span> 
				{{# }else if(d.classid == '29'){ }}
				<span>计算机信息管理</span> 
				{{# }else if(d.classid == '31'){ }}
				<span>工业管理工程</span> 
				{{# }else if(d.classid == '32'){ }}
				<span>法律</span> 
				{{# }else if(d.classid == '33'){ }}
				<span>会计</span> 
				{{# }else if(d.classid == '34'){ }}
				<span>外贸英语</span> 
				{{# }else if(d.classid == '35'){ }}
				<span>美术</span> 
				{{# }else if(d.classid == '36'){ }}
				<span>汽车运用技术</span> 
				{{# }else if(d.classid == '37'){ }}
				<span>汽车运用工程</span> 
				{{# }else if(d.classid == '38'){ }}
				<span>机电一体化工程</span> 
				{{# }else if(d.classid == '39'){ }}
				<span>房屋建筑工程及设计</span> 
				{{# }else if(d.classid == '40'){ }}
				<span>英语</span> 
				{{# }else if(d.classid == '41'){ }}
				<span>工商管理</span> 
				{{# }else if(d.classid == '42'){ }}
				<span>国际贸易</span> 
				{{# }else if(d.classid == '43'){ }}
				<span>电子技术</span> 
				{{# }else if(d.classid == '44'){ }}
				<span>临床医学</span> 
				{{# } }}
			</script>
			
			
			
			
			<!--	描述：控制按钮 -->
			<div class="layui-hide" id="barDemo">
					<a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="del">删除</a>
			</div>
			
			
			
		</fieldset>
	</body>
	<script src="/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="/r3/layui-v2.2.5/layui/layui.js"></script>
	<script>
		
		layui.use('table', function() {
			var table = layui.table,form = layui.form;

			//方法级渲染
			var tableIns = table.render({
				elem: '#findZhenShuManage',
				method: 'post',
				url: '<%=request.getContextPath()%>/ZheShuController/findZhenShu',
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
							title: '证件号码',
							width: 200
						},{
							field: 'classid',
							title: '专业名称',
							templet: '#classidTpl',
							width: 200
						},{
							field: 'content',
							title: '名字',
							width: 150
						},{
							field: 'adddate',
							title: '添加时间',
							width: 200
						},{
							field: 'idcard',
							title: '身份证',
							width: 200
						},{
							field: 'data',
							title: '毕业时间',
							width: 200
						},{
							field: 'sex',
							title: '性别',
							templet: '#wskximgTypeTpl',
							width: 80
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
									url: "/ZheShuController/updateZhenShuStatus",
									data: {
										"id": data.id
									},
									async: true,
									//			timeout:12000,
									success: function(data) {
										if(data > 0) {
											//$("#deleteImg").hide();
											layer.msg("删除成功");
											//刷新
											tableIns.reload({where: {}});
										}
									}
								});

								layer.close(index);
							});
						} else if(obj.event === 'edit') {
							//修改信息
							//location.href = 'releaseImg.jsp?id=' + data.id;
							location.href = 'insert_zhenshu.jsp?id=' + data.id;

						} else if(obj.event === 'download') {
							
						} else if(obj.event === 'preview') {
						
						}

					});

				}

			});

			$(function(){
//				var wskximgType = '';
//				  //监听提交
//				  form.on('select(findZhenShuManage)', function(data){
//				   		wskximgType =	data.value;
//				    return false;
//				  });

					//模糊查询
					$("#findWskximg").on("click", function() {
						//$("#deleteFile").hide();
						//刷新也可以用
						tableIns.reload({
							where: {
								idcard:$("#idcard").val(),
								title:$("#title").val(),
								content:$("#content").val()
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
		
		$(function(){
			
			$("#gsxy_zs_major").on("click",function(){
				location.href = "/pages/zhenshu/gsxy_zs_major.jsp";
			})
			
			$("#insertCertificate").on("click",function(){
				location.href = "/pages/zhenshu/insert_zhenshu.jsp";
			})
			
			
			
		})
		
		
		
	</script>
</html>
