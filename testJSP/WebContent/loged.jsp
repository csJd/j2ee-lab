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
		if(session.getAttribute("username")==null){
			out.print("You haven't loged in!, you can login in 3 seconds");
			response.setHeader("refresh", "3;index.jsp");
		}
		else{
			out.print("Welcome! "+session.getAttribute("username"));
			out.print("<a href = 'logout.jsp'>logout</a>");
		}
	%>
</body>
</html>