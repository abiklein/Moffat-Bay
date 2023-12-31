<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN'
  'http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd'>
  
<html lang="en">
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-24-23
CSD 460: Assignment 10
Attractions Page
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

<!--Dancing Script and Playfair Display fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Playfair+Display:wght@500;600;700;800;900&display=swap"
	rel="stylesheet">

<!--Width = device width with an initial scale of 1.0-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">

<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/attractions.css" />
<link rel="stylesheet" href="css/footer.css" />

<!-- Title of your web page -->
<title>Attractions</title>
</head>
<body>
<!-- Navbar. -->
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
<!--Body of web page-->
<div class="landing">
    <div class="landIntroContainer">
      <img id="landImg" alt="Attractions Landing Image"  src="media/attractions.png"/>
      <div id="introShape">
      	<h2>STAY ACTIVE</h2>
      	<div class="whiteBox"><span class="spacer"></span><p>There Is Something For Everyone at Moffat Bay Lodge</p><span class="spacer"></span></div>
      </div>
    </div>
  </div>
	<div class="flexContainer">
	<div class="txt" id="kayak">
			<h1>Kayaking</h1>
			<p>Experience thrilling kayaking adventures on scenic Joviedsa Island with the Lodge 
			as your gateway to pristine waterways. From tranquil lakes to coastal thrills, we offer 
			guided tours and equipment for all levels of kayakers.</p>
		</div>
		<div class="img" id="kayakFlexImg">
			<img id="kayakImg" src="media/kayak.jpg" alt="Kayaking Photo" />
		</div>
		
		<div class="img" id="hikeFlexImg">
			<img id="hikeImg" src="media/hike.jpg" alt="Hiking Photo" />
		</div>
		
		<div class="txt" id="hike">
			<h1>Hiking</h1>
			<p>Explore Joviedsa Island's wilderness in the Lodge's backyard. Whether 
			you're a novice or seasoned hiker, our trails lead through ancient forests, stunning 
			peaks, and hidden waterfalls. Get trail support from our staff and immerse yourself 
			in Pacific Northwest beauty.</p>
		</div>
		<div class="reverse">
			<div class="txt" id="whale">
				<h1>Whale Watching</h1>
				<p>Witness the majestic gray whales and marine life from scenic viewpoints or guided tours. 
				Our coastal lodge allows you to immerse yourself with unforgettable sightings 
				whether you're on our ocean-view deck or a boat tour. Experience the magic of 
				whale watching on Joviedsa Island's Pacific shores with us.</p>
			</div>
			<div class="img" id="whaleFlexImg">
				<img id="whaleImg" src="media/whale3.jpg" alt="Whale Watching Photo" />
			</div>
		</div>
		<div class="img">
			<img id="scubaImg" src="media/scuba.jpg" alt="Scuba Diver Photo" />
		</div>
		<div class="txt" id="scuba">
			<h1>Scuba Diving</h1>
			<p>Just off the shores of the Lodge you can dive into Joviedsa Island's underwater wonders. Explore 
			captivating dive sites, kelp forests, and vibrant marine life in the Pacific Ocean. Our 
			experienced instructors offer courses and guided excursions for divers of all levels. </p>
		</div>
	</div>
	<!-- Footer. -->
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>