<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt"%>

<%
	//get user input
	String username = request.getParameter("username");
	String password = request.getParameter("password");
		
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
		String check_login_query = "SELECT customer_password FROM customer WHERE customer_email = ?";
		pstmt = con.prepareStatement(check_login_query);
		pstmt.setString(1, username);
		rs = pstmt.executeQuery();

		//direct user to landing page if correct credentials
		if (rs.next()) {
			String storedHashedPassword = rs.getString("customer_password");

			// Verify the user's input password
			if (BCrypt.checkpw(password, storedHashedPassword)) {
				// Passwords match; authentication successful
				response.sendRedirect("index.html");
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