<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>报名学生审核</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/css/layui.css" />
		<style>
			body {
				background: url(/r3/imgs/index_scy_jyb_banner.jpg)no-repeat;
				margin: 0px;
			}
			.student_shenhe_div {
				margin: 0 auto;
				height: 500px;
				width: 1400px;
				/*background-color: #D6E9C6;*/
			}
			
			.student_shenhe_div_btn {
				margin: 5px;
				margin: 0 auto;
				height: 100px;
				width: 200px;
				/*background-color: #C2BE9E;*/
			}
			.titleLink {
				margin: 0 auto;
				width: 1010px;
				height: 50px;
				/*background-color: #5FB878;*/
				text-align: center;
				margin-bottom: 10px;
				margin-top: 10px;
				/*background: url(../../r3/imgs/xytp.png);*/
			}
			
			.Headerdiv{
				width:100%; 
				height:160px; 
			}
			
			.Headerdiv_1{
				margin:0 auto; 
				width:1000px; 
				height:160px; 
			}
		</style>
	</head>

	<body>
		<div class="Headerdiv">
			<div class="Headerdiv_1">
				<img style="padding-top: 30px;" src="/r3/imgs/logoHbeijtm.png" />
				<img style="padding-top: 30px;" src="/r3/imgs/ziti/xk_hngszxxy.png" />
			</div>
		</div>
		
		<div class="student_shenhe_div">
			
			<table class="layui-table">
				<thead>
					<tr>
						<th>姓名</th>
						<th>性别</th>
						<th>出生年月日</th>
						<th>籍贯</th>
						<th>文化程度</th>
						<th>特长</th>
						<th>政治面貌</th>
						<th>身份证号</th>
						<th>通过何种媒体得知本校</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span id="studentName"></span></td>
						<td><span id="sex"></span></td>
						<td><span id="studentBirthday"></span></td>
						<td><span id="studentPlace"></span></td>
						<td><span id="studentEducation"></span></td>
						<td><span id="studentSpecialty"></span></td>
						<td><span id="studentPolitics"></span></td>
						<td><span id="idCard"></span></td>
						<td><span id="studentMedia"></span></td>
					</tr>
				</tbody>
			</table>
			<table class="layui-table">
				<thead>
					<tr>
						<th>考生类别</th>
						<th>毕业学校地址及名称</th>
						<th>电子信箱</th>
						<th>QQ号</th>
						<th>邮政编码</th>
						<th>联系电话</th>
						<th>志愿报考专业</th>
						<th>报名指导人老师</th>
						<th>经审定录取专业</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span id="studentCategory"></span></td>
						<td><span id="studentGraduationSchool"></span></td>
						<td><span id="studentEmail"></span></td>
						<td><span id="studentQq"></span></td>
						<td><span id="studentPostal"></span></td>
						<td><span id="studentPhone"></span></td>
						<td><span id="studentMajor"></span></td>
						<td><span id="studentTeacher"></span></td>
						<td><span id="studentAdmissionMajor"></span></td>
					</tr>
				</tbody>
			</table>
			<table class="layui-table">
				<thead>
					<tr>
						<th>自 何年何月</th>
						<th>至 何年何月</th>
						<th>在何地何学习(单位)学习(工作)</th>
						<th>自 何年何月</th>
						<th>至 何年何月</th>
						<th>在何地何学习(单位)学习(工作)</th>
						<th>自 何年何月</th>
						<th>至 何年何月</th>
						<th>在何地何学习(单位)学习(工作)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span id="studentResumea_1"></span></td>
						<td><span id="studentResumea_2"></span></td>
						<td><span id="studentResumea_3"></span></td>
						<td><span id="studentResumeb_1"></span></td>
						<td><span id="studentResumeb_2"></span></td>
						<td><span id="studentResumeb_3"></span></td>
						<td><span id="studentResumec_1"></span></td>
						<td><span id="studentResumec_2"></span></td>
						<td><span id="studentResumec_3"></span></td>
					</tr>
				</tbody>
			</table>
			<table class="layui-table">
				<thead>
					<tr>
						<th>姓名</th>
						<th>称呼</th>
						<th>工作单位</th>
						<th>联系电话</th>
						<th>姓名</th>
						<th>称呼</th>
						<th>工作单位</th>
						<th>联系电话</th>
						<th>姓名</th>
						<th>称呼</th>
						<th>工作单位</th>
						<th>联系电话</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span id="studentFamilya_1"></span></td>
						<td><span id="studentFamilya_2"></span></td>
						<td><span id="studentFamilya_3"></span></td>
						<td><span id="studentFamilya_4"></span></td>
						<td><span id="studentFamilyb_1"></span></td>
						<td><span id="studentFamilyb_2"></span></td>
						<td><span id="studentFamilyb_3"></span></td>
						<td><span id="studentFamilyb_4"></span></td>
						<td><span id="studentFamilyc_1"></span></td>
						<td><span id="studentFamilyc_2"></span></td>
						<td><span id="studentFamilyc_3"></span></td>
						<td><span id="studentFamilyc_4"></span></td>
					</tr>
				</tbody>
			</table>
			<table class="layui-table">
				<thead>
					<tr>
						<th>备注</th>
						<th>照片</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span id="studentRemarks"></span></td>
						<td><img src="" id="studentPicture" /></td>
					</tr>
				</tbody>
			</table>
			<div class="student_shenhe_div_btn">
				<button class="layui-btn" id="shenhebtn">点击确认审核通过</button>
			</div>
		</div>

	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.1.5/layui-v2.1.5/layui/layui.js"></script>
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
			var studentId = v['studentId'];
			//console.log(idCard);
		}
		layui.use('layer', function() {
			var $ = layui.jquery,
				layer = layui.layer;
			//审核按钮
			$("#shenhebtn").on("click", function() {
				$.ajax({
					type: "post",
					url: "<%=request.getContextPath()%>/StudentController/studentAuditState",
					data: {
						studentId: studentId
					},
					async: true,
					//timeout:1200,
					success: function(data) {
						if(data > 0) {
							layer.msg("审核成功");
						}
					}
				});

			});
		});

		$(function() {

			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/StudentController/findStudentById",
				data: {
					studentId: studentId
				},
				async: true,
				//timeout:1200,
				success: function(data) {
					$("#studentName").text(data.studentName);
					$("#sex").text(data.sex);
					$("#studentBirthday").text(data.studentBirthday);
					$("#studentPlace").text(data.studentPlace);
					$("#studentEducation").text(data.studentEducation);
					$("#studentSpecialty").text(data.studentSpecialty);
					$("#studentPolitics").text(data.studentPolitics);
					$("#idCard").text(data.idCard);
					$("#studentMedia").text(data.studentMedia);

					$("#studentCategory").text(data.studentCategory);
					$("#studentGraduationSchool").text(data.studentGraduationSchool);
					$("#studentEmail").text(data.studentEmail);
					$("#studentQq").text(data.studentQq);
					$("#studentPostal").text(data.studentPostal);
					$("#studentPhone").text(data.studentPhone);
					$("#studentMajor").text(data.studentMajor);
					$("#studentTeacher").text(data.studentTeacher);
					$("#studentAdmissionMajor").text(data.studentAdmissionMajor);

					if(data.studentResumea != null) {
						var studentResumea = data.studentResumea.split(',');
						$("#studentResumea_1").text(studentResumea[0]);
						$("#studentResumea_2").text(studentResumea[1]);
						$("#studentResumea_3").text(studentResumea[2]);
					}
					if(data.studentResumeb != null) {
						var studentResumeb = data.studentResumeb.split(',');
						$("#studentResumeb_1").text(studentResumeb[0]);
						$("#studentResumeb_2").text(studentResumeb[1]);
						$("#studentResumeb_3").text(studentResumeb[2]);
					}
					if(data.studentResumec != null) {
						var studentResumec = data.studentResumec.split(',');
						$("#studentResumec_1").text(studentResumec[0]);
						$("#studentResumec_2").text(studentResumec[1]);
						$("#studentResumec_3").text(studentResumec[2]);
					}

					if(data.studentFamilya != null) {
						var studentFamilya = data.studentFamilya.split(',');
						$("#studentFamilya_1").text(studentFamilya[0]);
						$("#studentFamilya_2").text(studentFamilya[1]);
						$("#studentFamilya_3").text(studentFamilya[2]);
						$("#studentFamilya_4").text(studentFamilya[3]);
					}

					if(data.studentFamilyb != null) {
						var studentFamilyb = data.studentFamilyb.split(',');
						$("#studentFamilyb_1").text(studentFamilyb[0]);
						$("#studentFamilyb_2").text(studentFamilyb[1]);
						$("#studentFamilyb_3").text(studentFamilyb[2]);
						$("#studentFamilyb_4").text(studentFamilyb[3]);
					}

					if(data.studentFamilyb != null) {
						var studentFamilyc = data.studentFamilyc.split(',');
						$("#studentFamilyc_1").text(studentFamilyc[0]);
						$("#studentFamilyc_2").text(studentFamilyc[1]);
						$("#studentFamilyc_3").text(studentFamilyc[2]);
						$("#studentFamilyc_4").text(studentFamilyc[3]);
					}

					$("#studentRemarks").text(data.studentRemarks);
					$("#studentPicture").attr('src', data.studentPicture);

				}
			});

		});
	</script>

</html>