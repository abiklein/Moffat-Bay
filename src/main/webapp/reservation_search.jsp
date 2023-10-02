<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-17-23
CSD 460: Assignment 9
Reservation Search Page 
 -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Reservation</title>
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

<!--Width = device width with an initial scale of 1.0-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">

<!-- CSS Files -->
<link rel="stylesheet" href="css/search.css" />


<!-- Title of your web page -->
<title>Moffat Bay Lodge</title>

</head>
<body>
	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	<div class="flexContainer" id="top">
	<div class="spacer" id="bottom">
		<script type="text/javascript" src="js/searchValidation.js"></script>
		
		<!--Body of web page-->
		<div class="container_form">
			<h1 class="form_title">Reservation Search</h1>
			<form class="search_form" id="searchForm" name="searchForm" 
				oninput="return validateForm()" action="#printAreaID" method="post">
				<div class="form_message--error" id="emailError"></div>
				<div class="form_input-group">
				<!-- Input for email -->
					<input class="form_input" type="text" name="email" id="email"
						placeholder="Email" onkeyup="checkInput2(this)">
				</div>
				<br/>
				<p>OR</p>
				<br/>
				<div class="form_input-group">
				<!-- Input for reservation ID -->
					<input class="form_input" type="number" name="reservationID"
						id="reservationID" placeholder="Reservation ID" onkeyup="checkInput1(this)">
					<div class="form_message--error" id="reservationIDError"></div>
				</div>				
				<button class="form_button" type="submit" id="submitBtn" disabled value="Search">Search</button>
			</form>
			
			<script>
				// Add event listeners to perform validation and enable/disable submit button
				var form = document.forms["searchForm"];
				form.addEventListener("input", toggleSubmitButton); //Listen for input changes
				toggleSubmitButton(); // Initially validate and disable the submit button

				// Function to clear the error message when user starts typing in the email field
				document.getElementById("email").addEventListener("input",
						function() {
							var errorDiv = document.getElementById("errorDiv");
							errorDiv.innerHTML = ""; // Clear the error message
						});
				//text cannot be entered in the email field if there is data entered into the reservation ID field and vice versa.
				document.addEventListener('DOMContentLoaded', function() {
					  const inputs = Array.from(
					    document.querySelectorAll('input[name=reservationID], input[name=email]')
					  );
					  const inputListener = e => {
					    inputs
					      .filter(i => i !== e.target)
					      .forEach(i => (i.required = !e.target.value.length));
					  };

					  inputs.forEach(i => i.addEventListener('input', inputListener));
					});
			</script>
			
		</div>
		<div class="printAreaHide" id="printAreaID" >
		<!-- Script: hide #printAreaID whenever user arrives from separate page -->
		<script>document.getElementById("printAreaID").className = "printAreaHide";</script>
		<div id="searchOutput">
			<br/><br/>
			<%
    // Declare variables to store reservation details
    int reservationId = 0;
	String bookedByFirstName = "";
    String bookedByLastName = "";
    Date checkInDate = null;
    Date checkOutDate = null;
    String roomSize = "";
    int numberGuests = 0;
    int totalNights = 0;
    double totalCost = 0.0;
    Date dateBooked = null;
    String printTotalPrice = "";

    if (request.getMethod().equals("POST")) {
    %>
        <!-- Script: show #printAreaID whenever the form is submitted -->
    	<script>
    	document.getElementById("printAreaID").className = "printArea";
    	document.getElementById("belowTxtSpace").className = "whiteSpacer";
    	</script>
    	
    	<%
    	
        // Get user input
        String reservation = request.getParameter("reservationID");
        String email = request.getParameter("email");

        // Database connection information
        String jdbcUrl = "jdbc:mysql://localhost:3306/moffat_lodge";
        String dbUsername = "MoffatLodge";
        String dbPassword = "MLData";

        // MySQL database connection
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
      
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            //if email variable is not empty...
            if (email != null) {
            		//Select categories based on email
	            	String sql = "SELECT r.*, rm.room_size, c.customer_first_name, c.customer_last_name FROM reservation r INNER JOIN room rm ON r.room_size_id = rm.room_size_id INNER JOIN customer c ON r.customer_id = c.customer_id WHERE c.customer_email = ?";
	                preparedStatement = conn.prepareStatement(sql);
	                preparedStatement.setString(1, email);
	                resultSet = preparedStatement.executeQuery();
	                //if there is no data for that email, return an error
	                if(!resultSet.next()){
						out.print("<div class='noResults'><span class='noResultsBold'>There were no results.</span> <br/> Please enter an email associated with a reservation</br> or a valid Reservation ID in the form <a id='noResultsLink' href='#top'>above</a>.</div>");
					}
	                //otherwise, while there is data, do the following
	                else{
	                	preparedStatement.setString(1, email);
		                resultSet = preparedStatement.executeQuery();
	                	while(resultSet.next()){
	                	//assign variables with data from database.
	                    reservationId = resultSet.getInt("reservation_id");
	                    bookedByFirstName = resultSet.getString("customer_first_name");
	                    bookedByLastName = resultSet.getString("customer_last_name");
	                    checkInDate = resultSet.getDate("check_in_date");
	                    checkOutDate = resultSet.getDate("check_out_date");
	                    roomSize = resultSet.getString("room_size");
	                    numberGuests = resultSet.getInt("number_of_guests");
	                    totalNights = resultSet.getInt("total_nights");
	                    totalCost = resultSet.getDouble("total_cost");
	                    dateBooked = resultSet.getDate("date_booked");
	                    
	                    //format the price to 2 decimal point
	            		printTotalPrice = String.format("$%,.2f", totalCost);
	            
                %>
                <!-- Table for data from database -->
				<div id="container">
					<h1 class="resSummary">Reservation Summary</h1>
					<table>
						<tr>
							<td class="rowName">Reservation Number</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= reservationId %></td>
						</tr>
						<tr>
                        	<td class="rowName">Booked By</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<%= bookedByFirstName %> <%= bookedByLastName %></td>
                        </tr>
						<tr>
							<td class="rowName">Check-In Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkInDate %></td>
						</tr>
						<tr>
							<td class="rowName">Check-Out Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkOutDate %></td>
						</tr>
						<tr>
							<td class="rowName">Room Size</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= roomSize %></td>
						</tr>
						<tr>
							<td class="rowName">Number of Guests</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= numberGuests %></td>
						</tr>
						<tr>
							<td class="rowName">Total Nights</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= totalNights %></td>
						</tr>
						<tr>
							<td class="rowName">Total Cost</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= printTotalPrice %></td>
						</tr>
						<tr>
							<td class="rowName">Date Booked</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= dateBooked %></td>
						</tr>
					</table>
				</div>
	<% }%><div class="noResults">To search for another reservation, <br/> return to the form <a id="noResultsLink" href="#top">above</a>.</div>
	<%}
	                
        }
            //if the reservation variable is not empty do the following...
            if (reservation != null) {
                    // Lookup by reservation ID
                    String sql = "SELECT r.*, rm.room_size, c.customer_first_name, c.customer_last_name FROM reservation r INNER JOIN room rm ON r.room_size_id = rm.room_size_id INNER JOIN customer c ON r.customer_id = c.customer_id WHERE r.reservation_id = ?";
                    preparedStatement = conn.prepareStatement(sql);
                    preparedStatement.setInt(1, Integer.parseInt(reservation));
                    resultSet = preparedStatement.executeQuery();
					
                    //if there is data do the following...
                    if (resultSet.next()) {
                        reservationId = resultSet.getInt("reservation_id");
                        bookedByFirstName = resultSet.getString("customer_first_name");
                        bookedByLastName = resultSet.getString("customer_last_name");
                        checkInDate = resultSet.getDate("check_in_date");
                        checkOutDate = resultSet.getDate("check_out_date");
                        roomSize = resultSet.getString("room_size");
                        numberGuests = resultSet.getInt("number_of_guests");
                        totalNights = resultSet.getInt("total_nights");
                        totalCost = resultSet.getDouble("total_cost");
                        dateBooked = resultSet.getDate("date_booked");
                        
                        //format the price to 2 decimal point
                		printTotalPrice = String.format("$%,.2f", totalCost);
                    %>
                <!-- Table for data from database -->
				<div id="container">
					<h1 class="resSummary">Reservation Summary</h1>
					<table>
						<tr>
							<td class="rowName">Reservation Number</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= reservationId %></td>
						</tr>
						<tr>
                        	<td class="rowName">Booked By</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<%= bookedByFirstName %> <%= bookedByLastName %></td>
                        </tr>
						<tr>
							<td class="rowName">Check-In Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkInDate %></td>
						</tr>
						<tr>
							<td class="rowName">Check-Out Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkOutDate %></td>
						</tr>
						<tr>
							<td class="rowName">Room Size</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= roomSize %></td>
						</tr>
						<tr>
							<td class="rowName">Number of Guests</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= numberGuests %></td>
						</tr>
						<tr>
							<td class="rowName">Total Nights</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= totalNights %></td>
						</tr>
						<tr>
							<td class="rowName">Total Cost</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= printTotalPrice %></td>
						</tr>
						<tr>
							<td class="rowName">Date Booked</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= dateBooked %></td>
						</tr>
					</table>
					<div class="noResults">To search for another reservation, <br/> return to the form <a id="noResultsLink" href="#top">above</a>.</div>
				</div>
	<%			}
                    //print error if there is no data.
                    else{out.print("<div class='noResults'><span class='noResultsBold'>There were no results.</span> <br/> Please enter a valid Reservation ID <br/> or an email associated with a reservation in the form <a id='noResultsLink' href='#top'>above</a>.</div>");}
            	
            }
            //close database connection
            preparedStatement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
			
		</div>
			
		</div>
		<div class="spacer" id="belowTxtSpace"></div>
		 <%if (request.getMethod().equals("POST")) {%>
        <!-- Script: hide #belowTxtSpace whenever the form is submitted -->
    	<script>
    	document.getElementById("belowTxtSpace").className = "whiteSpacer";
    	</script>
    	
    	<% }%>
		<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
		</div>
		</div>
</body>
</html>