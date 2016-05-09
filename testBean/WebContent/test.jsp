<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="box" class="beans.Box"></jsp:useBean>

	<%-- 	
	double l = Double.valueOf(request.getParameter("l"));  
	double w = Double.valueOf(request.getParameter("w")); 
 	double h = Double.valueOf(request.getParameter("h"));
	--%>

	<%-- 	<jsp:setProperty property="length" name="box" value="<%=l%>" /> --%>
	<%-- 	<jsp:setProperty property="width" name="box" value="<%=w%>" /> --%>
	<%-- 	<jsp:setProperty property="height" name="box" value="<%=h%>" /> --%>

	<%-- 	<jsp:setProperty property="length" name="box" param="l" /> --%>
	<%-- 	<jsp:setProperty property="width" name="box" param="w" /> --%>
	<%-- 	<jsp:setProperty property="height" name="box" param="h" /> --%>

	<jsp:setProperty property="*" name="box" />

	长方体的长度为：<jsp:getProperty property="length" name="box" /><br>
	长方体的宽度为：<jsp:getProperty property="width" name="box" /><br>
	长方体的高度为：<jsp:getProperty property="height" name="box" /><br>

	<%
		out.print("长方体的容积为：" + box.getCV());
	%>
</body>
</html>