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

<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js">
	
</script>
<link rel="stylesheet" href="js/sweetalert.css" type="text/css"></link>
<script type="text/javascript" src="js/sweetalert-dev.js"></script>
<link rel="stylesheet" href="css/m_updatepark_style.css" type="text/css"
	media="all" />

<link rel="stylesheet" href="js/sweetalert.css" type="text/css"></link>
<script type="text/javascript" src="js/sweetalert-dev.js"></script>
<script type="text/javascript">
	function deletePark(id) {
		swal({
			title : "您确定要删除这条信息么？",
			text : "该停车场信息将永久删除",
			type : "info",
			showCancelButton : true,
			closeOnConfirm : false,
			showLoaderOnConfirm : true,
		}, function() {
			var htmlobj = $.ajax({
				url : "ParkAction!delete.action?id=" + id,
				type : "POST",
				data : {
					"id" : $("#id").val()
				},
				async : false
			});
			var jsonresult = JSON.parse(htmlobj.responseText);
			var result = jsonresult.flag;
			var error = jsonresult.error;
			if (result) {
				location.href = "ParkAction!ParkList.action";
			} else {
				/* $.MsgBox.Alert("温馨提示：", error);  */
				sweetAlert("Sorry", "删除失败!", "error");
			}
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
							<h2 id="m_park" class="left" style="text-align:center">停车位使用状况</h2>
						</div>
						<!-- End Box Head -->

						<!-- Table -->
						<div class="table">
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								style="text-align:center">
								<tr style="text-align:center">
									<th style="text-align:center;font-size:14px">停车位编号</th>
									<th style="text-align:center;font-size:14px">能否使用</th>
								</tr>
								<c:forEach items="${spaces}" var="bean" varStatus="i">
									<tr>
										<td><h3>
												<a href="#">${bean.num}</a>
											</h3>
										</td>
										<td>
										<c:choose>
											<c:when test="${bean.shiyong == 0}">
											    <div style="float:left"></div>
												 <img style="width:20;height:30" src="images/btn_check_buttonless_on.png"></img>
											</c:when>
											<c:otherwise>
												 <img style="width:30;height:30" src="images/ic_delete.png"></img>
											</c:otherwise>
										</c:choose>
										</td>
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
			$("#m_park").text(result.name + "车位状态");
		}
		setText('${park_id}');
	</script>

</body>
</html>
