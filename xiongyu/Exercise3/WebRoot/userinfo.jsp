<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
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
  <h3><a href="UserAdd.action">添加用户</a></h3>
    <table>
    	<tr>
    		<th>编号</th>
    		<th>用户名</th>
    		<th>密码</th>
    		<th colspan="2">操作</th>
    	</tr>
    	<c:forEach items="${result.datas }" var="user">
   		<tr>
   			<td>${user.id }</td>
   			<td>${user.username }</td>
   			<td>${user.password }</td>
   			<td><a href="UserEdit.action?user.id=${user.id }">编辑</a></td>
   			<td><a href="UserDelete.action?user.id=${user.id }">删除</a></td>
   		</tr>
    	</c:forEach>
    </table>
  </body>
</html>
