<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Login error page 
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Error: Login</title>
</head>
<body>
	<%
		if (response.getStatus() == 500) {
	%>
	<font color="red">Error: <%=exception.getMessage()%></font>
	<br>

	<%-- include login page --%>
	<%@ include file="login.jsp"%>
	<%
		} else {
	%>
	Hi There, error code is
	<%=response.getStatus()%><br> Please go to
	<a href="index.html">home page</a>
	<%
		}
	%>
</body>
</html>