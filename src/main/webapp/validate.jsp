<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moffat_lodge?" + "user=root&password=");    
        PreparedStatement pst = conn.prepareStatement("Select customer_email,customer_password from customer where customer_email=? and customer_password=?");
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