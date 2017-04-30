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
<link rel="stylesheet" href="css/demo.css">
		<link rel="stylesheet" href="css/sky-forms.css">
		
		<script src="js/jquery-1.9.1.min.js"></script>
		<script src="js/jquery.validate.min.js"></script>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="sweetalert.min.js"></script> 
<script>
$('#login-button').click(function (event) {
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
});
</script>
<script type="text/javascript">
  	function registe(){
  	var password = document.getElementById('password').value;
  	if (password==12345){
  	register();
  	}
  	else{alert('您不满足注册管理员要求')};
  	}
	function register() {
		var htmlobj = $.ajax({
			url : "UserAction!adminregister.action",
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
			location.href = "adminregsuccess.jsp";

		} else {
		/* $.MsgBox.Alert("温馨提示：", error);  */
		alert("温馨提示：您输入的用户名已被注册，请重新输入");
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
		
			register();
		}
	};
</script> 
</head>
<html><body >
<h1 align="center">园区停车场管理系统</h1>
</div>

<div class="body body-s">
    <div class="wrapper">		
			<form action="" id="sky-form" class="sky-form">
				<fieldset>					
					<section>
						<label class="input">
							<i class="icon-append icon-user"></i>
							<input type="text" name="username"  id="username" placeholder="Username">
							<b class="tooltip tooltip-bottom-right">Needed to 
					enter the website</b>
						</label>
					</section>
					<section>
						<label class="input">
							<i class="icon-append icon-lock"></i>
							<input type="password" name="password" id="password" placeholder="Password" id="password">
							<b class="tooltip tooltip-bottom-right">Don&#39;t forget 
					your password</b>
						</label>
					</section>
				</fieldset>
					
				
				<footer>
					<button type="button" id="login-button" onclick="registe()" class="button">Submit</button>
				</footer>
			</form>	
			</div>		
		</div>
		<script type="text/javascript">
			$(function()
			{
				// Validation		
				$("#sky-form").validate(
				{					
					// Rules for form validation
					rules:
					{
						username:
						{
							required: true
						},
						
						password:
						{
							required: true,
							minlength: 3,
							maxlength: 20
						}
						
						
					},
					
					// Messages for form validation
					messages:
					{
						login:
						{
							required: 'Please enter your login'
						},
						
						password:
						{
							required: 'Please enter your password'
						},
					
					
					},					
					
					// Do not change code below
					errorPlacement: function(error, element)
					{
						error.insertAfter(element.parent());
					}
				});
			});			
		</script>


</body></html>