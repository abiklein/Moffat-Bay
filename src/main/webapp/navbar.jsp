<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" href="css/navbar.css" />
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Navbar
 -->
<%
//check if user is logged in
String username = (String) session.getAttribute("username");
String firstName = (String) session.getAttribute("firstName");
String lastName = (String) session.getAttribute("lastName");

if (username == null) {
	// User is not logged in, display not logged in nav bar
%>
<!--Navigation Bar-->
<div class="navbar">
	<div class="home">
		<a id="homeImg" href="index.jsp"><img id="navImage"
			src="media/nav_logo.png" alt="Moffat Bay Lodge Text Logo" /></a>
	</div>
	<a class="rightNav" href="reservation.jsp">Reserve</a> <a
		class="rightNav" href="attractions.jsp">Attractions</a> 
		<a class="rightNav" href="about.jsp">About Us</a>
	<div class="account rightNav">
		<button class="dropbtn">
			Account <img class="dropIcon" src="media/drop_icon.png"
				alt="drop down icon" /> <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
			<a class="drop1" href="login.jsp">Login</a> 
			<a class="drop2" href="registration.jsp">Register</a> 
			<a class="drop3" href="reservation_search.jsp">Reservation Search</a>
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
		    Spans to act as a hamburger.
		    -->
			<span></span> <span></span> <span></span>
			<ul id="menu">
				<li id="welcome">Welcome!</li>
				<li><a href="login.jsp"><img alt="login icon" src="media/Login.png" />Sign In</a></li>
				<li><a href="registration.jsp"><img alt="register icon"	src="media/Register.png" />Register</a></li>
				<li><a href="reservation.jsp"><img alt="reserve icon" src="media/BookVaca.png" />Book Your Vacation</a></li>
				<li><a href="reservation_search.jsp"><img alt="search icon"	src="media/Search.png" />Search Reservations</a></li>
				<div id="menuGrey">
					<div id="greyLinks">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="attractions.jsp">Attractions</a></li>
						<li><a href="about.jsp">About Us</a></li>
					</div>
				</div>
			</ul>
		</div>
	</nav>
	<div class="home">
		<a id="homeImg" href="index.jsp"><img id="navImage"
			src="media/nav_logo.png" alt="Moffat Bay Lodge Text Logo" /></a>
	</div>
</div>
<%} else { %>
<!--Navigation Bar-->
<div class="navbar">
	<div class="home">
		<a id="homeImg" href="index.jsp"><img id="navImage"
			src="media/nav_logo.png" alt="Moffat Bay Lodge Text Logo" /></a>
	</div>
	<a class="rightNav" href="reservation.jsp">Reserve</a> 
	<a class="rightNav" href="attractions.jsp">Attractions</a> 
	<a class="rightNav" href="about.jsp">About Us</a>
	<div class="account rightNav">
		<button class="dropbtn">
			Account <img class="dropIcon" src="media/drop_icon.png"	alt="drop down icon" /> <i class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-content">
			<a class="drop1" href="logout.jsp">Logout</a> 
			<a class="drop2" href="reservation.jsp">Reserve</a> 
			<a class="drop3" href="reservation_search.jsp">Reservation Search</a>
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
				<li id="welcome">Welcome, <%=firstName %> <%=lastName %></li>
				<li><a href="logout.jsp"><img alt="login icon" src="media/Logout.png" />Logout</a></li>
				<li><a href="reservation.jsp"><img alt="reserve icon" src="media/BookVaca.png" />Book Your Vacation</a></li>
				<li><a href="reservation_search.jsp"><img alt="search icon" src="media/Search.png" />Search Reservations</a></li>
				<div id="menuGrey">
					<div id="greyLinks">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="attractions.jsp">Attractions</a></li>
						<li><a href="about.jsp">About Us</a></li>
					</div>
				</div>
			</ul>
		</div>
	</nav>
	<div class="home">
		<a id="homeImg" href="index.jsp"><img id="navImage"
			src="media/nav_logo.png" alt="Moffat Bay Lodge Text Logo" /></a>
	</div>
</div>
<% } %>