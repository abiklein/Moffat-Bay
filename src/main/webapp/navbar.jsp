<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

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
		<div class="home">
			<a id="homeImg" href="index.html"><img id="navImage"
				src="media/nav_logo.png" alt="Moffat Bay Lodge Text Logo" /></a>
		</div>
		<a class="rightNav" href="reservation.jsp">Reserve</a> <a class="rightNav"
			href="">Attractions</a> <a class="rightNav" href="">About Us</a>
		<div class="account rightNav">
			<button class="dropbtn">
				Account <img class="dropIcon" src="media/drop_icon.png"
					alt="drop down icon" /> <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a class="drop1" href="login.jsp">Login</a> <a class="drop2"
					href="registration.jsp">Register</a> <a class="drop3" href="#">Reservation
					Search</a>
			</div>
		</div>
	</div>
	<div class="hamburger">
		<nav role="navigation">
			<div id="menuToggle">
				<!--
		    A fake / hidden checkbox is used as click reciever,
		    so you can use the :checked selector on it.
		    -->
				<input type="checkbox" />

				<!--
		    Some spans to act as a hamburger.
		    
		    They are acting like a real hamburger,
		    not that McDonalds stuff.
		    -->
				<span></span> <span></span> <span></span>

				<!--
		    Too bad the menu has to be inside of the button
		    but hey, it's pure CSS magic.
		    -->
				<ul id="menu">
					<li id="welcome">Welcome!</li>
					<a href="login.jsp"><li><img alt="login icon"
							src="media/Login.png" />Sign In</li></a>
					<a href="registration.jsp"><li><img
							alt="register icon" src="media/Register.png" />Register</li></a>
					<a href="reservation.jsp"><li><img alt="reserve icon"
							src="media/BookVaca.png" />Book Your Vacation</li></a>
					<a href="#"><li><img alt="search icon"
							src="media/Search.png" />Search Reservations</li></a>
					<div id="menuGrey">
						<div id="greyLinks">
							<a href="index.html"><li>Home</li></a> <a href="#"><li>Attractions</li></a>
							<a href="#"><li>About Us</li></a>
						</div>
					</div>
				</ul>
			</div>
		</nav>
		<div class="home">
			<a id="homeImg" href="index.html"><img id="navImage"
				src="media/nav_logo.png" alt="Moffat Bay Lodge Text Logo" /></a>
		</div>
	</div>
</body>
</html>