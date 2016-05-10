<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
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
   <%!
  	private static String JDBC_DRIVER = "com.mysql.jdbc.Driver";//MySQL 驱动类
	private static String JDBC_URL = "jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=UTF-8";//连接URL
	private static String JDBC_NAME = "root";//用户名
	private static String JDBC_PASSWORD = "xy196456";//密码
   %>
   
  <%
	String name = request.getParameter("user_name");
	String password = request.getParameter("user_password");

  	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Map<String,Object> user = null;
	int flag = 0;//更新标志
	try {
			Class.forName(JDBC_DRIVER);
			connection = DriverManager.getConnection(JDBC_URL, JDBC_NAME, JDBC_PASSWORD);
			String sql_1 = "select * from user where username=?";//检查是否重名
			String sql_2 = "insert into user(username,password) values(?,?)";//更新
			ps = connection.prepareStatement(sql_1);
			ps.setString(1, name);
			rs  = ps.executeQuery();
			if(!rs.next()){//没有重名则更新
				ps.close();
				ps = connection.prepareStatement(sql_2);
				ps.setString(1, name);
				ps.setString(2, password);
				flag = ps.executeUpdate();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(connection!=null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		response.sendRedirect("index.jsp");
   %>
  <body>
  </body>
</html>
