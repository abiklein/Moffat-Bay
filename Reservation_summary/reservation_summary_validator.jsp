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


<!DOCTYPE html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-5-23
CSD 460: Assignment 8
Reservation summary validator page 
 -->
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
	
		//SUBMIT BUTTON
		//store data to database if submit button clicked*/
		

if(request.getParameter("submit") != null) {
    // Code to handle submit
    
		  		  
		//get customer id based on the login
		    /*String email = null;
		    if (session != null) {
		    	email = (String) session.getAttribute("loggedUser");		
				}*/
		    
		     
		     
	 ps = con.prepareStatement("SELECT customer_id FROM customer WHERE customer_email=?");
  ps.setString(1, username);
 
   rs = ps.executeQuery();
  
   int customerId = 0;

  if (rs.next()) {
	   customerId = rs.getInt("customer_id"); 
  }
		    
    //get room size id
     rs = stmt.executeQuery("SELECT room_size_id FROM room WHERE room_size = ?");
    
    int room_id = 0;
	  
	  if (rs.next()) {
		  room_id = rs.getInt("room_size_id");
	    }
	  
    //get booked date?????
    
    
    
     ps = con.prepareStatement("INSERT INTO reservation VALUES (?,?,?,?,?,?,?) ");
    
    
		  
		  //ps.setInt(1,lastId);
		  ps.setInt(2,customerId);
		  ps.setInt(3,room_id);
		  ps.setInt(4,numGuests);
		  ps.setDate(5,sqlcheckInDate);
		  ps.setDate(6,sqlcheckOutDate);
		  ps.setInt(7,totalNights);
		  ps.setDouble(8,totalPrice);
		  
		  //execute Query
		  
		  ps.executeUpdate();
		  response.sendRedirect("reservation_confirmation.jsp");
}
		//	CANCEL BUTTON

else if(request.getParameter("cancel") != null) { 
	  
    // Code to handle cancel
    
    //select the last reservation id
    rs = stmt.executeQuery("SELECT reservation_id FROM reservation ORDER BY id DESC LIMIT 1");
		
		  //declare int variable to hold reservation id
			
			int lastId = 0;
		  
		  if (rs.next()) {
		    lastId = rs.getInt("reservation_id");
		    }
    
	// Create cancel query
      String sql = "UPDATE reservations SET status = 'Cancelled' WHERE id = ?";
      int reservationId = lastId;
      // Set canceled status for given reservation ID
      PreparedStatement statement = con.prepareStatement(sql);
      statement.setInt(1, reservationId);
      
      // Execute update
      statement.executeUpdate();
      response.sendRedirect("reservation.jsp");
  }
rs.close();
stmt.close();
con.close();
%> 



</body>
</html>