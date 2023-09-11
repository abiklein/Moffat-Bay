<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import = "java.io.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-5-23
CSD 460: Assignment 8
Reservation summary page 
 -->
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/reservation_summary.css" />

<title>reservation summary</title>
</head>

<body>

<div class="nav"><jsp:include page="navbar.jsp" flush="true"/></div><br/>
<br/><br/>



<%
  // Get reservation data from request parameters (user input from reservation page)
  
  String custEmail = request.getParameter("email");
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
 int totalNights = (int)(durationMillis / (1000 * 60 * 60 * 24));
		 
 
  
//MySQL database connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}  

		String dbUsername = "MoffatLodge";
		String dbUserPassword = "MLData";

		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moffat_lodge",dbUsername,dbUserPassword );
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		
		Statement stmt = con.createStatement();
		
  
  // Calculate total price based on room cost and total nights

  
  PreparedStatement ps = con.prepareStatement("SELECT room_cost FROM room WHERE room_size=?");
  ps.setString(1, roomSize);
 
  ResultSet rs = ps.executeQuery();
  
  double roomCost = 0;

  if (rs.next()) {
    roomCost = rs.getDouble("room_cost"); 
  }
	//
		 
  //calculate total price
  double totalPrice = totalNights * roomCost;
  
  //format the price to 2 decimal point
  String printTotalPrice = String.format("$%,.2f", totalPrice);
  
  

%>
<!-- Print the summary -->
<div align= "center" class="reservation_summary">

<form class="reservation_summary" action=" reservation_summary_validator.jsp" method="post">
<img src="media/logo_black.png" id="reservation_logo" width="200">
<h1>Reservation Summary</h1>
<table>
  <tr>
    <td>Check-In Date</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=checkInDate %></td>
  </tr>

 <tr>
    <td>Check-Out Date</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=checkOutDate %></td>
  </tr>
  
  <tr>
    <td>Room Size</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=roomSize %></td>
  </tr>
  
  <tr>
    <td>Number of <br/>Guests</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=numGuests %></td>
  </tr>
  
  <tr>
    <td>Total</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;<%=printTotalPrice %></td>
  </tr>

</table><br/>

<p>Please review reservation before submitting.</p>
<p>Cancel to return to reservation page</p><br/>

        <input type="hidden" name="custEmail" value="<%= custEmail %>">
        <input type="hidden" name="checkInDate" value="<%= checkInDate %>">
        <input type="hidden" name="checkOutDate" value="<%= checkOutDate %>">
        <input type="hidden" name="roomSizeId" value="<%= roomSize %>">
        <input type="hidden" name="numGuests" value="<%= numGuests %>">
        <input type="hidden" name="totalNights" value="<%= totalNights %>">
        <input type="hidden" name="totalCost" value="<%= totalNights * roomCost %>">

<input name="submit" type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;
</form>
<form action="reservation.jsp" method="get">
        <input name="cancel" type="submit" value="Cancel">
</form>
</div>



<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>

</body>
</html>