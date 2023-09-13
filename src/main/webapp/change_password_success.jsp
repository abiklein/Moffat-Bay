<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS Files -->
<!-- CSS Files -->
<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/login.css" />

<title>Success password change</title>

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

<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>

<body>
	<div class="col1">
		<a href="index.html"><img id="loginImage"
			src="media/logo_black.png" alt="Moffat Bay Lodge Graphic Logo" /></a>
	</div>

	<div class="password_container">
		<h2>Your password has been changed.</h2>
		<br />
		<br />

		<p>Please login using your new credential.</p>
		<br />
		<br />
		<p>
			If this page doesn't automatically direct you, please click <a
				id="login_link" href="login.jsp">here</a>
		</p>
	</div>

	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>