<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
	ul#nav{ width:100%; height:60px; background:#00A2CA;margin:0 auto ;} 
ul#nav li{display:inline; height:60px} 
ul#nav li a{display:inline-block; padding:0 100px; height:60px; line-height:60px;
 color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/ 
	</style>
<script type="text/javascript">

function shiyong(input, index, shiyong,id){
	if (shiyong==1) {
			input.style.disabled="true";
			input.style.backgroundColor='red';
			alert("该车位被使用,无法停车");
		}
	else {
			if (shiyong==0) {
			input.style.backgroundColor='green';
			 input.innerHTML="欢迎停车"; 
			  var administra=document.getElementById("administra").value;			  
			  if(administra==1){
			  alert("您是管理员，不能停车！");
			  window.location.href="Chewei.jsp";
			  }
			    var id1=document.getElementById("userId").value;  
			      if(id1==null||id1==0){
			      alert("您还未登陆");
			  window.location.href="Chewei.jsp";
			  }else{
			     if(administra==0&&id1!=null){
			       if(confirm("您确定要停车吗？")){
			       var id2 = document.getElementById("spaceId").value;
			       window.location.href="ParkAction!addSpace.action?id="+id; 
			    }}
			    }
			   } 
		  }; 
	  }
	  
	  
	  
	  function userMessage(){
	  	var id3=document.getElementById("userId").value;
	   window.location.href="UserAction!userMessage.action?id="+id3; 
	}

		function exitSystem(){
		if(confirm("确定要退出系统？")){
		window.location.href="UserAction!loginOut.action"; 
		};
	}
	
function bian(){
   var aaa = document.getElementById("aaa");
	

	if (aaa.value==1) {
			aaa.style.backgroundColor='red';
			aaa.innerHTML="该车位被使用";
		}
		else {
			if (aaa.value==0) {
			aaa.style.backgroundColor='green';
			  aaa.innerHTML="欢迎停车"; 
			 
			
		  }
	  }

}

</script> 
  </head>
  
  <body>
  <h1 align="center">园区车位管理系统</h1>
    <ul id="nav" > 
    <li><a href="index.jsp">返回首页</a></li> 
   
    <c:if test="${session.user==null}"><li><a href="userLogin.jsp">用户登录</a></li></c:if>
    <c:if test="${session.user!=null&&session.user.administra==0}">
    <input type="button"  id="username" value="用户${user.username}，欢迎您" onClick="userMessage()"/>
    </c:if>
    <c:if test="${session.user==null}"> <li>
    <a href="userRegister.jsp">用户注册</a></li>
    </c:if>
   <c:if test="${session.user.administra==0}" >
   <li><a href="${request.contextPath}/Parking/UserAction!userMessage.action?id=${user.id}">查看用户信息</a></li>
   </c:if> 
<c:if test="${session.user!=null}">
<li><input type="button" id="exitSystem" value="退出系统" onClick="exitSystem()"/></li>
</c:if>
</ul> 
<br>
<div>
	<center>
		<h1>用户信息</h1>
		  <table border="1" width="700">
			<tr>
			    <th>停车号</th>
				<th>是否使用</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			 <c:forEach items="${spaces}" var="bean" varStatus="i"> 
				<tr>
				    <td align="center" >${bean.num}号</td>
				 <%--   <td align="center" class="aaa">${bean.shiyong}</td>  --%>
				   <td align="center" ><input type="button" id="#bean.index+1" onclick="shiyong(this,'${i.index+1}','${bean.shiyong}','${bean.id}')" value="${bean.shiyong}" class="aaa"  ></td> 
					<td align="center" ><input type="hidden" id="userId" value="${session.user.id}"></td>
					<td align="center" ><input type="hidden" id="spaceId"  value="${bean.id}" ></td>
					<td align="center" ><input type="hidden" id="administra" value="${session.user.administra}"></td>									<%--  <td align="center" ><input type="hidden" id="park_id" value="${bean.park_id}"></td>  --%>
				</tr>
			</c:forEach> 
  			 
		</table>  
		</div>
  </body>
  
</html>
