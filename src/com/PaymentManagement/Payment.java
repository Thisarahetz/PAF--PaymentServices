package com.PaymentManagement;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Payment {
    //A common method to connect to the DB
	    private Connection connect() 
	        { 
                Connection con = null; 
                try
	        { 
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
	    
	    //Provide the correct details: DBServer/DBName, username, password 
	    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/electrogred", "root", ""); 
    } 
    catch (Exception e) 
	        {e.printStackTrace();} 
    return con; 
    } 
    /**
     * add payment detail
     * @param accountId
     * @param billId
     * @param payeeName
     * @param paymentType
     * @param email
     * @param totalAmountBill
     * @param amountToBePaid
     * @param datePayment
     * @return
     */
    public String addPayment(String accountId, String billId, String payeeName,
    String paymentType, String email, String totalAmountBill, String amountToBePaid, String datePayment ) 
    { 
        String output = ""; 
            try
            { 
                Connection con = connect(); 
                if (con == null) 
                    {	
                        return "Error while connecting to the database for inserting.";
                    } 
                //crate uuid for id
                Date dNow = new Date();
                SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
                String datetime = ft.format(dNow);
                // create a prepared statement
                String query = "insert into payment(`paymentId`,`accountId`,`billId`,`payeeName`,`paymentType`,`email`,`totalAmountBill`,`amountToBePaid`,`datePayment`)"
                + " values (?,?,?,?,?,?,?,?,?)"; 
                PreparedStatement preparedStmt = con.prepareStatement(query); 
                // binding values
                preparedStmt.setString(1, "PI"+datetime);
                preparedStmt.setString(2, accountId); 
                preparedStmt.setString(3, billId); 
                preparedStmt.setString(4, payeeName);  
                preparedStmt.setString(5, paymentType); 
                preparedStmt.setString(6, email); 
                preparedStmt.setDouble(7, Double.parseDouble(totalAmountBill));  
                preparedStmt.setDouble(8, Double.parseDouble(amountToBePaid)); 
                preparedStmt.setString(9, datePayment); 
                

                // execute the statement
                preparedStmt.execute(); 
                con.close(); 
                String newreadPayment = readPayment();
                
                output = "{\"status\":\"success\", \"data\": \"" + newreadPayment + "\"}";
			}
			catch (Exception e)
			{
				output = "{\"status\":\"error\", \"data\": \"Error while inserting the Payment details. \"}";
				System.err.println(e.getMessage());
			}
			
			return output;
		}
	
    /**
     * Read readpayment
     * @return payment table
     */ 
    public String readPayment() 
    { 
    String output = ""; 
    try
    { 
        Connection con = connect(); 
        if (con == null) 
        {return "Error while connecting to the database for reading."; } 
        // Prepare the html table to be displayed
        output = "<table border='1'><tr>"
        		+ "<th>Payment ID</th>"
        		+ "<th>Account ID</th>" +
                "<th>Bill Id</th>" + 
                "<th>Payee Name</th>"+
                "<th>payment Type</th>" + 
                "<th>email</th>" +
                "<th>TotalAmountBill</th>" + 
                "<th>AmountToBePaid</th>"+
                "<th>Date of Payment</th> "
                +"<th>Update</th><th>Remove</th></tr>"; 
        
        /**Use join query connect tree table */
        String query = "SELECT * FROM payment INNER JOIN users ON users.accountId=payment.accountId INNER JOIN bill ON bill.billId = payment.billId"; 
        Statement stmt = con.createStatement(); 
        ResultSet rs = stmt.executeQuery(query); 
        // iterate through the rows in the result set
        while (rs.next()) 
        { 
            String paymentId = rs.getString("paymentId"); 
            String accountId = rs.getString("accountId"); 
            String billId = rs.getString("billId"); 
            String payeeName = rs.getString("payeeName"); 
            String paymentType = rs.getString("paymentType"); 
            String email = rs.getString("email"); 
            Double totalAmountBill = rs.getDouble("totalAmountBill"); 
            Double amountToBePaid = rs.getDouble("amountToBePaid"); 
            String datePayment = rs.getString("datePayment");
            // Add into the html table
            output += "<tr><td>" + paymentId + "</td>"; 
            output += "<td>" + accountId + "</td>"; 
            output += "<td>" + billId + "</td>"; 
            output += "<td>" + payeeName + "</td>"; 
            output += "<td>" + paymentType + "</td>"; 
            output += "<td>" + email + "</td>"; 
            output += "<td>" + totalAmountBill + "</td>"; 
            output += "<td>" + amountToBePaid + "</td>";
            output += "<td>" + datePayment + "</td>";
            
         // buttons
			output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
					+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-id='"
							 + paymentId + "'>" + "</td></tr>";
        } 
        con.close(); 
        // Complete the html table
        output += "</table>"; 
    } 
	catch (Exception e) 
	{ 
		output = "Error while reading the payments."; 
		System.err.println(e.getMessage()); 
	} 
	return output; 
	} 
    
    /**
     * Update Payment detail
     * @param paymentId
     * @param accountId
     * @param billId
     * @param payeeName
     * @param paymentType
     * @param email
     * @param totalAmountBill
     * @param amountToBePaid
     * @param datePayment
     * @return
     */
    public String updatePayment(String paymentId, String accountId, String billId, String payeeName, String paymentType, String email, String totalAmountBill, String amountToBePaid, String datePayment) 
    
    { 
        String output = ""; 
    try
    { 
        Connection con = connect(); 
        if (con == null) 
    { return "Error while connecting to the database for updating."; } 
    // create a prepared statement
    String query = "UPDATE payment SET paymentId=?,accountId=?,billId=?,payeeName=?,paymentType=?,email=?,totalAmountBill=?,amountToBePaid=?,datePayment=? WHERE paymentId=?"; 
    PreparedStatement preparedStmt = con.prepareStatement(query); 
        // binding values
        preparedStmt.setString(1, paymentId); 
        preparedStmt.setString(2, accountId); 
        preparedStmt.setString(3, billId); 
        preparedStmt.setString(4, payeeName);
        preparedStmt.setString(5, paymentType); 
        preparedStmt.setString(6, email);
        preparedStmt.setDouble(7, Double.parseDouble(totalAmountBill)); 
        preparedStmt.setDouble(8, Double.parseDouble(amountToBePaid));
        preparedStmt.setString(9, datePayment); 
        preparedStmt.setString(10, paymentId);
    // execute the statement
    preparedStmt.execute(); 
    con.close(); 
    
    String newreadPayment = readPayment();
    output = "{\"status\":\"success\", \"data\": \"" + newreadPayment + "\"}";
} 
catch (Exception e) 
	{ 
	output = "{\"status\":\"error\", \"data\":\"Error while Updateing the Payment.\"}"; 		
	System.err.println(e.getMessage()); 
	} 
return output; 
} 


    
    /**
     * remove the payment details from the table
     * @param paymentId
     * @return
     */
    public String deletePayment(String paymentId) 
    { 
	    String output = ""; 
	    try
	    { 
	    	Connection con = connect(); 
		    if (con == null) 
		    	{return "Error while connecting to the database for deleting."; } 
			    // create a prepared statement
			    String query = "delete from payment where paymentId=?"; 
			    PreparedStatement preparedStmt = con.prepareStatement(query); 
			    // binding values
			    preparedStmt.setString(1, paymentId); 
			    // execute the statement
			    preparedStmt.execute(); 
			    con.close(); 
			    String newreadPayment = readPayment();
			    output = "{\"status\":\"success\", \"data\": \"" + newreadPayment + "\"}";
		    } 
	    catch (Exception e) 
	    { 
	    	output = "{\"status\":\"error\", \"data\":\"Error while deleting the Paymnet.\"}"; 		
			System.err.println(e.getMessage()); 
	    } 
	    return output; 
	    }
   }


