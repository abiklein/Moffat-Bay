<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt"%>
<!DOCTYPE html>
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Login validation
 -->
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	//get user input
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	//declaring variables for application session
	String storedHashedPassword = null;
	String firstName = null;
	String lastName = null;
		
	//MySQL database connection	
	String jdbcURL = "jdbc:mysql://localhost:3306/moffat_lodge";
	String dbUsername = "MoffatLodge";
	String dbUserPassword = "MLData";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(jdbcURL, dbUsername, dbUserPassword);
		
		//check database data for validation 
		String check_login_query = "SELECT customer_first_name, customer_last_name, customer_password FROM customer WHERE customer_email = ?";		pstmt = con.prepareStatement(check_login_query);
		pstmt.setString(1, username);
		rs = pstmt.executeQuery();

		//direct user to landing page if correct credentials
		if (rs.next()) {
			storedHashedPassword = rs.getString("customer_password");
			firstName = rs.getString("customer_first_name");
			lastName = rs.getString("customer_last_name");

			// Verify the user's input password
			if (BCrypt.checkpw(password, storedHashedPassword)) {
				// Passwords match; authentication successful
				// Set the user session
				session.setAttribute("username", username);
				session.setAttribute("firstName", firstName);
				session.setAttribute("lastName", lastName);
				response.sendRedirect("index.jsp");
			} else {
				// Passwords do not match; authentication failed
				response.sendRedirect("login.jsp?msg=invalid");
			}
		} else {
			// User not found in the database
			response.sendRedirect("login.jsp?msg=User not found");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			// Close database resources
			if (rs != null)
		rs.close();
			if (pstmt != null)
		pstmt.close();
			if (con != null)
		con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	%>
	</body>
</html>