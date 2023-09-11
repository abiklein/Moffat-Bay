<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
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

//MySQL database connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}  

		String dbUsername = "MoffatLodge";
		String dbUserPassword = "MLData";

		Connection con = null;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moffat_lodge",dbUsername,dbUserPassword );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		//Statement stmt = con.createStatement();

		//get user input
		String username = request.getParameter("username");   
		String password = request.getParameter("password");


		//check database data for validation (select (first column) where .......
		String check_login_query = "Select * from customer where customer_email=? and customer_password=?";
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(check_login_query);
		

		pstmt.setString(1, username);
		pstmt.setString(2, password);

		ResultSet rs = pstmt.executeQuery();

		//direct user to landing page if correct credentials

		if(rs.next()){
			//RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			//rd.forward(request, response);
			response.sendRedirect("index.html");
		}
		else{
			//direct user to ligin page with error message if invalid credential
			
			/*request.setAttribute("errorMessage","Please check your credentials and try again");
			RequestDispatcher rd = request.getRequestDispatcher("login1.jsp");
			//rd.forward(request, response);*/
			response.sendRedirect("login.jsp?msg=invalid");
			
		}
		} 
		catch (SQLException e) {
			
			//e.printStackTrace();
		}
		
	
	%>

</body>
</html>