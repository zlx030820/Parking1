<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Free CSS template Collect from Cssmoban.com</title>

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js">
	
</script>
<link rel="stylesheet" href="js/sweetalert.css" type="text/css"></link>
<script type="text/javascript" src="js/sweetalert-dev.js"></script>
<link rel="stylesheet" href="css/m_updatepark_style.css" type="text/css"
	media="all" />

<script language="javascript">
	function check() {
		var userPwReal = "${session.userMessage.password}";
		if (document.formPw.userPw.value != userPwReal) {
			alert("原密码不正确");
			return;
		}

		if (document.formPw.userPw1.value == "") {
			alert("新密码不能空");
			return;
		}
		if (document.formPw.userPw1.value != document.formPw.userPw2.value) {
			alert("两次输入的密码不一致");
			return;
		} else {
			document.getElementById('form1').submit();
		}
	}

	function callback(data) {
		document.getElementById("indicator").style.display = "none";
		alert("修改成功");
	}
</script>
</head>
<body>
	<!-- Header -->
	<div id="header">
		<div class="shell">
			<!-- Logo + Top Nav -->
			<div id="top">
				<h1>
					<a><strong>园区停车管理系统</strong> </a>
				</h1>
				<div id="top-navigation">
					<strong style="font-size:14px">欢迎您:</strong> <a href="#">Administrator</a>
					<span>|</span> <a href="#">帮助</a> <span>|</span> <a href="#">个人资料</a>
					<span>|</span> <a href="#">退出登录</a>
				</div>
			</div>
			<!-- End Logo + Top Nav -->

			<!-- Main Nav -->
			<div id="navigation"></div>
			<!-- End Main Nav -->
		</div>
	</div>
	<!-- End Header -->
	<div class="copyrights">Collect from</div>
	<!-- Container -->
	<div id="container">
		<div class="shell">
			<br />
			<!-- Main -->
			<div id="main">
				<div class="cl">&nbsp;</div>
				<!-- Content -->
				<div id="content">

					<!-- Box -->
					<div class="box">
						<!-- Box Head -->
						<div class="box-head">
							<h2 class="left" style="text-align:center">停车场信息修改</h2>
						</div>
						<!-- End Box Head -->

						<!-- Box -->
						<div class="box">
							<!-- Box Head -->
							<!-- End Box Head -->

							<form action="UserAction!updateUser.action?id=${session.userMessage.id}"
								method="post">
								<!-- Form -->
								<div class="form">
									<p>
										<label>原密码: </label> <input type="text" id="userPw"
											class="field size1" name="name" value="" />
									</p>
									<p>
										<label>新密码: </label> <input type="text" id="userPw1"
											class="field size1" name="x" value="" />
									</p>
									<p>
										<label>确认密码: </label> <input type="text" id="userPw2"
											class="field size1" name="y" value="" />
									</p>
								</div>
								<!-- End Form -->
								<!-- Form Buttons -->
								<div class="buttons">
									<input type="reset" value="重置" /> <input type="submit"
										class="button" value="提交" onclick="check()" />
								</div>
								<!-- End Form Buttons -->
							</form>
						</div>
						<!-- End Box -->
					</div>
					<!-- End Box -->
				</div>
				<!-- End Content -->
				<div class="cl">&nbsp;</div>
			</div>
			<!-- Main -->
		</div>
	</div>
	<!-- End Container -->

	<!-- Footer -->
	<div id="footer" ma>
		<div class="shell" text-align="center">
			<span class="left">Copyright &copy; 2017.园区停车管理系统</span> <span
				class="right"> version 1.0 </span>
		</div>
	</div>
	<!-- End Footer -->

	<script type="text/javascript">
		function setText(id) {
			var htmlobj = $.ajax({
				url : "ParkAction!getParkById.action",
				type : "POST",
				data : {
					"park_id" : id
				},
				async : false
			});
			var jsonresult = JSON.parse(htmlobj.responseText);
			var result = jsonresult.park;
			$("#m_name").val(result.name);
			$("#m_x").val(result.x);
			$("#m_y").val(result.y);
			$("#m_spacenum").val(result.spaceNum);
		}
		setText('${id}');
	</script>
</body>
</html>