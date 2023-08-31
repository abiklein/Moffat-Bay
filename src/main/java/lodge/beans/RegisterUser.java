package lodge.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class RegisterUser extends TagSupport{
	static final long serialVersionUID = 1L;
	
	private String dbName = "jdbc:mysql://localhost:3306/moffat_lodge";
	private String dbUser = "MoffatLodge";
	private String dbPass = "MLData";

	private String email;
	private String f_name;
	private String l_name;
	private String phone;
	private String pword;

	
	//setters to take user input and add to sql statement below
	public void setEmail(String email) {  
	    this.email = email;  
	}
	
	public void setf_name(String f_name) {  
	    this.f_name = f_name;  
	}
	
	public void setl_name(String l_name) {  
	    this.l_name = l_name;  
	}
	
	public void setphone(String phone) {  
	    this.phone = phone;  
	}
	
	public void setpword(String pword) {  
	    this.pword = pword;  
	}
	
	public int doStartTag()throws JspException{    
	    try{   //Connect to database
	        Class.forName("com.mysql.cj.jdbc.Driver");  
	        Connection con=DriverManager.getConnection(dbName, dbUser, dbPass);
	        Statement stmt = con.createStatement();
	        
        	//Insert new data into table
	        String sql = "INSERT INTO customer(customer_email, customer_first_name, customer_last_name, customer_phone, customer_password)" + 
        				"VALUES('" + email + "','" + f_name + "','" + l_name + "','" + phone + "','" + pword  + "')";
        	
    		stmt.executeUpdate(sql);
    		
    		stmt.executeUpdate("COMMIT");
        }
	    
	    catch(Exception e){
	    	System.out.println(e);
        }
	    
	    return EVAL_PAGE;
	}
}