<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!--Fonts-->
    <!--Poppins-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <!--P22 Eaglefeather-->
    <link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">

    <!--Width = device width with an initial scale of 1.0-->
    <meta name ="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">

    <!-- CSS Files -->
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/register.css" />

    <!-- Title of your web page -->
    <title>Moffat Bay Lodge</title>
</head>
<body>
<div class="nav"><jsp:include page="navbar.jsp" flush="true"/></div>
<%@ taglib uri="/WEB-INF/tld/lodgeTag.tld" prefix="db" %>
<%
		//get data for input
        String email = request.getParameter("signupEmail");
        String f_name = request.getParameter("signupFirstName");
        String l_name = request.getParameter("signupLastName");
        String phone = request.getParameter("signupTelephone");
        String pword = request.getParameter("signupPassword");
        String conf_Pword = request.getParameter("signupConfirmPassword");

    %>
    
    <%-- Custom tag to test user input--%>
    
    <%-- custom tag to test passwords--%>
    
    <%-- Custom tag to hash passwords --%>
    
    <%-- Custom Tag to add user input into table --%>
    <db:regUser email="<%= email %>" f_name="<%= f_name %>" l_name="<%= l_name %>"
    phone="<%= phone %>" pword="<%= pword %>" />
    <div class="container">
    	<img src="media/logo_black.png" id="logo" width="200">
    	<h3>Thank you for registering!</h3>
    	
    	<p>Please login using your credentials</p>
    	<p>If this page does not automatically direct you, please click <a href="login.jsp" >here.</a></p>
    </div>
<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>