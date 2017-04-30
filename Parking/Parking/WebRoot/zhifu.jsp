<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	ul#nav{ width:100%; height:60px; background:#00A2CA;margin:0 auto} 
ul#nav li{display:inline; height:60px} 
ul#nav li a{display:inline-block; padding:0 300px; height:60px; line-height:60px;
 color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/ 
body {
background:;
}
	</style>
<script >
var t1=document.getElementById("t1").value;
alert{"t1"};
var t2=document.getElementById("t2").value;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
java.util.Date date1 = formatter.parse(t1);
java.util.Date date2 = formatter.parse(t2);
var diff = date1 .getTime() - date2 .getTime();
var days = diff / (1000 * 60 * 60 * 24);
alert(days);
</script>
<script type="text/javascript">
	function zhifu(){
	var b1=document.getElementById("feiyong").value;
	var b2=document.getElementById("balance").value;
	var id=document.getElementById("userid").value;	
	var balance=document.getElementById("leftbalance").value;	

	if(balance>0||balance==0){

		alert("支付成功，自动跳转到评论页面");
		window.location.href="UserAction!updateaccount.action?id="+id+"&balance="+balance;
	}
	else{
		alert("您的余额不足！");
	};
}
</script>
</head>

<body>
<h2 align="center" style="color:#0000FF;">园区管理系统</h2>
    <ul id="nav" align="center"> 
        
        <li><a href="index.jsp">返回首页</a></li> 
        <li><a href="admin.jsp">管理员操作</a></li> 
        
    </ul>  
<table align="center" style="margin-top:100px;">
			<tr>
				<td>停车时间：</td>
				<td id="t1">${session.outSpace.start_time}</td>
			</tr>
			
			<tr>
				<td>结束时间：</td>
				<td id="t2">${session.outSpace.end_time}</td>
			</tr>
			<tr>
				<td>应付费用：</td>
				<td><input type="button" id="feiyong" value="${session.feiyong}"/></td>
			</tr>
			<tr>
				<td>账户余额：</td>
				<td><input type="button" id="balance" value="${session.user.balance}"/></td>
			</tr>
			<tr>
				<td ><input type="hidden" id="userid" value="${session.user.id}"/></td>
			</tr>			
		<tr>
				<td>剩余余额：</td>
				<td id="t5"><input type="button" id="leftbalance" value="${session.user.balance-session.feiyong}"/></td>
			</tr>		
			<tr>
			<td></td>
				<td><input type="button" value="去支付" onClick="zhifu()" style="margin-top:20px;color:red;"/></td>
			</tr>
	</table>
</body>
</html>