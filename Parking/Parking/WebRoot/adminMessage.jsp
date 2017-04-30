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
</head>
<html><body >
<div align="center"><span class="STYLE20"><span class="STYLE19">园区停车场管理系统</span>
<font size="2"></span><br>
  <br>
</div>
<center>
  <form action="helpLogin" method="post">
<table width="436" height="364" border="0" align="center">
<tr>
  <th width="363" height="26">
  <div align="center">
  <span class="STYLE15"> <a href="index.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="STYLE17">请 您 登 录&nbsp;&nbsp;&nbsp;&nbsp;</span></span>
  
  </div></th>
</tr>

<tr ><td height="37"><span class="STYLE6">用户名：</span>
  ${bean.userid}</td>
</tr>
<tr><td height="35"><span class="STYLE6">密&nbsp;&nbsp;&nbsp;码:</span>
  ${bean.userid}</td>
</tr>

</table>
<br><input type="submit" name="g" value="修改个人信息" height="30" width="40">

</form>
</center>
</body></html>