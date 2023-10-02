<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Login page
 -->
<head>
<meta charset="ISO-8859-1">
<!--Fonts-->

<!--Poppins-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap"
	rel="stylesheet">
	
<!--P22 Eaglefeather-->
<link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">

<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/login.css" />

<title>Login</title>
</head>
<body>
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>

	<!-- Login form body -->

	<div class="flexContainer">
		<div class="spacer" id="bottom">
		<div class="containContainer">
		
		<div class="loginContainer">

			<!-- create login form -->
			<h1>Welcome Back!</h1>
			<form class="login_form" method="post" action="login_validation.jsp">
				<div class="error_login">
					<%
					//print error message if invalid credentials
					String msg = request.getParameter("msg");
					if ("invalid".equals(msg)) {
					%>
					<h4>
						Invalid Password <br> Please check your credential <br>
						and try again
					</h4>
					<%
						}
					if ("User not found".equals(msg)) {
					%>
					<h4>
						Email not found <br> Please Create Account <a
							class="link_register" href='registration.jsp'> here</a>
					</h4>
					<%
						}
					%>
				</div>
				<br /> <input id="username" type='email' name='username' size='40'
					maxlength='75' autofocus placeholder="Email Address" required /><br />
				<br /> <input id="password" type='password' name='password'
					size='40' maxlength='75' placeholder="Password" required /><br />
				<br />
				<button id="button" type='submit' name='submit'>Sign In</button>
				<br /> <br />
				<p>
					<a class="link_reset_password" href='change_password.jsp'>Forgot
						Password?</a>
				</p>
				<p id="no_account">
					Don't have an account? &nbsp;&nbsp; <a class="link_register"
						href='registration.jsp'>Register</a>
				</p>
			</form>
		</div>
		</div>
		<div class="spacer" id="belowTxtSpace"></div>
		<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
		</div>
	</div>
	
</body>
</html>