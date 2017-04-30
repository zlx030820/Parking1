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
	<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<style>
	ul#nav{ width:100%; height:60px; background:#00A2CA;margin:0 auto} 
ul#nav li{display:inline; height:60px} 
ul#nav li a{display:inline-block; padding:0 120px; height:60px; line-height:60px;
 color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/ 
	</style>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
  
	function login() {
		var htmlobj = $.ajax({
			url : "ParkAction!getSpaceByParkId.action",
			type : "POST",
			data : {
				"num" : $("#num").val(),
				"using" : $("#using").val(),
			},
			async : false
		});
		var jsonresult = JSON.parse(htmlobj.responseText);
		var result = jsonresult.flag;
		var error = jsonresult.error;
		if (result) {
			location.href = "index.jsp";

		} else {
		/* $.MsgBox.Alert("温馨提示：", error);  */
		/* alert("温馨提示：用户名或密码错误"); */
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
  <h1 align="center">园区车位管理系统</h1>
  用户${user.id}欢迎您
 
    <ul id="nav"> 
    <li><a href="${request.contextPath}/Parking/UserAction!userMessage.action?id=${user.id}">查看个人信息</a></li> 
    <li><a href="index.jsp">返回首页</a></li> 
</ul> 
 <br>
  <br>
   <br>
<center>
		<table border="2" width="700">
			<tr>
				<th >车位号</th>
				<th>是否有车</th>
               <th>操作</th>

			</tr>

			<c:forEach items="login()" var="bean">
				<tr>
					<td align="center">${bean.num}</td>
					<td align="center">${bean.using}</td>
				
					<td align="center"><a
						href="LoginAction!delete.action?id=${bean.userid}" />停车</td>
					
				</tr>

			</c:forEach>

		</table>
		
	</center>
  </body>
</html>
