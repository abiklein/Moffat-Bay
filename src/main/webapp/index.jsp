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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap" rel="stylesheet">
    <!--P22 Eaglefeather-->
    <link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">

    <!--Width = device width with an initial scale of 1.0-->
    <meta name ="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">

    <!-- CSS Files -->
    <link rel="stylesheet" href="css/index.css" />

    <!-- Title of your web page -->
    <title>Moffat Bay Lodge</title>
</head>
<body>
<div class="nav"><jsp:include page="navbar.jsp" flush="true"/></div>
<!--Body of web page-->
<div class="flexContainer">
    <div class="landing">
    	<img id="landImg"src="media/lodge.jpg" alt="Photo of Moffat Bay Lodge"/>
    </div>
    <div class="txt" id="aboutUs">
    	<h1>About Us</h1>
    	<p>Lorem ipsum dolor sit amet,
			consectetur adipiscing elit, sed
			do eiusmod tempor incididunt
			ut labore et dolore magna
			aliqua.
		</p>
    	<div class="learnMore"><a href="index.jsp">Learn More</a></div>
    </div>
    <div class="img" id="aboutFlexImg"><img id="aboutImg"src="media/about.jpg" alt="Lodge Employee Photo"/></div>
    <div class="img"><img id="attractImg"src="media/scuba.jpg" alt="Scuba Diver Photo"/></div>
    <div class="txt" id="attractions">
    	<h1>Attractions</h1>
    	<p>Lorem ipsum dolor sit amet,
			consectetur adipiscing elit, sed
			do eiusmod tempor incididunt
			ut labore et dolore magna
			aliqua.
		</p>
    	<div class="learnMore" id="attractLearnMore"><a href="index.jsp">Learn More</a></div>
    </div>
</div>
<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
<!--
References:
https://www.w3schools.com/howto/howto_js_dropdown.asp
-->