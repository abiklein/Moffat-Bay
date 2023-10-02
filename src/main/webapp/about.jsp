<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-10-23
CSD 460: Assignment 8
About page 
 -->
<head>
  <!--Fonts-->
  <!--Poppins-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap" rel="stylesheet">
  <!--P22 Eaglefeather-->
  <link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">
  <!--Dancing Script and Playfair Display fonts-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Playfair+Display:wght@500;600;700;800;900&display=swap" rel="stylesheet">

  <!--Width = device width with an initial scale of 1.0-->
  <meta name="viewport" content="height=device-height, width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi">
  <meta charset="UTF-8">

  <!-- CSS Files -->
  <link rel="stylesheet" href="css/about.css" />
  
  <!-- Title of your web page -->
  <title>About Us</title>
</head>
<body>
<!--Navigation Bar-->
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
<!--Body of web page-->
<div class="flexContainer">
  <div class="landing">
    <div class="landImgContainer">
      <div id="landImg"><img src="media/about.jpg" alt="Photo of Moffat Bay Lodge" class="landing-image"></div>
    </div>
    <div class="landIntroContainer">
    
      <div id="introShape">
      <div class="shape"></div>
        <h1>Hello</h1>
        <p>Here at Moffat Lodge, we value family and are
          determined to treat whoever walks through our doors
          with the same love and sincerity. We aspire to express
          the extent of our purpose through our many services.</p>
      </div>
    </div>
  </div>

  <div class="amenities">
    <h1>Amenities</h1>
    <div id="amenityList">
      <div>
      <ul>
        <li>Lorem ipsum dolor sit amet.</li>
        <li>Lorem ipsum dolor sit amet.</li>
      </ul>
      </div>
      <div>
        <ul>
          <li>Lorem ipsum dolor sit amet.</li>
          <li>Lorem ipsum dolor sit amet.</li>
        </ul>
      </div>
      <div>
        <ul>
          <li>Lorem ipsum dolor sit amet.</li>
          <li>Lorem ipsum dolor sit amet.</li>
        </ul>
      </div>
      <div>
        <ul>
          <li>Lorem ipsum dolor sit amet.</li>
          <li>Lorem ipsum dolor sit amet.</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="accommodations">
    <div class="accomImg"></div>
    <div class="accomTxt">
      <h1>Accommodations</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Nisi vitae suscipit tellus mauris a diam maecenas sed. Nec feugiat nisl pretium fusce id. Pretium
        nibh ipsum consequat nisl vel pretium lectus. Faucibus pulvinar elementum integer enim neque volutpat ac
        tincidunt. Integer vitae justo eget magna fermentum iaculis. Egestas erat imperdiet sed euismod nisi porta lorem
        mollis.

        <br><br>Velit egestas dui id ornare arcu odio ut sem nulla. Eu scelerisque felis imperdiet proin fermentum leo
        vel orci porta. Viverra aliquet eget sit amet tellus. Habitant morbi tristique senectus et netus et malesuada.
        Nulla facilisi etiam dignissim diam quis enim lobortis. Cursus turpis massa tincidunt dui ut ornare lectus sit
        amet.

        <br><br>Cum sociis natoque penatibus et magnis. Ornare aenean euismod elementum nisi quis eleifend quam adipiscing.
        Nibh sit amet commodo nulla facilisi nullam. Nisi vitae suscipit tellus mauris a diam maecenas sed. Consectetur
        a erat nam at. Amet risus nullam eget felis eget nunc lobortis mattis.

    </div>
  </div>

  <div class="contact">
    <h1>Get In Touch</h1>
    <div id="contactInfo">
      <div class="contactItem" id="address">
        <img class="contactIcon" alt="address icon" src="media/location.png"/>
        <ul>
          <li>Moffat Bay Lodge</li>
          <li>5321 Fake Drive</li>
          <li>Moffat Bay, Joviedsa Island</li>
          <li>93021-1234</li>
        </ul>
      </div>
      <div class="contactItem" id="phone">
        <img class="contactIcon" alt="phone icon" src="media/phone.png"/>
        <ul><li>(xxx)xxx-xxxx</li></ul>
      </div>
      <div class="contactItem" id="listEmail">
        <img class="contactIcon" alt="email icon" src="media/mail.png"/>
        <ul><li>moffabay@hotel.com</li></ul>
      </div>
    </div>

  </div>
  </div>

  <!--Footer-->
  	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
  

</body>
</html>
<!--
References:
https://www.w3schools.com/howto/howto_js_dropdown.asp
-->
