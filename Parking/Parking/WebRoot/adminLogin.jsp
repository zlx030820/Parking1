<%@ page contentType="text/html;charset=GB2312"%>
<head>
<style type="text/css">
<!--
body {
	background-color:#ADD8E6;
}
.STYLE6 {font-size: 24px; color: #FF0000; }
.STYLE15 {color: #0000FF}
.STYLE17 {font-size: 24px}
.STYLE19 {color: #009933}
.STYLE20 {font-size: 36px}
-->
</style>
<link rel="stylesheet" type="text/css" href="css/styles.css">

<script src="js/cloud.js" type="text/javascript"></script>
<script src="sweetalert.min.js"></script> 
<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>

</head>
<html>
<body >
<div align="center"><span class="STYLE20"><span class="STYLE19">园区停车场管理系统</span>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>Welcome</h1>
			
			<form class="form">
				<input name="username" type="text" class="loginuser" id="username" placeholder="Username">
			<input name="password" type="password" class="loginpwd" id="password" placeholder="Password">
				<button  name="" type="button" class="loginbtn" value="登录"  onclick="adminlogin()"  id="login-button">Login</button>
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>
</body>
<script>
$('#login-button').click(function (event) {
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
});
</script>
<script type="text/javascript">
  
	function adminlogin() {
		var htmlobj = $.ajax({
			url : "UserAction!adminlogin.action",
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
</html>