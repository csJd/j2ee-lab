<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String username = (String)session.getAttribute("username");
	if(username!=null && !username.isEmpty()){
		out.print("欢迎， " + username);
	}
	else{
		out.print("你还没有登录，3秒后自动跳往登录页面");
		response.setHeader("refresh", "3;login.jsp");
	}
	%>
</body>
</html>