$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
}
);

//SAVE======================================
$(document).on("click", "#btnSave", function(event)
{
	//clear alerts-----------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	//Form validation-------------------------
	var status = validationPaymentForm();
	if(status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	//If valid-------------------------
	var type = ($("#hidAppIDSave").val() == "" ) ? "POST"  : "PUT";
	
	//AJAX for save
	$.ajax(
	{
		url : "PaymentAPI",
		type : type,
		data : $("#formPayment").serialize(),
		dataType : "text",
		complete : function(response, status)
		{   
			onPaymentSaveComplete(response.responseText, status);
		}
	}); 
});


//onPaymentSaveComplete function
function onPaymentSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response); 

		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show(); 

			$("#divAppGrid").html(resultSet.data);
			} else if (resultSet.status.trim() == "error")
			{
				$("#alertError").text(resultSet.data);
				$("#alertError").show();
			} 

	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	} 

	$("#hidAppIDSave").val("");
	$("#formPayment")[0].reset();
	}

//UPDATE=========================================================
$(document).on("click", ".btnUpdate",function(event)
{
	document.getElementById("hidAppIDSave").value = "Update";
	$("#paymentId").val($(this).closest("tr").find('td:eq(0)').text());
	$("#accountId").val($(this).closest("tr").find('td:eq(1)').text());
	$("#billId").val($(this).closest("tr").find('td:eq(2)').text());
	$("#payeename").val($(this).closest("tr").find('td:eq(3)').text());
	$("#paymentType").val($(this).closest("tr").find('td:eq(4)').text());
	$("#email").val($(this).closest("tr").find('td:eq(5)').text());
	$("#totalamount").val($(this).closest("tr").find('td:eq(6)').text());
	$("#amountTobePaid").val($(this).closest("tr").find('td:eq(7)').text());
	$("#datePayment").val($(this).closest("tr").find('td:eq(8)').text());
	
	
});

//DELETE==========================================================
$(document).on("click", ".btnRemove", function(event)
{
	//AJAX for delete
	$.ajax(
	{
		url : "PaymentAPI",
		type : "DELETE",
		data : "id=" + $(this).data("id"),
		dataType : "text",
		complete : function(response, status)
	{
	onPaymentDeleteComplete(response.responseText, status);
	}
	});
});

//onUserDeleteComplete function
function onPaymentDeleteComplete(response, status)
{
if (status == "success")
{
var resultSet = JSON.parse(response);

 if (resultSet.status.trim() == "success")
{
$("#alertSuccess").text("Successfully deleted.");
$("#alertSuccess").show();

 $("#divAppGrid").html(resultSet.data);
} else if (resultSet.status.trim() == "error")
{
$("#alertError").text(resultSet.data);
$("#alertError").show();
}

 } else if (status == "error")
{
$("#alertError").text("Error while deleting.");
$("#alertError").show();
} else
{
$("#alertError").text("Unknown error while deleting..");
$("#alertError").show();
}
}
//CLIENT-MODEL============================================
function validationPaymentForm()
{
	//accountId
	if($("#accountId").val().trim() == "")
	{
		return "Insert Account id.";
	}
	
	//billIdid
	if($("#billId").val().trim() == "")
	{
		return "Insert Bill id.";
	}
	
	//Pay name
	if($("#payeename").val().trim() == "")
	{
		return "Insert PayeeName";
	}
	
	//paymentType
	if($("#email").val().trim() == "")
	{
		return "Insert PaymentType.";
	}
	
	//email
	if($("#totalamount").val().trim() == "")
	{
		return "Insert Email.";
	}
	
	//amount be paid
	if($("#amountTobePaid").val().trim() == "")
	{
		return "Insert Amount to be paid.";
	}
	
	//Status
	if($("#datePayment").val().trim() == "")
	{
		return "Insert Date Payment.";
	}
	
	
	return true;
}