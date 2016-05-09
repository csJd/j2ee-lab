<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="show" method="post">
		输入：
		<input type = "text" name = "a">
		<input type = "submit" value = "提交"><br><br>
	</form>
	
	<form action="calc" method = "get">
		start的值： <input type = "text" name = "start"><br>
		end的值： <input type = "text" name = "end"><br>
		
		<input type = "submit" value = "计算">
		<input type = "reset" value = "重置"><br><br>
	</form>
</body>
</html>