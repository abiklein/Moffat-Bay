<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html>
<!-- Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
Date: 9-10-23
CSD 460: Assignment 8
Reservation Confirmation Page
 -->
<head>
  <!--Fonts-->
<!--Poppins-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,400&display=swap"
	rel="stylesheet">
<!--P22 Eaglefeather-->
<link rel="stylesheet" href="https://use.typekit.net/sve2obm.css">

<!--Width = device width with an initial scale of 1.0-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">

<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/reservation_summary.css" />

<title>Reservation Confirmation</title>
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
	<br />
	<br />
	<br />
	<div align="center" class="reservation_summary">
		<%
			//MySQL database connection
		String jdbcURL = "jdbc:mysql://localhost:3306/moffat_lodge";
		String dbUsername = "MoffatLodge";
		String dbUserPassword = "MLData";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//declare int variable to hold reservation id
		int lastId = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(jdbcURL, dbUsername, dbUserPassword);
			String getLastRes = "SELECT reservation_id FROM reservation ORDER BY reservation_id DESC LIMIT 1";
			stmt = con.prepareStatement(getLastRes);
			rs = stmt.executeQuery();

			if (rs.next()) {
				lastId = rs.getInt("reservation_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		%>
		<img src="media/logo_black.png" id="logo" width="200"><br /> 
		
		<h1>Reservation Confirmation</h1>
		
		<p>
			Thank you for booking your stay with us!
		</p>
		<br /> <br />
		<p id="reservation id">
			Your reservation ID is :
			<%=lastId%>
		</p>
		<br /> <br />
		<p>
			<a class="back_to_home" href="index.jsp">Back to Home</a>
		</p>
	</div>
	<div class="spacer"></div>
	<br />
	<br />
	<br />
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>
<%
}
%>