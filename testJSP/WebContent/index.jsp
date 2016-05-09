<%@page import="java.util.Date"%>
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
		Date d = new Date();
		int h = d.getHours();
		if (h > 12)
			out.print("下午好");
		else
			out.print("下午好");
	%>

	<%!int add(int a, int b) {
		return a + b;
	}%>

	<%
		for (int i = 0; i <= 5; ++i) {
	%>
	<div style="font-size:<%=20 + i%>px">测试jsp</div>
	<%
		}
	%>

	1 + 2 =<%=add(1,2) %>

	<font size=5> <%cnt++; %>
		<p>
			您是第
			<%=cnt%>
			个访问本站的客户 个
		</p> <%!int cnt=0; %>
	</font>

	<jsp:include page="time.jsp">
		<jsp:param name="param1" value="Current Time: " />
	</jsp:include>

	<%-- response.setHeader("refresh", "5 ; http://www.wust.edu.cn"); --%>

	<form action="show.jsp">
		姓名<input type="text" name="username"> <br> 选出你喜欢吃的水果： <br>
		<input type="checkbox" name="cb1" value="apple">苹果 <input
			type="checkbox" name="cb1" value="watermelon">西瓜 <input
			type="checkbox" name="cb1" value="桃子">桃子 <input
			type="checkbox" name="cb1" value="grape">葡萄 <br> <input
			type="submit" value="提交">
	</form>


	<form action="1.jsp">
		Username<input type="text" name="username"> <input
			type="submit" value="提交">
	</form>

	<form action="logcheck.jsp">
		Username: <input type="text" name="username"> Password: <input
			type="password" name="password"> <input type="submit"
			value="Log in">
	</form>

</body>
</html>