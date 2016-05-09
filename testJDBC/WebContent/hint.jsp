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
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();//加载驱动程序
	String url = "jdbc:mysql://localhost:3306/testdb";//数据库连接串
	Connection conn = DriverManager.getConnection(url, "root", "9508");//建立连接
	
	String sql = "SELECT * FROM users WHERE username=? and password=?";
	PreparedStatement pStmt = conn.prepareStatement(sql);
 	String username = request.getParameter("username");
 	String password = request.getParameter("password");
 	pStmt.setString(1, username);
 	pStmt.setString(2, password);
 	
 	ResultSet rs = pStmt.executeQuery();
 	if(rs.next()){
 		out.print("你已登录，欢迎 "+username);
	}
	else{
		out.print("用户名或密码错误");
	}
 	
	rs.close();
	pStmt.close();
	conn.close();
%>
</body>
</html>