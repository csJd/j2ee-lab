<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();//加载驱动程序
		String url = "jdbc:mysql://localhost:3306/j2ee";//数据库连接串
		Connection conn = DriverManager.getConnection(url, "root", "9508");//建立连接

		String sql = "SELECT * FROM users";
		PreparedStatement pStmt = conn.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
	%>
	
	<%
		String hint = (String) session.getAttribute("hint");
		if (hint != null) {
	%>
	<div style="color: red;"><%=hint%></div>
	<%
		session.removeAttribute("hint");
		}
	%>

	<div style="font-size: 30px">用户管理</div>
	<table align="center" border="true" width="100%">
		<tr>
			<th>编号</th>
			<th>用户名</th>
			<th>密码</th>
			<th colspan="2">操作</th>
		</tr>
		<%while(rs.next()){%>
		<tr>
			<td align="center"><%=rs.getInt("id") %></td>
			<td align="center"><%=rs.getString("username") %></td>
			<td align="center"><%=rs.getString("password") %></td>
			<td align="center"><a href="edit.jsp?id=<%=rs.getInt("id")%>">编辑</a></td>
			<td align="center"><a href="delete.jsp?id=<%=rs.getInt("id")%>">删除</a></td>
		</tr>
		<%} %>
	</table>

	<br>
	<a href="add.jsp" style="font-size: 25px">添加用户</a>

</body>
</html>