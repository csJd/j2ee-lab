<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();//加载驱动程序
		String url = "jdbc:mysql://localhost:3306/j2ee";//数据库连接串
		Connection conn = DriverManager.getConnection(url, "root", "9508");//建立连接

		int id = Integer.valueOf(request.getParameter("id"));
		String sql = "SELECT * FROM users where id = ?";
		PreparedStatement pStmt = conn.prepareStatement(sql);
		pStmt.setInt(1, id);
		ResultSet rs = pStmt.executeQuery();
		rs.next();
	%>
	<div style="font-size: 26px">请输入新的用户信息：</div>
	<form action="success.jsp">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" value="<%=rs.getString("username")%>"/></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="text" name="password" value="<%=rs.getString("password")%>"/></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="提交"/> 
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>