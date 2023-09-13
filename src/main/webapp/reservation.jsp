<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/reservation.css" />

<title>Lodge Reservation</title>
</head>

<body>
	<!-- Navbar. -->
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	<br />
	<br />
	<img src="media/logo_black.png" id="logo" width="200">

	<!-- Lodge Reservation page. -->
	<h1>Lodge Reservation</h1>

	<div class="reservation_form">
		<!-- Reservation Form. -->
		<form id="reservation" action="reservation_summary.jsp" method="post">
			<!-- Email. -->
			<label for="email">Email:</label> <input type="email" id="email"
				name="email" required placeholder="Your Email" /> <br />
			<br />

			<!-- Check in Date. -->
			<!-- Check in date can only be selected from the current date in session up until a year from then. -->
			<label for="checkin">Check-In Date:</label> <input type="date"
				id="checkin" name="checkin" required
				min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"
				max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(java.util.Date.from(java.time.LocalDate.now().plusYears(1).atStartOfDay(java.time.ZoneId.systemDefault()).toInstant())) %>">

			<!-- Check out Date. -->
			<!-- Check out date can only be selected a day after the current date in session up until a year from then. -->
			<label for="checkout">Check-Out Date:</label> <input type="date"
				id="checkout" name="checkout" required
				min="<%= java.util.Date.from(java.time.LocalDate.now().plusDays(1).atStartOfDay(java.time.ZoneId.systemDefault()).toInstant()) %>"
				max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(java.util.Date.from(java.time.LocalDate.now().plusYears(1).atStartOfDay(java.time.ZoneId.systemDefault()).toInstant())) %>">

			<!-- Room Size. -->
			<label for="roomSize">Room Size:</label> <select id="room_size_id"
				name="roomSize" required>
				<option value="Double Full Beds">Double Full Beds</option>
				<option value="Queen Bed">Queen Bed</option>
				<option value="Double Queen Beds">Double Queen Beds</option>
				<option value="King Bed">King Bed</option>
			</select> <br />
			<br />

			<!-- Number of guests. -->
			<label for="numGuests">Number of Guests:</label>
			<div class="guests">
				<button type="button" class="minus_button">-</button>
				<input type='number' id="numGuests" name='numGuests'
					placeholder="Number of Guests" required />
				<button type="button" class="plus_button">+</button>
			</div>
			<br />
			<br />

			<!-- Submit button.
            	 Submits user data and redirects user to the reservation summary page. -->
			<input type="submit" name="submit" value="Submit"
				formaction="reservation_summary.jsp">
		</form>
	</div>

	<!-- Javascript handles + and - buttons. -->
	<script>
    	// Variables for guest input from customer, minus button and plus button.
        const numGuestsInput = document.getElementById("numGuests");
        const plusButton = document.querySelector(".plus_button");
        const minusButton = document.querySelector(".minus_button");

     	// Event listener to add guests.
        plusButton.addEventListener("click", () => {
            // Checks and ensures user can not increase the number of guests to more than 10.
            if (numGuestsInput.value < 10) {
                numGuestsInput.stepUp();
            }
        });
    </script>

	<!-- Footer. -->
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>
