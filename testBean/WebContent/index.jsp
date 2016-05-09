<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<form action="test.jsp"> -->
<!-- 		长<input type="text" name="l"><br> -->
<!-- 		宽<input type="text" name="w"><br> -->
<!-- 		高<input type="text" name="h"><br> -->
<!-- 		<input type="submit" value="提交"> -->
<!-- 	</form> -->
	<form action="test.jsp">
		长<input type="text" name="length"><br>
		宽<input type="text" name="width"><br>
		高<input type="text" name="height"><br>
		<input type="submit" value="提交">
	</form>


	<jsp:useBean id="box" class="beans.Box"></jsp:useBean>
	<jsp:setProperty property="length" name="box" value="3.0" />
	<jsp:setProperty property="width" name="box" value="4.0" />
	<jsp:setProperty property="height" name="box" value="5.0" />

	长方体的长度为：<jsp:getProperty property="length" name="box" /><br>
	长方体的宽度为：<jsp:getProperty property="width" name="box" /><br>
	长方体的高度为：<jsp:getProperty property="height" name="box" /><br>

	<%
		out.print("长方体的容积为：" + box.getCV());
	%>

</body>
</html>