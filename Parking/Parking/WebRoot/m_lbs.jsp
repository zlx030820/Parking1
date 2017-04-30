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
<script type="text/javascript" src="js/sweetalert.min.js">
	
</script>
<link rel="stylesheet" href="js/sweetalert.css" type="text/css"></link>
<script type="text/javascript" src="js/sweetalert-dev.js"></script>
<link rel="stylesheet" href="css/m_updatepark_style.css" type="text/css"
	media="all" />

<style type="text/css">
body,html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=ltLhexaWUKi1EfkutsXPMEBWA1ZqHNB0"></script>
<title>地图展示</title>
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
					<a href="UserAction!findAllAdvice.action">用户评价信息</a>
					<span>|</span> <a href="m_adminlogin.html">管理员登录</a> <span>|</span> 
					<span>|</span> <a href="m_login.html">普通用户登录</a>
				</div>
			</div>
			<!-- End Logo + Top Nav -->

			<!-- Main Nav -->
			<div id="navigation">
			</div>
			<!-- End Main Nav -->
		</div>
	</div>
	<!-- End Header -->
	<div id="allmap"></div>
</body>
</html>
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
			 location.href = "ParkAction!getSpaceByParkId.action?park_id="+id;
		});
	}
	setText('${id}');
</script>

</html>
