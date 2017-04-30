<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
#nav {
	width: 100%;
	height: 100px;
	background: #00A2CA;
	margin: 0 auto
}

ul#nav li {
	display: inline;
	height: 60px;
	margin-left:100px
}

ul#nav li a {
	display: inline-block;
	padding: 0 30px;
	height: 60px;
	line-height: 60px;
	color: #FFF;
	font-family: "\5FAE\8F6F\96C5\9ED1";
	font-size: 16px
}

ul#nav li a:hover {
	background: #0095BB
} /*设置鼠标滑过或悬停时变化的背景颜色*/
</style>

<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="sweetalert.min.js"></script> 
<script type="text/javascript">
  
	function user() {
		var htmlobj = $.ajax({
			url : "UserAction!userList.action",
			type : "POST",
			async : false
		});
		var jsonresult = JSON.parse(htmlobj.responseText);
		var result = jsonresult.flag;
		var error = jsonresult.error;
		if (result) {
			location.href = "admin.jsp";

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
  <h1 align="center" style="color:#00FF00;">园区车位管理系统</h1>

    <ul id="nav" align="center"> 
    <li><a href="${request.contextPath}/Parking/UserAction!userList.action" >用户管理</li> 
    <li><a href="${request.contextPath}/Parking/UserAction!userList1.action">费用操作</a></li> 
    <li><a href="${request.contextPath}/Parking/ParkAction!ParkList.action">停车场操作</a></li> 
   <!-- <li><a href="cheWeiCaozuo.jsp">车位操作</a></li>   -->
    <li><a href="${request.contextPath}/Parking/UserAction!getAdvice.action">评论管理操作</a></li> 
    <li><a href="index.jsp">返回首页</a></li> 

</div>
<br><br><br>
<div align="center">
<img alt="" src="images/che.jpg" width="500" height="300">
</div>
  </body>
</html>
