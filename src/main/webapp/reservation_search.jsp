<!-- Silver Team: Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation Details</title>
</head>
<body>
    <div id="container">        
        <div id="assignment">
        <h2>Reservation Search</h2>
        <p>Please enter either your Reservation Number or Email</p>
            <form method='post' action='reservation_search.jsp'>
                <input type='text' name='userResID' maxlength='75' placeholder="Reservation Number" value=''> <br /> <br /> 
                <p>OR</p><br/>
                <input type='text' name='userEmail' maxlength='75' placeholder="Email" value=''> <br /> <br /> 
                <input type='submit' value='Submit'>
            </form>
        </div>
    </div>
	<%
    // Declare variables to store reservation details
    int reservationId = 0;
	String bookedByFirstName = "";
    String bookedByLastName = "";
    Date checkInDate = null;
    Date checkOutDate = null;
    String roomSize = "";
    int numberGuests = 0;
    int totalNights = 0;
    double totalCost = 0.0;
    Date dateBooked = null;
    String printTotalPrice = "";

    if (request.getMethod().equals("POST")) {
    	
        // Get user input
        String reservation = request.getParameter("userResID");
        String email = request.getParameter("userEmail");

        // Database connection information
        String jdbcUrl = "jdbc:mysql://localhost:3306/moffat_lodge";
        String dbUsername = "MoffatLodge";
        String dbPassword = "MLData";

        // MySQL database connection
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            
            if (email != null) {
            	String sql = "SELECT r.*, rm.room_size, c.customer_first_name, c.customer_last_name FROM reservation r INNER JOIN room rm ON r.room_size_id = rm.room_size_id INNER JOIN customer c ON r.customer_id = c.customer_id WHERE c.customer_email = ?";
                preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, email);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    reservationId = resultSet.getInt("reservation_id");
                    bookedByFirstName = resultSet.getString("customer_first_name");
                    bookedByLastName = resultSet.getString("customer_last_name");
                    checkInDate = resultSet.getDate("check_in_date");
                    checkOutDate = resultSet.getDate("check_out_date");
                    roomSize = resultSet.getString("room_size");
                    numberGuests = resultSet.getInt("number_of_guests");
                    totalNights = resultSet.getInt("total_nights");
                    totalCost = resultSet.getDouble("total_cost");
                    dateBooked = resultSet.getDate("date_booked");
                    
                    //format the price to 2 decimal point
            		printTotalPrice = String.format("$%,.2f", totalCost);
                %>
				<div id="container">
					<h2>Reservation Summary</h2>
					<table>
						<tr>
							<td>Reservation Number</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= reservationId %></td>
						</tr>
						<tr>
                        	<td>Booked By</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<%= bookedByFirstName %> <%= bookedByLastName %></td>
                        </tr>
						<tr>
							<td>Check-In Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkInDate %></td>
						</tr>
						<tr>
							<td>Check-Out Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkOutDate %></td>
						</tr>
						<tr>
							<td>Room Size</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= roomSize %></td>
						</tr>
						<tr>
							<td>Number of Guests</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= numberGuests %></td>
						</tr>
						<tr>
							<td>Total Nights</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= totalNights %></td>
						</tr>
						<tr>
							<td>Total Cost</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= printTotalPrice %></td>
						</tr>
						<tr>
							<td>Date Booked</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= dateBooked %></td>
						</tr>
					</table>
				</div>
	<%		}
       }
                if (reservation != null) {
                    // Lookup by reservation ID
                    String sql = "SELECT r.*, rm.room_size, c.customer_first_name, c.customer_last_name FROM reservation r INNER JOIN room rm ON r.room_size_id = rm.room_size_id INNER JOIN customer c ON r.customer_id = c.customer_id WHERE r.reservation_id = ?";
                    preparedStatement = conn.prepareStatement(sql);
                    preparedStatement.setInt(1, Integer.parseInt(reservation));
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                        reservationId = resultSet.getInt("reservation_id");
                        bookedByFirstName = resultSet.getString("customer_first_name");
                        bookedByLastName = resultSet.getString("customer_last_name");
                        checkInDate = resultSet.getDate("check_in_date");
                        checkOutDate = resultSet.getDate("check_out_date");
                        roomSize = resultSet.getString("room_size");
                        numberGuests = resultSet.getInt("number_of_guests");
                        totalNights = resultSet.getInt("total_nights");
                        totalCost = resultSet.getDouble("total_cost");
                        dateBooked = resultSet.getDate("date_booked");
                        
                        //format the price to 2 decimal point
                		printTotalPrice = String.format("$%,.2f", totalCost);
                    %>
				<div id="container">
					<h2>Reservation Summary</h2>
					<table>
						<tr>
							<td>Reservation Number</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= reservationId %></td>
						</tr>
						<tr>
                        	<td>Booked By</td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<%= bookedByFirstName %> <%= bookedByLastName %></td>
                        </tr>
						<tr>
							<td>Check-In Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkInDate %></td>
						</tr>
						<tr>
							<td>Check-Out Date</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= checkOutDate %></td>
						</tr>
						<tr>
							<td>Room Size</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= roomSize %></td>
						</tr>
						<tr>
							<td>Number of Guests</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= numberGuests %></td>
						</tr>
						<tr>
							<td>Total Nights</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= totalNights %></td>
						</tr>
						<tr>
							<td>Total Cost</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= printTotalPrice %></td>
						</tr>
						<tr>
							<td>Date Booked</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= dateBooked %></td>
						</tr>
					</table>
				</div>
	<%			}
            }
            preparedStatement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>