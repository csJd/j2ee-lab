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
		String err = (String) session.getAttribute("err");
		if (err != null) {
	%>
	<div style="color: red;"><%=err%></div>
	<%
		session.removeAttribute("err");
		}
	%>

	<form action ="LoginServlet">
		用户名：<input type="text" name = "username"><br>
		密码： <input type="password" name = "password"><br>
		<input type="submit" value = "登录">
		<input type="reset" valur = "重填"><br><br><br>
	</form>
	
	<form action ="RegServlet">
		用户名：<input type="text" name = "username"><br>
		密码： <input type="password" name = "password"><br>
		<input type="submit" value = "注册">
		<input type="reset" valur = "重填">
	</form>
</body>
</html>