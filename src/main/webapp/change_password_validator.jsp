<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String username =request.getParameter("username");
String Newpass=request.getParameter("new_password");
String conpass=request.getParameter("conf_password");

int check = 0;

//connect to the database
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");  

	String dbUsername = "MoffatLodge";
	String dbUserPassword = "MLData";

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moffat_lodge?",dbUsername,dbUserPassword ); 
		Statement st = con.createStatement();
		
		//search the record that need to be changed
		ResultSet rs = st.executeQuery("select customer_email from customer where customer_email = '"+
		username+"' ");
		
		//update the password and print success message
		if(rs.next()){
			check = 1;
			st.executeUpdate("Update customer set customer_password = '"+Newpass+"' where customer_email = '"+username+"' ");
			response.sendRedirect("successful_password_change.jsp");
		}
		
		if(check == 0){
			//print fail message
			response.sendRedirect("fail_password_change.jsp");
		}
		}
	
	catch(Exception e){
		System.out.println(e);
	}

%>

<!-- references
https://www.studentstutorial.com/java-project/password-change-in-jsp.php?expand_article=1 
https://www.youtube.com/watch?v=LD2c6RoryDQ-->

