<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN'
        'http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd'>

<html lang="en">
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Registration success page 
 -->
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
<title>Moffat Bay Lodge Registration Success</title>

<script>
	// Function to redirect to another page after a specified time (in milliseconds)
	function redirectToPage() {
		setTimeout(function() {
			window.location.href = "login.jsp"; // Replace with the actual target page URL
		}, 9000); // NOT - 3000 milliseconds (3 seconds) delay before redirection
	}

	// Call the redirect function when the page loads
	window.onload = redirectToPage;
</script>
</head>
<body>
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	<!--Body of web page-->
	<div class="flexContainer">
		<div class="container_form">
			<img src="media/logo_black.png" id="logo" width="200">
			<h1 class="form__title">Thank you for registering!</h1>

			<p class="form__input-terms">Please login using your credentials</p>
			<p class="form__input-terms">
				If this page does not automatically direct you, please click <a
					href="login.jsp">here.</a>
			</p>
		</div>
	</div>
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>