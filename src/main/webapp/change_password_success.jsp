<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Successful password change page
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

<title>Success! Password Changed</title>

<script>
	// Function to redirect to another page after 10 seconds
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
<!-- Navbar. -->
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
<div class="spacer"></div>	
<div class="flexContainer">
<div class="spacer" id="bottom">
	<div class="passContainer">
	<img src="media/logo_black.png" id="success_password_change_logo" width="200"><br />

	<div class="password_container">
		<h1>Your password has been changed.</h1>
		<br />

		<p>Please login using your new credential.</p>
		<br />
		<p>
			If this page doesn't automatically direct you in  <span id="time"></span> seconds, please click <a 
				id="login_link" href="login.jsp">here</a>.
		</p>
		<br />
		<br />
	</div>
	</div>
	</div>
	</div>
	<div class="spacer"></div>

	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>