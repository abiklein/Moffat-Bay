
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
<head>
<!--
Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-03-23
CSD 460
Reservation Page
-->
 <meta name="viewport" content="width=device-width, initial-scale=1">
<!--Fonts-->

<!--Poppins-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap"
	rel="stylesheet">
	
<!--P22 Eaglefeather-->
<link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">

<meta charset="ISO-8859-1">
<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/reservation.css" />

<title>Lodge Reservation</title>

<%
//check if user is logged in
String username = (String) session.getAttribute("username");
if (username == null) {
	// User is not logged in, redirect to login page or display a message
    response.sendRedirect("login.jsp");
} else {
	// User is logged in, display the protected content
%>
<script>
// Initialize the minimum check-out date when the page loads.
window.onload = function() {
    updateCheckOutOptions();
};
</script>

</head>

<body>
	<!-- Navbar. -->
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	
	<!-- Lodge Reservation page. -->
	<div class="flexContainer">
	<div class="spacer"></div>
		<div id="bottom">
		<div class="containContainer">

	<div class="reservation_form">
	<h1 class="form_title">Lodge Reservation</h1>
		<!-- Reservation Form. -->
		<form id="reservation" action="reservation_summary.jsp" method="post">
			
			<!-- Check in Date. -->
			<label for="checkin">Check-In Date:</label>
			<input type="date" id="checkin" name="checkin" required
			min="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>"
			max="<%=java.time.LocalDate.now().plusYears(1)%>"
				onchange="updateCheckOutOptions()">

			<!-- Check out Date. -->
			<label for="checkout">Check-Out Date:</label> 
			<input type="date" id="checkout" name="checkout" required
			min="<%= java.time.LocalDate.now().plusDays(1) %>"
    		max="<%= java.time.LocalDate.now().plusYears(1) %>">

			<script>
			function updateCheckOutOptions() {
			    var checkinDate = new Date(document.getElementById('checkin').value);
			    var minCheckoutDate = new Date(checkinDate);
			    minCheckoutDate.setDate(checkinDate.getDate() + 1);
			
			    var checkoutInput = document.getElementById('checkout');
			    checkoutInput.min = minCheckoutDate.toISOString().split('T')[0];
			}
			</script>

	
		<!-- Room Size. -->
			<label for="roomSize">Room Size:</label><br/> <select id="roomSize"
				name="roomSize" required>
				<option value="Double Full Beds">Double Full Beds: $115.50/Night</option>
				<option value="Queen Bed">Queen Bed: $120.75/Night</option>
				<option value="Double Queen Beds">Double Queen Beds: $131.25/Night</option>
				<option value="King Bed">King Bed: $157.50/Night</option>
			</select> <br />
			<br />

			<!-- Number of guests. -->
			<label for="numGuests">Number of Guests:</label><br/>
				<select id="numGuests"
				name="numGuests" required>
				<option value=1>1</option>
				<option value=2>2</option>
				<option value=3>3</option>
				<option value=4>4</option>
				<option value=5>5</option>
				<option value=6>6</option>
				<option value=7>7</option>
				<option value=8>8</option>
				<option value=9>9</option>
				<option value=10>10</option>
				</select>
			<br />
			<br />

			<!-- Submit button.
            	 Submits user data and redirects user to the reservation summary page. -->
			<input type="submit" name="submit" value="Submit"
				formaction="reservation_summary.jsp">
		</form>
	</div>
	

	<!-- Javascript -->
	<script>
    // Variables for date inputs.
    const checkinInput = document.getElementById("checkin");
    const checkoutInput = document.getElementById("checkout");

    // Get the current date.
    const currentDate = new Date();

    // Set the minimum date for check-in to the current date.
    checkinInput.min = currentDate.toISOString().split('T')[0];

    // Event listener for checkin date change.
    checkinInput.addEventListener("change", () => {
        const checkinDate = new Date(checkinInput.value);
        const checkoutDate = new Date(checkoutInput.value);

        // Check if check-out date is before check-in date, and display an error message if it is.
        if (checkoutDate <= checkinDate) {
            alert("Check-out date cannot be before or on check-in date.");
            checkoutInput.value = ""; // Clear the check-out date input.
        }
    });

    // Event listener for checkout date change.
    checkoutInput.addEventListener("change", () => {
        const checkinDate = new Date(checkinInput.value);
        const checkoutDate = new Date(checkoutInput.value);

        // Check if check-out date is before check-in date, and display an error message if it is.
        if (checkoutDate <= checkinDate) {
            alert("Check-out date cannot be before or on check-in date.");
            checkoutInput.value = ""; // Clear the check-out date input.
        } 
    });    
</script>

</div>
	</div>
	</div>
	<div class="spacer"></div>
	<!-- Footer. -->
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>
<% 
}
%>
