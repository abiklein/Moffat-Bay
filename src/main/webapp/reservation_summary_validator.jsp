<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "java.text.*" %>

<!-- Include another page to another one -->



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

<%@ page import="java.sql.*" %>
<%
    // Retrieve data from the confirmation form
    String userEmail = request.getParameter("email"); 
    String checkInDateStr = request.getParameter("checkInDate");
    String checkOutDateStr = request.getParameter("checkOutDate");
    String room_size = request.getParameter("roomSize");
    int numGuest = Integer.parseInt(request.getParameter("numGuests"));
    int total_nights = Integer.parseInt(request.getParameter("totalNights"));
    double totalCost = Double.parseDouble(request.getParameter("totalCost"));
    
    // Get the room_size_id based on room_size
    int roomSizeId = 0;
    int custID = 0;// Initialize with a default value
    
    String jdbcURL = "jdbc:mysql://localhost:3306/moffat_lodge";
	String dbUser = "MoffatLodge";
	String dbPassword = "MLData";
    Connection connection = null;
    PreparedStatement roomStatement = null;
    PreparedStatement custStatement = null;

    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Fetch the room_size_id from the room table based on room_size
        String roomQuery = "SELECT room_size_id FROM room WHERE room_size = ?";
        roomStatement = connection.prepareStatement(roomQuery);
        roomStatement.setString(1, room_size);
        ResultSet roomResultSet = roomStatement.executeQuery();

        if (roomResultSet.next()) {
            roomSizeId = roomResultSet.getInt("room_size_id");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Fetch the room_size_id from the room table based on room_size
        String custQuery = "SELECT customer_id FROM customer WHERE customer_email = ?";
        custStatement = connection.prepareStatement(custQuery);
        custStatement.setString(1, room_size);
        ResultSet custResultSet = custStatement.executeQuery();

        if (custResultSet.next()) {
            custID = custResultSet.getInt("customer_id");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Insert data into the database
    Connection dbConnection = null;
    PreparedStatement dbStatement = null;

    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    	
        // Insert the reservation into the database
        String insertQuery = "INSERT INTO reservation (customer_id, room_size_id, number_of_guests, check_in_date, check_out_date, total_nights, total_cost) VALUES (?, ?, ?, ?, ?, ?, ?)";
        dbStatement = dbConnection.prepareStatement(insertQuery);
        
        SimpleDateFormat sdfsql = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date checkInDt = sdfsql.parse(checkInDateStr);
        java.sql.Date sqlCheckInDate = new java.sql.Date(checkInDt.getTime());

        java.util.Date checkOutDt = sdfsql.parse(checkOutDateStr);
        java.sql.Date sqlCheckOutDate = new java.sql.Date(checkOutDt.getTime());

        
        //java.sql.Date  = java.sql.Date.valueOf(checkInDateStr);
        //java.sql.Date sqlCheckOutDate = java.sql.Date.valueOf(checkOutDateStr);

        dbStatement.setInt(1, custID);
        dbStatement.setInt(2, roomSizeId);
        dbStatement.setInt(3, numGuest);
        dbStatement.setDate(4, sqlCheckInDate);
        dbStatement.setDate(5, sqlCheckOutDate);
        dbStatement.setInt(6, total_nights);
        dbStatement.setDouble(7, totalCost);

        int rowsAffected = dbStatement.executeUpdate();
%>


    <% if (rowsAffected > 0) { %>
        <h1>Reservation Successful</h1>
        <p>Your reservation has been successfully added to the database.</p>
    <% } else { %>
        <h1>Reservation Failed</h1>
        <p>Sorry, there was an issue processing your reservation. Please try again.</p>
        <p><a href="reservation.jsp">Back to Reservation Page</a></p>
    <% } %>
</body>
</html>
<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (dbStatement != null) {
            try {
            	dbStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (dbConnection != null) {
            try {
                dbConnection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>