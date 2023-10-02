<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-3-23
CSD 460: Assignment 6
Change password validator
 -->
<%
	String username = request.getParameter("username");
	String newPass = request.getParameter("password");
	String confPass = request.getParameter("confPassword");
	
	String dbUrl = "jdbc:mysql://localhost:3306/moffat_lodge?";
	String dbUsername = "MoffatLodge";
	String dbUserPassword = "MLData";
	
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	
	try {
		// Establish a database connection
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(dbUrl, dbUsername, dbUserPassword);
		
		// Prepare and execute a SQL query to check if the email exists
        String emailCheckSql = "SELECT COUNT(*) FROM customer WHERE customer_email = ?";
		st = con.prepareStatement(emailCheckSql);
		st.setString(1, username);
		rs = st.executeQuery();
		
		if(rs.next()) {
			int count = rs.getInt(1);
			
			if(count > 0) {
				// Email exists in the customer table; proceed to change the password
				if (confPass.equals(newPass)) {
					// Passwords match; update the password in the database
					String updatePasswordSql = "UPDATE customer SET customer_password = ? WHERE customer_email = ?";
					String hashedNewPassword = BCrypt.hashpw(newPass, BCrypt.gensalt());
			
					st = con.prepareStatement(updatePasswordSql);
					st.setString(1, hashedNewPassword);
					st.setString(2, username);
			
					int rowsUpdated = st.executeUpdate();
			
					if (rowsUpdated > 0) {
                        // Password updated successfully
                        response.sendRedirect("change_password_success.jsp");                        
                	} else {
                        // Password update failed
                        response.sendRedirect("change_password_fail.jsp");                        
                	}
                } else {
                    // Passwords do not match
                    response.sendRedirect("change_password.jsp?msg=Passwords Do Not Match");                    
                }
            } else {
                // Email not found in the customer table; inform the user
                response.sendRedirect("change_password.jsp?msg=User not found");
                }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            // Close database resources
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
%>

