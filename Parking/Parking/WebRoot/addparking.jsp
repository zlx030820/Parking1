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
li{
   list-style-type :none;
}
</style>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="sweetalert.min.js"></script> 
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
<html><body >
<div align="center"><span class="STYLE20"><span class="STYLE19">园区停车场管理系统</span>
<font size="2"></span><br>
  <br>
</div>

<div class="loginbox" >
    
    <ul style="margin-left:520px;">
   <li>&nbsp;&nbsp;名字：<input name="username" type="text"  id="name"/></li>
    <li>&nbsp;x坐标：<input name="x" type="text"  id="x"/></li>
    <li>&nbsp;x坐标：<input name="y" type="text"  id="y"/></li>
    <li >车位数：<input name="spaceNum" type="text"  id="spaceNum"/></li>
    <li style="margin-top:20px;margin-left:90px">
    <input name="" type="button" value="添加"  onclick="addPark()"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

    </ul>
    
    </div>
</body></html>