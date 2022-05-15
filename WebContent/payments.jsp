<%@page import="com.PaymentManagement.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/css/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>
<title>Payment Management</title>
<style>
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h2 style="text-align:center">Payment Management</h2>
				<br>
						<form id="formPayment" name="formPayment" method="post" action="payments.jsp">
						Payment ID:
						<input id="paymentId" name="paymentId" type="text" 
						class="form-control form-control-sm" >
						Account ID:
						<input id="accountId" name="accountId" type="text" 
						class="form-control form-control-sm"> 
						BiLL ID:
						<input id="billId" name="billId" type="text"
						class="form-control form-control-sm">
						Payee Name:
						<input id="payeename" name="payeename" type="text"
						class="form-control form-control-sm">
						Payment Type:
						<input id="paymentType" name="paymentType" type="text"
						class="form-control form-control-sm">
						Email Address:
						<input id="email" name="email" type="text"
						class="form-control form-control-sm">
						Total Amount:
						<input id="totalamount" name="totalamount" type="text"
						class="form-control form-control-sm">
						Amount to be paid:
						<input id="amountTobePaid" name="amountTobePaid" type="text"
						class="form-control form-control-sm">
						Date Payment:
						<input id="datePayment" name="datePayment" type="date"
						class="form-control form-control-sm">
						<br>
						<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
						<input type="hidden" id="hidAppIDSave" name="hidAppIDSave" value="">
						</form>
						
						<div id="alertSuccess" class="alert alert-success"></div>
						<div id="alertError" class="alert alert-danger"></div>
						
						<br>
						<div id = "divAppGrid">
						<%
							Payment appObj = new Payment();
							out.print(appObj.readPayment());
						%>
						</div>
			  </div>
		  </div>
	  </div>
</body>
</html>