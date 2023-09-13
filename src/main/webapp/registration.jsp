<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

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
<link rel="stylesheet" href="css/registration.css" />

<!-- Title of your web page -->
<title>Moffat Bay Lodge Registration</title>
</head>
<body>
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	<div class="flexContainer">
		<script type="text/javascript" src="js/registrationValidation.js"></script>
		<!--Body of web page-->
		<div class="container_form">
			<img src="media/logo_black.png" id="logo" width="200">
			<h1 class="form__title">Account Registration</h1>
			<form class="registration_form" name="registrationForm"
				action="registration_input.jsp" method="post"
				oninput="return validateForm()">
				<div class="form__message--error" id="errorDiv" style="color: red;">
					<%
						String errorMessage = (String) request.getAttribute("errorMessage");
					if (errorMessage != null) {
						out.println(errorMessage);
					}
					%>
				</div>
				<div class="form__input-group">
					<input class="form__input" type="text" name="email" id="email"
						placeholder="Email">
					<div class="form__message--error" id="emailError"></div>
				</div>
				<div class="form__input-group">
					<input class="form__input" type="text" name="firstName"
						id="firstName" placeholder="First Name">
					<div class="form__message--error" id="fNameError"></div>
				</div>
				<div class="form__input-group">
					<input class="form__input" type="text" name="lastName"
						id="lastName" placeholder="Last Name">
					<div class="form__message--error" id="lNameError"></div>
				</div>
				<div class="form__input-group">
					<input class="form__input" type="text" name="telephone"
						id="telephone" placeholder="Telephone Number">
					<div class="form__message--error" id="phoneError"></div>
				</div>
				<div class="form__input-group">
					<p class="form__input-terms">Password must contain at least:
					<ul class="form__input-terms">
						<li>8 Characters</li>
						<li>1 uppercase letter</li>
						<li>1 lowercase letter</li>
					</ul>
					</p>
					<input class="form__input" type="password" name="password"
						id="password" placeholder="Password">
					<div class="form__message--error" id="pwordError"></div>
				</div>
				<div class="form__input-group">
					<input class="form__input" type="password" name="confPassword"
						id="confPassword" placeholder="Confirm Password">
					<div class="form__message--error" id="confPwordError"></div>
				</div>
				<button class="form__button" type="submit" id="submitBtn"
					value="Register" disabled>Create Your Account</button>
				<p class="form__input-terms">
					By creating an account, you agree to our <a class="form__link"
						href="#">Terms</a></br> Already have an account? <a class="form__link"
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
		<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
	</div>
</body>
</html>