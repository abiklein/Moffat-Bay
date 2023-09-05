<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!-- possible import for hashing --> 
<%-- <%@ page import="org.apache.commons.codec.digest.DigestUtils" %> needs a jar file.. i downloaded 4 and put them all in my lib so not sure which one it needs to be --%>

<%
String email = request.getParameter("email");
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String telephone = request.getParameter("telephone");
String password = request.getParameter("password");

// Database connection details
String jdbcURL = "jdbc:mysql://localhost:3306/moffat_lodge";
String dbUser = "MoffatLodge";
String dbPassword = "MLData";

Connection conn = null;
PreparedStatement stmt = null;

try {
    // Create a database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

    // Check if the email is already in the database
    String checkEmailQuery = "SELECT * FROM customer WHERE customer_email=?";
    stmt = conn.prepareStatement(checkEmailQuery);
    stmt.setString(1, email);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        // Email already exists, set an error message
        request.setAttribute("errorMessage", "Email already exists. Try logging into your account <a href=\"login.jsp\">here<a>.");
        // Forward the request back to the registration page
        request.getRequestDispatcher("userRegistration.jsp").forward(request, response);
    } else {    	
    	//TODO INSERT HASHING CODE HERE
    	
        //Hash the password securely
        //String hashedPassword = DigestUtils.sha256Hex(password); //practice code used with import above
        

        // Insert the user's information into the database
        String insertUserQuery = "INSERT INTO customer (customer_email, customer_first_name, customer_last_name, customer_phone, customer_password) VALUES (?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(insertUserQuery);
        stmt.setString(1, email);
        stmt.setString(2, firstName);
        stmt.setString(3, lastName);
        stmt.setString(4, telephone);
        stmt.setString(5, password); //TODO need to change to the hashed password once we know how that will be done

        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            // Registration successful, redirect to a success page
            response.sendRedirect("registration_success.jsp");
        } else {
            // Registration failed, handle the error
            request.setAttribute("errorMessage", "Uh Oh! Something went wrong!");
            request.getRequestDispatcher("errorReg.jsp").forward(request, response);            
        }
    }
} catch (Exception e) {
	System.out.println("Exception Message: " + e.getMessage());
	System.out.println("Stack Trace:");
	e.printStackTrace(System.out);
} finally {
    try {
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>