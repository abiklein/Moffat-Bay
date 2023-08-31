<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/navbar.css" />

</head>
<body>
<!--Navigation Bar-->
<div class="navbar">
    <div class="home"><a id="homeImg" href="index.jsp"><img id="navImage" src="media/nav_logo.png" alt="Moffat Bay Lodge Text Logo"/></a></div>
    <a class="rightNav" href="">Reserve</a>
    <a class="rightNav" href="">Attractions</a>
    <a class="rightNav" href="">About Us</a>
    <div class="account rightNav">
        <button class="dropbtn">Account
            <img class="dropIcon"src="media/drop_icon.png" alt="drop down icon"/>
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a class="drop1" href="login.jsp">Login</a>
            <a class="drop2" href="register.jsp">Register</a>
            <a class="drop3" href="#">Reservation Search</a>
        </div>
    </div>
</div>
</body>
</html>