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

<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=ltLhexaWUKi1EfkutsXPMEBWA1ZqHNB0"></script>

<style type="text/css">
body,html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
</style>

<link rel="stylesheet" href="js/sweetalert.css" type="text/css"></link>
<script type="text/javascript" src="js/sweetalert-dev.js"></script>
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
					<strong style="font-size:14px">欢迎您:</strong> <a>${session.userMessage.username}</a>
					<span>|</span> <a>帮助</a> <span>|</span> <a>个人资料</a>
					<span>|</span> <a href="UserAction!loginOut.action">退出登录</a>
				</div>
			</div>
			<!-- End Logo + Top Nav -->

			<!-- Main Nav -->
			<div id="navigation">
				<ul>
					<li><a href="m_user_home.jsp" class="active"><span>地图导航</span> </a>
					</li>
					<li><a href="UserAction!userMessage.action?id=${user.id}"><span>个人资料</span> </a>
					</li>
					<li><a href="ParkAction!getMySpace.action" ><span>正在停车</span></a></li>
					<li><a href="UserAction!findAllAdvice.action" ><span>系统评语</span></a></li>
				</ul>
			</div>
			<!-- End Main Nav -->
		</div>
	</div>
	<!-- End Header -->
	<!-- Container -->
	<div id="container">
		<div class="shell">
			<div id="allmap"></div>
		</div>
	</div>

	

	<!-- Footer -->
	<div id="footer">
		<div class="shell" text-align="center">
			<span class="left">Copyright &copy; 2017.园区停车管理系统</span> <span
				class="right"> version 1.0 </span>
		</div>
	</div>
	<!-- End Footer -->
	
	<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11); // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
	map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
</script>

<script type="text/javascript">
	function setText(id) {
		var htmlobj = $.ajax({
			url : "ParkAction!ParkList2.action",
			type : "POST",
			data : {},
			async : false
		});
		var jsonresult = JSON.parse(htmlobj.responseText);
		var result = jsonresult.park;
		var parklist = jsonresult.parklist;
		for ( var i = 0; i < parklist.length; i++) {
			var park = parklist[i];
			var x = park.x;
			var y = park.y;
			var point = new BMap.Point(x, y);
			var marker = new BMap.Marker(point);// 创建标注
			map.addOverlay(marker); // 将标注添加到地图中
			var label = new BMap.Label(park.name, {
				offset : new BMap.Size(20, -10)
			});
			marker.setLabel(label);
			addClickHandler(park.id, marker);
		}
	}
	function addClickHandler(id, marker) {
		marker.addEventListener("click", function(e) {
			 location.href = "ParkAction!getSpaceByParkId2.action?park_id="+id;
		});
	}
	setText('${id}');
</script>
	
</body>
</html>
