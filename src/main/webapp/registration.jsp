<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Registration Page
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

<meta charset="ISO-8859-1">
<!-- CSS Files -->
<link rel="stylesheet" href="css/registration.css" />

<title>Register</title>
</head>
<body>
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>

	<!-- Login form body -->

	<div class="flexContainer">
		<div class="spacer"></div>
		<div class="registerContainer">
			<img src="media/logo_white.png" id="logo" width="200">
			<script type="text/javascript" src="js/registrationValidation.js"></script>
			<!-- create login form -->
			<h1>Registration Form</h1>
			<form class="login_form" name="registrationForm"
				action="registration_input.jsp" method="post"
				oninput="return validateForm()">
				<div class="form_message--error" id="errorDiv" style="color: red;">
					<%
						String errorMessage = (String) request.getAttribute("errorMessage");
					if (errorMessage != null) {
						out.println(errorMessage);
					}
					%>
				</div>
				<div class="form_input_group">
					<p class="input_head">Email<p>
					<input class="form_input" type="text" name="email" id="email"
						placeholder="e.g. johnDoe@gmail.com">
					<div class="form_message--error" id="emailError"></div>
				</div>
				<div class="form_input_group">
					<p class="input_head">First Name<p>
					<input class="form_input" type="text" name="firstName"
						id="firstName" placeholder="e.g. John">
					<div class="form_message--error" id="fNameError"></div>
				</div>
				<div class="form_input_group">
					<p class="input_head">Last Name<p>
					<input class="form_input" type="text" name="lastName"
						id="lastName" placeholder="e.g. Doe">
					<div class="form_message--error" id="lNameError"></div>
				</div>
				<div class="form_input_group">
					<p class="input_head">Phone Number<p>
					<input class="form_input" type="text" name="telephone"
						id="telephone" placeholder="e.g. 1231231234">
					<div class="form_message--error" id="phoneError"></div>
				</div>
				<div class="form_input_group">
					<p class="form_input-terms">Password must contain at least:</p>
					<ul class="form_input-terms">
						<li>8 Characters</li>
						<li>1 Uppercase letter</li>
						<li>1 Lowercase letter</li>
					</ul>
					<input class="form_input" type="password" name="password"
						id="password" placeholder="Password">
					<div class="form_message--error" id="pwordError"></div>
				</div>
				<div class="form_input_group">
					<input class="form_input" type="password" name="confPassword"
						id="confPassword" placeholder="Confirm Password">
					<div class="form_message--error" id="confPwordError"></div>
				</div>
				<button class="form_button" type="submit" id="submitBtn"
					value="Register" disabled>Create Your Account</button>
				<div id="terms_block">
					<p class="form_input-terms">
					By creating an account, you agree to our &nbsp; <a class="form_link"
						href="#">Terms</a></p>
				</div>
				<br/> 
				<p class="form_input-terms">
				Already have an account? <a class="form_link"
						href="login.jsp">Sign in</a>
				</p>
				
			</form>
			<script>
				// Add event listeners to perform validation and enable/disable submit button
				var form = document.forms["registrationForm"];
				form.addEventListener("input", toggleSubmitButton); // Listen for input changes
				toggleSubmitButton(); // Initially validate and disable the submit button

				// Function to clear the error message when user starts typing in the email field
				document.getElementById("email").addEventListener("input",
						function() {
							var errorDiv = document.getElementById("errorDiv");
							errorDiv.innerHTML = ""; // Clear the error message
						});
			</script>
		</div>
	</div>
	<div class="spacer"></div>
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>