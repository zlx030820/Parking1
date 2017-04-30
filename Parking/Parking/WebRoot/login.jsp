<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
	
	
	<title>神捷管理员登录系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="sweetalert.min.js"></script> 
<link rel="stylesheet" href="sweetalert.css">
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
<script type="text/javascript">
  
	function login() {
		var htmlobj = $.ajax({
			url : "UserAction!login.action",
			type : "POST",
			data : {
				"username" : $("#username").val(),
				"password" : $("#password").val(),
			},
			async : false
		});
		var jsonresult = JSON.parse(htmlobj.responseText);
		var result = jsonresult.flag;
		var error = jsonresult.error;
		if (result) {
			location.href = "regsuccess.jsp";

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

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
 <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
    
    <div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
     <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <ul>
   <li><input name="" type="text" class="loginuser" id="username"/></li>
    <li><input name="" type="password" class="loginpwd" id="password"/></li>
    <li><input name="" type="button" class="loginbtn" value="登录"  onclick="login()"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><a href="changepwd.jsp">修改密码？</a></label></li>
   <li><a href="userRegister.jsp">注册</a>
    </ul>
    
    </div>
    
    </div>
    
    <div class="loginbm">湖北神捷机器人科技有限公司 版权所有</div>

 </body>
	
</html>
