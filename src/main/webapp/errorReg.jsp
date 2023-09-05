<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN'
        'http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd'>
<html lang="en">
<head>
<!--Fonts-->
<!--Poppins-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap"
	rel="stylesheet">
<!--P22 Eaglefeather-->
<link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">

<!--Width = device width with an initial scale of 1.0-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">

<!-- CSS Files -->
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/registration.css" />

<!-- Title of your web page -->
<title>Moffat Bay Lodge</title>
</head>
<body>
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	<div class="container_form">
		<img src="media/logo_black.png" id="logo" width="200">
		<h3>Uh Oh</h3>
		<div id="errorDiv" style="color: red;">
			<%
				String errorMessage = (String) request.getAttribute("errorMessage");
			if (errorMessage != null) {
				out.println(errorMessage);
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>
