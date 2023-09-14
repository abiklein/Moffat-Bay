<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/reservation_summary.css" />

<title>Moffat Bay Lodge Reservation Summary</title>
</head>
<%
//check if user is logged in
String username = (String) session.getAttribute("username");
if (username == null) {
	// User is not logged in, redirect to login page or display a message
    response.sendRedirect("login.jsp");
} else {
	// User is logged in, display the protected content
%>
<body>

	<div class="nav"><jsp:include page="navbar.jsp" flush="true" /></div>
	<br />
	<br />
	<br />
	<%
		// Get reservation data from request parameters (user input from reservation page)
		
	
	String checkInDate = request.getParameter("checkin");
	String checkOutDate = request.getParameter("checkout");
	String roomSize = request.getParameter("roomSize");
	int numGuests = Integer.parseInt(request.getParameter("numGuests"));

	//Parse checkInDate and checkOutDate to date()  
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date checkIn = sdf.parse(checkInDate);
	java.util.Date checkOut = sdf.parse(checkOutDate);

	//Get time in milliseconds
	long checkInMillis = checkIn.getTime();
	long checkOutMillis = checkOut.getTime();

	// Calculate duration in days
	long durationMillis = checkOutMillis - checkInMillis;

	//convert into integer for calculation
	int totalNights = (int) (durationMillis / (1000 * 60 * 60 * 24));

	//Database connection details
	String jdbcURL = "jdbc:mysql://localhost:3306/moffat_lodge";
	String dbUser = "MoffatLodge";
	String dbPassword = "MLData";

	//MySQL database connection
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	//Initalize
	String printTotalPrice = null;
	double roomCost = 0;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		
		// Calculate total price based on room cost and total nights  
		ps = con.prepareStatement("SELECT room_cost FROM room WHERE room_size=?");
		ps.setString(1, roomSize);
		rs = ps.executeQuery();

		if (rs.next()) {
			roomCost = rs.getDouble("room_cost");
		}
		//calculate total price
		double totalPrice = totalNights * roomCost;

		//format the price to 2 decimal point
		printTotalPrice = String.format("$%,.2f", totalPrice);
	} catch (Exception e) {
		System.out.println("Exception Message: " + e.getMessage());
		System.out.println("Stack Trace:");
		e.printStackTrace(System.out);
	} finally {
		try {
			if (ps != null) {
		ps.close();
			}
			if (con != null) {
		con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>
	<!-- Print the summary -->
	<div align="center" class="reservation_summary">

		<form class="reservation_summary"
			action=" reservation_summary_validator.jsp" method="post">
			<img src="media/logo_black.png" id="reservation_logo" width="200">
			<h1>Reservation Summary</h1>
			<table>
				<tr>
					<td>Check-In Date</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=checkInDate%></td>
				</tr>

				<tr>
					<td>Check-Out Date</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=checkOutDate%></td>
				</tr>

				<tr>
					<td>Room Size</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=roomSize%></td>
				</tr>

				<tr>
					<td>Number of <br />Guests
					</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=numGuests%></td>
				</tr>

				<tr>
					<td>Total</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=printTotalPrice%></td>
				</tr>

			</table>
			<br />

			<p>Please review reservation before submitting.</p>
			<p>Cancel to return to reservation page</p>
			<br /> 
			<input type="hidden" name="checkInDate" value="<%=checkInDate%>">
			<input type="hidden" name="checkOutDate" value="<%=checkOutDate%>">
			<input type="hidden" name="roomSizeId" value="<%=roomSize%>">
			<input type="hidden" name="numGuests" value="<%=numGuests%>">
			<input type="hidden" name="totalNights" value="<%=totalNights%>">
			<input type="hidden" name="totalCost"
				value="<%=totalNights * roomCost%>"> <input id="submit"
				name="submit" type="submit" value="Submit"
				formaction="reservation_summary_validator.jsp"> <input
				id="cancel" name="cancel" type="submit" value="Cancel"
				formaction="reservation.jsp"><br />
			<br />
			<br />
			<br />
		</form>
	</div>
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>
<%
}
%>