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
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/pass.css" />

<!-- Title of your web page -->
<title>Success! Registration</title>

<script>
//Function to redirect to another page after 10 seconds
var time = 0;

function myTimer() {
	  var tt = setInterval(function() {
	    var counter = 10 - time;
	    document.getElementById("time").innerHTML = counter;
	    time = time + 1;
	    if (counter === 0) {
	      clearInterval(tt);
	      window.location.href = "login.jsp";
	    }
	  }, 1000);
};

// Call the redirect function when the page loads
window.onload = myTimer;
</script>
</head>
<body>
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	<!--Body of web page-->
	<div class="flexContainer">
	<div class="spacer"></div>
	<div class="passContainer">
		<img src="media/logo_white.png" id="logo" width="200"><br />
		<div class="password_container">
			<h1>Thank you for registering!</h1>
			<br />

		<p>Please login using your new credential.</p>
		<br />
		<p>If this page doesn't automatically direct you in</p>
		<p><span id="time"></span> seconds,</p>
		<p>please click <a id="login_link" href="login.jsp">here</a>.</p>
		</div>
		</div>
		</div>
		<div class="spacer"></div>
		
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>