<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listAdvice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<body>
	<center>
		<h1>用户信息</h1>
		<table border="2" width="700">
			<tr>
				<th>评论id</th>
				<th>评论时间</th>
				<th>评论内容</th>
				<th>用户id</th>
				<th>用户名</th>
				<th>删除</th>
			</tr>

			<s:iterator value="pageBean.list" var="bean">
				<tr>
					<td align="center"><s:property value="#bean.id"/></td>
					<td align="center"><s:property value="#bean.createdtime"/></td>
					<td align="center"><s:property value="#bean.message"/></td>
					<td align="center"><s:property value="#bean.user_id"/></td>					
					<td align="center"><s:property value="#bean.username"/></td>
					<td align="center"><a href="${request.contextPath}/Parking/UserAction!delete.action?id=${bean.id} ">删除</td>
				</tr>

			</s:iterator>
			共<s:property value="pageBean.allRow"/>条记录
			共<s:property value="pageBean.totalPage"/>条记录
			当前第<s:property value="pageBean.currentPage"/>页<br/>
			
			
			<s:if test="%{pageBean.currentPage==1}">第一页   上一页</s:if>
			<s:else>
				<a href="${request.contextPath}/Parking/UserAction/listAdvice.action?page=1">第一页</a>
				<a href="${request.contextPath}/Parking/UserAction/listAdvice.action?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
			</s:else>
			<s:if test="%{pageBean.currentPage!=pageBean.totalPage}">	
				<a href="${request.contextPath}/Parking/UserAction/listAdvice.action?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
				<a href="${request.contextPath}/Parking/UserAction/listAdvice.action?page=<s:property value="%{pageBean.totalPage"/>">最后一页</a>
			</s:if>
			<s:else>
			下一页   最后一页
			</s:else>
		</table>
	</center>
</body>
</html>
