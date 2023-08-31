<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE>
<html lang="en">
<head>
    <!-- CSS Files -->
    <!-- CSS Files -->
    <!-- CSS Files -->
    <link rel="stylesheet" href="css/navbar.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/login.css" />
    
   

<title>Login Page</title>
</head>

<body>

<div class="nav"><jsp:include page="navbar.jsp" flush="true"/></div>

<!-- Login form body -->

<div class="flexContainer">

   	<div class="spacer"></div>
	<div class = "loginContainer">
	
	<!-- create login form -->
		<h1>Login Page</h1>
		<form class= "login_form" method= "post" action="validate.jsp">
			
			<input id= "username" type='email' name='username' size='40' maxlength='75' autofocus placeholder="Email Address" required /><br /><br />
			<input id= "password" type='password' name='password' size='40' maxlength='75' placeholder="Password" required /><br /><br />
			<button id = "button" type='submit' name ='submit'>Sign in</button><br /><br />
			<p> <a class= "link_reset_password" href = ''>Forget Password?</a> </p>
			
			<!-- <a href = "registration.jsp> -->
			<p id= "no_account">Don't have an account? &nbsp;&nbsp; <a class= "link_register" href = ''>Register</a> </p> 
			
		
		</form>
	</div>
	<div class="footer"><jsp:include page="footer.jsp" flush="true"/></div>
	</div>
</body>
</html>