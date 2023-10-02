<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Change Password Page
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

<title>Change Password</title>
</head>
<body>

	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>

	<!-- Login form body -->

	<div class="flexContainer">

		<div class="spacer" id="bottom">
			<div class="passContainer">
			<!-- create Change Password form -->

			<img src="media/logo_black.png" id="logo" width="200">
			<script type="text/javascript" src="js/changeValidation.js"></script>
			<form class="change_password_form" name="changeForm" method="post"
				action="change_password_validator.jsp" oninput="return validateForm()">
				
				<h1>Change Password</h1> 
				
			<br />
				
				<!-- password change form -->
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
					<input class="form_input" type="text" name="username" id="username"
						placeholder="e.g. johnDoe@gmail.com">
					<div class="form_message--error" id="usernameError"></div>
				</div>
				<br/>
				<br/>
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
				<br/>
				<div class="form_input_group">
					<input class="form_input" type="password" name="confPassword"
						id="confPassword" placeholder="Confirm Password">
					<div class="form_message--error" id="confPwordError"></div>
				</div>
				<br/>
				<button class="form_button" id="submitBtn" type='submit' name='submit'>Submit</button>
				<br /> <br />

			</form>
			<script>
				// Add event listeners to perform validation and enable/disable submit button
				var form = document.forms["changeForm"];
				form.addEventListener("input", toggleSubmitButton); // Listen for input changes
				toggleSubmitButton(); // Initially validate and disable the submit button

				// Function to clear the error message when user starts typing in the email field
				document.getElementById("username").addEventListener("input",
						function() {
							var errorDiv = document.getElementById("errorDiv");
							errorDiv.innerHTML = ""; // Clear the error message
						});
			</script>
			</div>
					<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
			
			</div>
			
		</div>
</body>

</html>