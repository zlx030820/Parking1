<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <style>
	ul#nav{ width:100%; height:60px; background:#00A2CA;margin:0 auto} 
ul#nav li{display:inline; height:60px} 
ul#nav li a{display:inline-block; padding:0 300px; height:60px; line-height:60px;
 color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/ 
	</style>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="sweetalert.min.js"></script> 
<script type="text/javascript">

  	function deletePark(input, index,id) {
  	    
		 if(confirm('您确定删除吗？'))
		{
		
		var htmlobj = $.ajax({
			url : "ParkAction!delete.action?id="+id,
			type : "POST",
			data : {
				"id" : $("#id").val()
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
	      swal({
				title : error,
				showCancelButton : true,
				showConfirmButton : false,
				cancelButtonText : "确认",
				
			});
		}
	}
	
	}
	 function deletePar() {
              
               {
                  var id=document.getElementById("id").value
                  
                   window.location.href="${request.contextPath}/Parking/ParkAction!delete.action?id="+id;
               }
           }; 
</script> 
  </head>
  
  <body>
  <h2 align="center" style="color:#0000FF;">停车场管理</h2>
    <ul id="nav" align="center"> 
        
        <li><a href="index.jsp">返回首页</a></li> 
        <li><a href="admin.jsp">管理员操作</a></li> 
        
    </ul>  
<table border="2" width="100%;" align="center" >
			<tr>
				<th >停车场名字：</th>
				<th >x</th>
				<th >y</th>
				<th>车位数目</th>
				<th>创建时间</th>
				<th>空余车位数</th>
               <th>操作</th>
               <th>更改</th>
                <th></th>

			</tr>
			<c:forEach items="${parklist}" var="bean" varStatus="i"> 
				<tr>
					<td align="center" >${bean.name}</td>
					<td align="center" >${bean.x}</td>
					<td align="center" >${bean.y}</td>
					<td align="center" >${bean.spaceNum}</td>
					<td align="center" >${bean.createdtime}</td>
					<td align="center" >${bean.leftNum}</td>
			<td><input type="button" value="删除" onClick="deletePark(this,'${i.index+1}','${bean.id}')"id="#bean.index+1" value="${bean.id}"></td>
			<td><a href="ParkAction!Update.action?id=${bean.id}"><input type="button" value="更改信息"></a></td>
			<td><input type="hidden" id="#bean.index+1" value="${bean.id}"/></td> 
				</tr>
			</c:forEach>
			
		</table>
				<center><a href="addparking.jsp"><input type="button" value="添加新的停车场"></a></center>
  </body>
</html>
