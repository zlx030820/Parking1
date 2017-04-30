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
	function zhifu(){
	var b1=document.getElementById("feiyong").value;
	var b2=document.getElementById("balance").value;
	var id=document.getElementById("userid").value;	
	var balance=document.getElementById("leftbalance").value;	

	if(balance>0||balance==0){

		alert("支付成功，自动跳转到评论页面");
		window.location.href="UserAction!updateaccount.action?id="+id+"&balance="+balance;
	}
	else{
		alert("您的余额不足！");
	};
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
					<a href="#"><strong>园区停车管理系统</strong> </a>
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
					<div class="box" style="margin:0 auto">
						<!-- Box Head -->
						<div class="box-head" style="margin:0 auto">
							<h2 class="left" style="text-align:center">支付界面</h2>
						</div>
						<!-- End Box Head -->

						<table style="margin:200px auto">
							<tr>
								<td style="font-size:20px">停车时间：</td>
								<td id="t1" style="font-size:20px">${session.outSpace.start_time}</td>
							</tr>

							<tr>
								<td style="font-size:20px" >结束时间：</td>
								<td id="t2" style="font-size:20px">${session.outSpace.end_time}</td>
							</tr>
							<tr>
								<td style="font-size:20px">应付费用：</td>
								<td style="font-size:20px"><input type="button" id="feiyong"
									value="${session.feiyong}"  style="font-size:20px"/>
								</td>
							</tr>
							<tr>
								<td style="font-size:20px" >账户余额：</td>
								<td style="font-size:20px"><input type="button" id="balance"
									value="${session.user.balance}" style="font-size:20px" />
								</td>
							</tr>
							<tr>
								<td><input type="hidden" id="userid"
									value="${session.user.id}" style="font-size:20px"/>
								</td>
							</tr>
							<tr>
								<td style="font-size:20px">剩余余额：</td>
								<td style="font-size:20px"><input type="button" id="leftbalance"
									value="${session.user.balance-session.feiyong}" style="font-size:20px"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><input type="button" value="去支付" onClick="zhifu()"
									style="margin-top:20px;color:red;font-size:20px"/>
								</td>
							</tr>
						</table>
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
</body>
</html>