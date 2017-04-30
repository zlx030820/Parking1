<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>停车场信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">




<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery.js"></script>

<link rel="stylesheet" href="css/m_listpark_style.css" type="text/css"
	media="all" />
<script type="text/javascript" src="js/sweetalert.min.js">
	
</script>
<link rel="stylesheet" href="js/sweetalert.css" type="text/css"></link>
<script type="text/javascript" src="js/sweetalert-dev.js"></script>
<script type="text/javascript">
	function Play(id) {
		swal({
			title : "结束停车",
			text : "您确定要结束此次停车么？",
			type : "info",
			showCancelButton : true,
			closeOnConfirm : false,
			showLoaderOnConfirm : true,
		}, function() {
			location.href = "ParkAction!outSpace.action?id=" + id;
		});
	}
	function deletePar() {
		{
			var id = document.getElementById("id").value
			window.location.href = "${request.contextPath}/Parking/ParkAction!delete.action?id="
					+ id;
		}
	};
</script>

</head>

<body>
	<!-- Header -->
	<div id="header">
		<div class="shell">
			<!-- Logo + Top Nav -->
			<div id="top">
				<h1>
					<a ><strong>园区停车管理系统</strong> </a>
				</h1>
				<div id="top-navigation">
					<strong style="font-size:14px">欢迎您:</strong> <a>${session.userMessage.username}</a>
					<span>|</span> <a>帮助</a> <span>|</span> <a>个人资料</a> <span>|</span>
					<a href="UserAction!loginOut.action">退出登录</a>
				</div>
			</div>
			<!-- End Logo + Top Nav -->

			<!-- Main Nav -->
			<div id="navigation">
				<ul>
					<li><a href="m_user_home.jsp"><span>地图导航</span> </a></li>
					<li><a href="UserAction!userMessage.action?id=${user.id}"><span>个人资料</span>
					</a></li>
					<li><a href="ParkAction!getMySpace.action" class="active"><span>正在停车</span>
					</a>
					</li>
					<li><a href="UserAction!findAllAdvice.action"><span>系统评语</span>
					</a>
					</li>

				</ul>
			</div>
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
							<h2 class="left" style="text-align:center">停车信息</h2>
						</div>
						<!-- End Box Head -->

						<!-- Table -->
						<div class="table">
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								style="text-align:center">
								<tr style="text-align:center">
									<th style="text-align:center;font-size:14px">停车场名称</th>
									<th style="text-align:center;font-size:14px">停车位</th>
									<th style="text-align:center;font-size:14px">开始时间</th>
									<th style="text-align:center;font-size:14px">操作</th>
								</tr>
								<c:forEach items="${spaces}" var="bean" varStatus="i">
									<tr>
										<td>${bean.park_id}</td>
										<td>${bean.num}</td>
										<td>${bean.start_time}</td>
										<td><a onClick="Play('${bean.id}')">结束使用</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- Table -->
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
	<div id="footer">
		<div class="shell" text-align="center">
			<span class="left">Copyright &copy; 2017.园区停车管理系统</span> <span
				class="right"> version 1.0 </span>
		</div>
	</div>
	<!-- End Footer -->
</body>
</html>
