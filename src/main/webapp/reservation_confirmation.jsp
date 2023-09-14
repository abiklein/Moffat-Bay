<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

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
<head>
<meta charset="ISO-8859-1">
<!-- CSS Files -->
<link rel="stylesheet" href="css/navbar.css" />
<link rel="stylesheet" href="css/footer.css" />
<link rel="stylesheet" href="css/reservation_summary.css" />

<title>Moffat Bay Lodge Reservation Confirmation</title>
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
		<img src="media/logo_black.png" id="logo" width="200"><br /> <br />
		<p>
			Thank you for booking <br />your stay with us!
		</p>
		<br /> <br />
		<p id="reservation id">
			Your reservation number is :
			<%=lastId%>
		</p>
		<br /> <br />
		<p>
			<a class="back_to_home" href="index.html">Back to Home</a>
		</p>
	</div>
	<br />
	<br />
	<div class="footer"><jsp:include page="footer.jsp" flush="true" /></div>
</body>
</html>
<%
}
%>