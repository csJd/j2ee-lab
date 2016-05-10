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
  	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try {
			Class.forName(JDBC_DRIVER);
			connection = DriverManager.getConnection(JDBC_URL, JDBC_NAME, JDBC_PASSWORD);
			String sql = "select id,username,password from user";
			List<Map<String,Object>> results = new ArrayList<>();
			int count = 0;
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				int id = rs.getInt("id");
				String name = rs.getString("username");
				String password = rs.getString("password");
				Map<String,Object> user = new HashMap<>();
				user.put("id", id);
				user.put("name", name);
				user.put("password", password);
				results.add(user);
				count++;
			}
			request.setAttribute("results", results);//将结果集设置到request域中，供页面调用
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
   %>
  <body>
  <h3><a href="useradd.jsp">添加用户</a></h3>
    <table>
    	<tr>
    		<th>编号</th>
    		<th>用户名</th>
    		<th>密码</th>
    		<th colspan="2">操作</th>
    	</tr>
    	<c:forEach items="${results}" var="user">
   		<tr>
   			<td>${user.id }</td>
   			<td>${user.name }</td>
   			<td>${user.password }</td>
   			<td><a href="useredit.jsp?user_id=${user.id }">编辑</a></td>
   			<td><a href="userdeleteCommit.jsp?user_id=${user.id }">删除</a></td>
   		</tr>
    	</c:forEach>
    </table>
  </body>
</html>
