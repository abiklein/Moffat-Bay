<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.text.*"%>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-10-23
CSD 460: Assignment 8
Reservation Summary Validator
 -->
<%
	//check if user is logged in
String username = (String) session.getAttribute("username");
if (username == null) {
	// User is not logged in, redirect to login page or display a message
	response.sendRedirect("login.jsp");
} else {
	// Retrieve data from the confirmation form
	String userEmail = (String) session.getAttribute("username");
	String checkInDateStr = request.getParameter("checkInDate");
	String checkOutDateStr = request.getParameter("checkOutDate");
	String room_size = request.getParameter("roomSizeId");
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

		// Fetch the room_size_id from the room table based on room_size
		String custQuery = "SELECT customer_id FROM customer WHERE customer_email = ?";
		custStatement = connection.prepareStatement(custQuery);
		custStatement.setString(1, userEmail);
		ResultSet custResultSet = custStatement.executeQuery();

		if (roomResultSet.next()) {
			roomSizeId = roomResultSet.getInt("room_size_id");
		}

		if (custResultSet.next()) {
			custID = custResultSet.getInt("customer_id");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	// Insert data into the database    
	PreparedStatement preparedStatement = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

		//Insert the reservation into the database
		String insertQuery = "INSERT INTO reservation (customer_id, room_size_id, number_of_guests, check_in_date, check_out_date, total_nights, total_cost) VALUES (?, ?, ?, ?, ?, ?, ?)";
		preparedStatement = connection.prepareStatement(insertQuery);

		SimpleDateFormat sdfsql = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date checkInDt = sdfsql.parse(checkInDateStr);
		java.sql.Date sqlCheckInDate = new java.sql.Date(checkInDt.getTime());

		java.util.Date checkOutDt = sdfsql.parse(checkOutDateStr);
		java.sql.Date sqlCheckOutDate = new java.sql.Date(checkOutDt.getTime());

		preparedStatement.setInt(1, custID);
		preparedStatement.setInt(2, roomSizeId);
		preparedStatement.setInt(3, numGuest);
		preparedStatement.setDate(4, sqlCheckInDate);
		preparedStatement.setDate(5, sqlCheckOutDate);
		preparedStatement.setInt(6, total_nights);
		preparedStatement.setDouble(7, totalCost);

		int rowsAffected = preparedStatement.executeUpdate();

		if (rowsAffected > 0) {
			response.sendRedirect("reservation_confirmation.jsp");
		} else {
			// Registration failed, handle the error
			request.setAttribute("errorMessage", "Uh Oh! Something went wrong!");
			request.getRequestDispatcher("errorReg.jsp").forward(request, response);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (preparedStatement != null) {
	try {
		preparedStatement.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		}
		if (connection != null) {
	try {
		connection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		}
	}
}
%>