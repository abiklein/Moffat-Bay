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
          <li>Comfortable Accommodations</li>
          <li>Sports and Recreation</li>
          <li>Swimming Pool</li>
          <li>Hiking and Nature Trails</li>          
        </ul>
      </div>
      
      <div>
        <ul>
          <li>Outdoor Spaces</li>
          <li>Concierge Services</li>
          <li>Entertainment</li>
          <li>Conference and Meeting Facilities</li>                             
        </ul>
      </div>
     
      <div>
      <ul>
      	<li>Restaurant and Dining Facilities</li>
        <li>Spa and Wellness Center</li>      
        <li>Lounge or Bar</li>
        <li>Gift Shop or Boutiqu.</li>        
      </ul>
      </div>
      
      <div>
        <ul>
          <li>Kid's Play Area</li>
          <li>Accessibility Features</li>
          <li>Shuttle Service</li>
          <li>Campfire or BBQ Areas</li> 
        </ul>
      </div>      
    </div>
  </div>

  <div class="accommodations">
    <div class="accomImg"></div>
    <div class="accomTxt">
      <h1>Accommodations</h1>
      <p><b>Double Full Beds Room:</b> Ideal for families or friends, our Double Full Beds Room offers two comfortable full-sized beds. 
      Enjoy the convenience of a microwave for quick snacks, a safe for your valuables, and a spacious bathroom with a shower, 
      ensuring a relaxing stay for all.

        <br><br><b>Queen Bed Room:</b> Perfect for couples or solo travelers, our Queen Bed Room features a plush queen-sized bed. 
        You'll find a microwave for your convenience, a safe for your peace of mind, and a well-appointed bathroom with a shower
         to freshen up after a day of exploration.

        <br><br><b>Double Queen Beds Room:</b> Designed for larger groups or those who desire extra space, our Double Queen Beds Room provides 
        two queen-sized beds. In addition to the microwave and safe, you'll have a generous bathroom with a bathtub to unwind in.
        
        <br><br><b>King Bed Room:</b> Experience the ultimate in comfort and luxury in our King Bed Room, boasting a spacious king-sized bed. 
        Relax with the convenience of a microwave, ensure your belongings are secure in the safe, and indulge in the larger bathroom, 
        complete with a soothing whirlpool tub, offering a perfect retreat after a day of adventure. 

		<br><br><i>No matter which room you choose, our lodge provides a range of options to make your stay enjoyable and memorable.</i>
		<br><br></p>
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
