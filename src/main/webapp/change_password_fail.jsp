<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
failed password change page 
 -->
<head>
<meta charset="ISO-8859-1">

<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/login.css" />

<title>Success password change</title>

<script>
	// Function to redirect to another page after a specified time (in milliseconds)
	function redirectToPage() {
		setTimeout(function() {
			window.location.href = "change_password.jsp"; // Replace with the actual target page URL
		}, 9000); // NOT - 3000 milliseconds (3 seconds) delay before redirection
	}

	// Call the redirect function when the page loads
	window.onload = redirectToPage;
</script>

</head>

<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>

<body>
	<div class="col1">
		<a href="index.html"><img id="loginImage"
			src="media/logo_black.png" alt="Moffat Bay Lodge Graphic Logo" /></a>
	</div>

	<div class="password_container">
		<h2>Failed to Change Password</h2>
		<br />
		<br />
		<p id="failpassword">
			Please ensure your email is correct and <br> password
			requirement are met.
		</p>
		<br />
		<br />
		<p>
			If this page doesn't automatically direct you, please click <a
				id="login_link" href="change_password.jsp">here</a>
		</p>

	</div>
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>

</body>
</html>