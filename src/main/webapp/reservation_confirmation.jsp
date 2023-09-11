<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "java.text.*" %>

<!-- Include another page to another one -->
<%@ include file="reservation_summary.jsp" %>
<%@ include file="reservation.jsp" %>


<!DOCTYPE html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-5-23
CSD 460: Assignment 8
Reservation confirmation page 
 -->
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/reservation_summary.css" />

<title>reservation confirmation</title>
</head>
<body>

<div class="nav"><jsp:include page="navbar.jsp" flush="true"/></div><br/><br/>

<div align ="center" class="reservation_summary">
<img src="media/logo_black.png" id="logo" width="200"><br/><br/>



<p>Thank you for booking <br/>your stay with us!</p><br/><br/>

<% 
//MySQL database connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}  

		//String dbUsername = "MoffatLodge";
		//String dbUserPassword = "MLData";

		//Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moffat_lodge",dbUsername,dbUserPassword );
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		
		 stmt = con.createStatement();
		
		 rs = stmt.executeQuery("SELECT reservation_id FROM reservation ORDER BY id DESC LIMIT 1");
		
		  //declare int variable to hold reservation id
			
			int lastId = 0;
		  
		  if (rs.next()) {
		    lastId = rs.getInt("reservation_id");
		    }
		  %>
    

<p id=" reservation id"  >Your reservation confirmation ID is : <%=lastId %> </p><br/><br/>

<!-- Print reservation Summary -->

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

<p>If this page doesn't automatically direct you, please click <a id = "login_link" href = "index.jsp">here</a></p>


</div><br/><br/>

<div class="footer"><jsp:include page="footer.jsp" flush="true"/></div>
</body>
</html>