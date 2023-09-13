<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

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

<title>Change Password</title>
</head>
<body>

	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>

	<!-- Login form body -->

	<div class="flexContainer">
		<div class="col1">
			<!--  <a href="index.html"><img id="loginImage" src="media/logo_black.png" alt="Moffat Bay Lodge Graphic Logo"/></a>-->

		</div>

		<div class="spacer"></div>
		<div class="loginContainer">

			<!-- create Change Password form -->

			<img src="media/logo_black.png" id="logo" width="200">
			<form class="change_password_form" method="post"
				action="change_password_validator.jsp">
				<h1>Change Password</h1>
				<div class="error_login">
					<%
					//print error message if invalid credentials

					String msg = request.getParameter("msg");
					if ("Passwords Do Not Match".equals(msg)) {
					%>
					<h4>Passwords Do Not Match</h4>
					<%
						}
					if ("User not found".equals(msg)) {
						%>
					<h4>
						Email not found <br> Please Create Account <a
							class="link_register" href='userRegistration.jsp'> here</a>
					</h4>
					<%
					}					
					%>
				</div>
				<input id="username" type='email' name='username' size='40'
					maxlength='75' autofocus placeholder="Email Address" required /><br />
				<br />

				<div class="psw_change">
					<p>Password must contain at least:</p>
					<ul>
						<li>8 characters</li>
						<li>1 uppercase letter</li>
						<li>1 lowercase letter</li>
					</ul>
				</div>
				<input id="password" type='password' name='new_password' size='40'
					maxlength='75' placeholder=" New Password" required /><br /> <br />
				<input id="password" type='password' name='conf_password' size='40'
					maxlength='75' placeholder=" Confirm Password" required /><br />
				<br />
				<button id="button" type='submit' name='submit'>Submit</button>
				<br /> <br />

			</form>

		</div>
		<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>