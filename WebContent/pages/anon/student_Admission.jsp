<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>录取信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=Edge">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/r3/layui-v2.2.1/layui/css/layui.css" />
		<style>
			body {
				margin: 0px;
				background: url(r3/imgs/index_scy_jyb_banner.jpg)no-repeat;
			}
			.student_admission_info {
				margin: 0 auto;
				height: 500px;
				width: 800px;
				background-color: #D6E9C6;
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
			.bottom_diji{
				margin: 0 auto;
				height:200px;
				width: 1000px;
				/*background-color: #B8EECF;*/
				background: url(<%=request.getContextPath()%>/r3/imgs/wygkcn.gif)no-repeat;
			}
			.bottom_diji_neir{
				text-align: center;
				height:200px;
				width: 1000px;
			}
		</style>
	</head>

	<body>
		<div class="titleLink">
			<h1 style="font-size: 24px;">湖南工商职业学院毕业学生查询</h1>
		</div>
		<div class="student_admission_info" >
			<table class="layui-table" id="student02">
				<thead>
					<tr>
						<th>学生姓名</th>
						<th>学号</th>
						<th>身份证</th>
						<th>毕业时间</th>
						<th>专业</th>
						<th>学生民族</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span id="studentName"></span></td>
						<td><span id="number"></span></td>
						<td><span id="idCard"></span>
						</td>
						<td><span id="graduationTime"></span>
						</td>
						<td><span id="major"></span>
						</td>
						<td><span id="studentNation"></span>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="student01">未能查询到此毕业生</div>
		</div>
		<div class="bottom_diji">
			<div class="bottom_diji_neir">
				Copyright 2009-2020 http://www.hngsxy.com All Rights Reserved <br />
				版权所有： 湖南工商职业学院 电话：0734-8593338 8593358 传真：0734-8593325 <br />
				地址：湖南省衡阳市石鼓区松木塘 邮编：421001   <br />
				湘教QS4_201212_040024   湘ICP备12013408号 <br />
				<img src="/r3/imgs/gonggongImg/beianbgs.png" style="width: 20px; height: 20px;"/>
				<a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=43040702000117" target="_blank">湘公网安备 43040702000117号</a> <br />
			</div>
		</div>
	</body>
	<script src="<%=request.getContextPath()%>/r3/jquery/jquery-1.8.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/r3/layui-v2.2.1/layui/layui.js"></script>
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
		var idCard = v['idCard'];
		//console.log(idCard);

		$("#student02").hide();
		$("#student01").hide();

		$(function() {
			$.ajax({
				type: "post",
				url: "<%=request.getContextPath()%>/anon/findOneGraduate",
				data: {
					idCard: idCard
				},
				async: true,
				//timeout:1200,
				success: function(data) {
					//console.log(jQuery.isEmptyObject(data));
					//console.log(data);
					
					if(jQuery.isEmptyObject(data)) {
						$("#student01").show();
					} else {
						$("#student02").show();
					}
						$("#studentName").text(data.studentName);
						$("#number").text(data.number);
						$("#idCard").text(data.idCard);
						$("#graduationTime").text(data.graduationTime);
						$("#major").text(data.major);
						$("#studentNation").text(data.studentNation);
					
					
				}
			});

		});
	</script>

</html>