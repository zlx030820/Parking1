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

<script type="text/javascript">
  
	function addPark() {
		var htmlobj = $.ajax({
			url : "ParkAction!addPark.action",
			type : "POST",
			data : {
				"name" : $("#name").val(),
				"x" : $("#x").val(),
				"y" : $("#y").val(),
				"spaceNum" : $("#spaceNum").val(),
				
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
		alert("温馨提示：用户名或密码错误");
	      swal({
				title : error,
				showCancelButton : true,
				showConfirmButton : false,
				cancelButtonText : "确认",
				
			});
		}
	}
	function keydown(e) {

		if ((e.keyCode || e.which) == 13) {
		
			login();
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
					<strong style="font-size:14px">欢迎您:</strong> <a >${session.userMessage.username}</a>
					<span>|</span> <a >帮助</a> <span>|</span> <a >个人资料</a>
					<span>|</span> <a href="UserAction!loginOut.action">退出登录</a>
				</div>
			</div>
			<!-- End Logo + Top Nav -->

			<div id="navigation">
				<ul>
					<li><a href="ParkAction!ParkList.action" ><span>停车场操作</span> </a>
					</li>
					<li><a href="UserAction!userList1.action"><span>费用操作</span> </a>
					</li>
					<li><a href="UserAction!userList.action"><span>用户管理</span> </a>
					</li>
					<li><a href="UserAction!getAdvice.action"><span>评论管理</span> </a>
					</li>
					<li><a href="m_addpark.jsp" class="active"><span>添加车场</span> </a></li>

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
							<h2 class="left" style="text-align:center">停车场信息添加</h2>
						</div>
						<!-- End Box Head -->

						<!-- Box -->
						<div class="box">
							<!-- Box Head -->
							<!-- End Box Head -->

							<form action="ParkAction!updatePark.action?id=${id}"
								method="post">
								<!-- Form -->
								<div class="form">
									<p>
										<label>停车场名称: </label> <input type="text" id="name" class="field size1"
											name="name" value="" />
									</p>
									<p>
										<label>x坐标: </label> <input type="text"  id="x" class="field size1"
											name="x"  value=""/>
									</p>
									<p>
										<label>y坐标: </label> <input type="text" id="y" class="field size1"
											name="y" value=""/>
									</p>
									<p>
										<label>车位数: </label> <input type="text" id="spaceNum" class="field size1"
											name="spaceNum" value=""/>
									</p>
								</div>
								<!-- End Form -->
								<!-- Form Buttons -->
								<div class="buttons">
									<input type="submit" class="button" value="提交" onclick="addPark()" />
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