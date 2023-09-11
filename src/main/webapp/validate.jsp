<%@ page import ="java.sql.*" %>
<%
// Silver team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo
//Date: 9-3-23
//CSD 460: Assignment 6
//Login validation

try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moffat_lodge?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select customer_id,customer_password from customer where customer_email=? and customer_password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();  
        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>