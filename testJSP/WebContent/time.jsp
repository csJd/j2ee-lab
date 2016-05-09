<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% Date now = new Date();%>
<%= request.getParameter("param1") + now.toLocaleString() %>

