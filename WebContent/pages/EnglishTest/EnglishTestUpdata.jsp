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
		<title>修改考试生信息</title>
		<style>
			
		</style>
    </head>
    <body>
    <input type="hidden" id="studentPicture" />
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a name="color-design">考试生信息修改</a>
			</legend>
		</fieldset>
		<blockquote class="layui-elem-quote">
		</blockquote>
		<fieldset class="layui-elem-field" style="width: 500px;">
			<legend>考试生信息修改</legend>
			<form class="layui-form" action="">
			  <div class="layui-form-item">
			    <label class="layui-form-label">身份证</label>
			    <div class="layui-input-block">
			      <input type="text" id="idcard" name="idcard" required  lay-verify="required" placeholder="请输身份证" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">姓名</label>
			    <div class="layui-input-block">
			      <input type="text" id="studentName" name="studentName" required  lay-verify="required" placeholder="请输姓名" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-block">
			      <input id="sex1" type="radio" name="studentsex" value="1" title="男">
			      <input id="sex2" type="radio" name="studentsex" value="2" title="女">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">校区</label>
			    <div class="layui-input-block">
			      <select name="campus" lay-verify="required">
			        <option value="本校区">本校区</option>
			      </select>
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">学院</label>
			    <div class="layui-input-block">
			      <select name="college" lay-verify="required" id="college">
			        <option value="工学院">工学院</option>
			        <option value="商学院">商学院</option>
			      </select>
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">系别</label>
			    <div class="layui-input-block">
			      <select name="factions" lay-verify="required" id="factions">
			      </select>
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">班级</label>
			    <div class="layui-input-block">
			      <input type="text" id="classNumber" name="classNumber" required  lay-verify="required" placeholder="请输班级" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">学号</label>
			    <div class="layui-input-block">
			      <input type="text" id="schoolNumber" name="schoolNumber" required  lay-verify="required" placeholder="请输学号" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">入学年份</label>
			      <div class="layui-input-inline">
			        <input type="text" class="layui-input" id="enrollmentYear" name="enrollmentYear" placeholder="yyyy">
			      </div>
			   </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">专业</label>
			    <div class="layui-input-block">
			      <select id="major" name="major" lay-verify="required">
			      </select>
			    </div>
			  </div>
					<div class="layui-form-item">
						<label class="layui-form-label">考期</label>
						<div class="layui-input-block">
							<select id="examination" name="examination" lay-verify="required">
								<option value="2018年下">2018年下</option>
								<option value="2019年上">2019年上</option>
							</select>
						</div>
					</div>
				<div class="layui-form-item" id="tpsc">
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
		<script src="../../r3/anonJs/anonJs.js"></script>
		<script src="/r3/layui-v2.3.0/layui/layui.js"></script>
		<script>
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
				var id = v['id'];
				/*var temp01 = v['temp01'];*/
				//console.log(temp01) 1:发送 2：编辑
			}
			
			//
			layui.use('laydate', function(){
			  var laydate = layui.laydate;
					  //年选择器
					  laydate.render({
					    elem: '#enrollmentYear'
					    ,type: 'year'
					  });
					});	
			
			
					$.ajax({
							type: "post",
							url: "/anon/selectMajor",
							data: {},
							async: false,
							//timeout:12000,
							success: function(data) {
								//console.log(data)
									var List = [];
							for(var a = 0; a < data.length; a++) {
								List.push('<option value="' + data[a].title + '">' + data[a].title + '</option>');
							}
							$("#major").append(List);
							}
					});
					$.ajax({
							type: "post",
							url: "/anon/selectFactions",
							data: {},
							async: false,
							//timeout:12000,
							success: function(data) {
								//console.log(data)
									var List = [];
							for(var a = 0; a < data.length; a++) {
								List.push('<option value="' + data[a].name + '">' + data[a].name + '</option>');
							}
							$("#factions").append(List);
							}
					});
					
			
			//Demo
			layui.use('form', function(){
			  var form = layui.form;
			  //监听提交
			  form.on('submit(formDemo)', function(data){
			  	
			    //layer.msg(JSON.stringify(data.field));
					$.ajax({
							type: "post",
							url: "/EnglishTestController/updateEnglishTest",
							data: {
								id:id,
								idcard:data.field.idcard,
								studentName:data.field.studentName,
								studentsex:data.field.studentsex,
								campus:data.field.campus,
								college:data.field.college,
								factions:data.field.factions,
								classNumber:data.field.classNumber,
								schoolNumber:data.field.schoolNumber,
								enrollmentYear:data.field.enrollmentYear,
								examination:data.field.examination,
								major:data.field.major,
								photo:$("#studentPicture").val()
							},
							async: true,
							//timeout:12000,
							success: function(data) {
 								//console.log(data)
										if(data > 0) {
											layer.msg("修改成功");
										}else{
											layer.msg("修改失败");
										}
							
							
							}
					});

			    
			    return false;
			  });
			});
			
			$(function(){
					$.ajax({
							type: "post",
							url: "/EnglishTestController/selectGsxyEnglishExaminationTableOne",
							data: {
								id:id
							},
							async: true,
							//timeout:12000,
							success: function(data) {
								console.log(data.photo);
								$("#idcard").val(data.idcard);
								$("#studentName").val(data.studentName);
								$("#schoolNumber").val(data.schoolNumber);
								$("#college").val(data.college);
								$("#major").val(data.major);
								$("#factions").val(data.factions);
								$("#classNumber").val(data.classNumber);
								$("#enrollmentYear").val(data.enrollmentYear);
								$("#studentPicture").val(data.photo);
								$("#examination").val(data.examination);
								$("#studentImg").attr('src',data.photo+'?uuid='+uuid());
									if(data.studentsex == '1'){
										$("#sex1").attr('checked','checked');
									}else if(data.studentsex == '2'){
										$("#sex2").attr('checked','checked');
									}
								}
					});

					
					
					
			})
			
		//图片上传
		layui.use('upload', function() {
			var $ = layui.jquery,
				upload = layui.upload;
			//field: 'myfile'
			var uploadInst = upload.render({
				elem: '#uploadPhotos',
				url: '/anon/englishTestPhotos',
				size: 500 //限制文件大小，单位 KB
				,
				accept: 'images' //允许上传的文件类型
				,
				data: {
				  idcard: function(){
				    return $('#idcard').val();
				  },
				  textState:function(){
				  	return '1';
				  }
				},
				field: 'myfile',
				before: function(obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result) {
						$('#studentImg').attr('src', result); //图片链接（base64）
					});
				},
				done: function(res) {
					//console.log(res.studentTuPian);//图片路径
					$("#studentPicture").val(res.studentTuPian);
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
			
			$("#idcard").on("change",function(){
				if($("#idcard").val().length == 18){
					$("#tpsc").show();
				}else{
					$("#tpsc").hide();
				}
			});
			
			
			
		</script>
</html>