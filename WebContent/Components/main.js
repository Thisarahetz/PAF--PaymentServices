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
			onAppointmentSaveComplete(response.responseText, status);
		}
	}); 
});


//onAppointmentSaveComplete function
function onAppointmentSaveComplete(response, status)
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
	//$("#hidAppIDSave").val(
			//$(this).closest("tr").find('#hidAppIDUpdate').val());
	console.log($(this).closest("tr"));
	document.getElementById("hidAppIDSave").value = "Update";
	$("#id").val($(this).closest("tr").find('td:eq(0)').text());
	$("#hospitalid").val($(this).closest("tr").find('td:eq(1)').text());
	$("#patientid").val($(this).closest("tr").find('td:eq(2)').text());
	$("#date").val($(this).closest("tr").find('td:eq(3)').text());
	$("#time").val($(this).closest("tr").find('td:eq(4)').text());
	$("#description").val($(this).closest("tr").find('td:eq(5)').text());
	
	
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
	
	//billIdid
	if($("#billId").val().trim() == "")
	{
		return "Insert account id.";
	}
	
	//Pay name
	if($("#payeename").val().trim() == "")
	{
		return "Insert PayeeName";
	}
	
	//email
	if($("#email").val().trim() == "")
	{
		return "Insert Email.";
	}
	
	//Total amount
	if($("#totalamount").val().trim() == "")
	{
		return "Insert time.";
	}
	
	//amount be paid
	if($("#amountTobePaid").val().trim() == "")
	{
		return "Insert description.";
	}
	
	//Status
	if($("#datePayment").val().trim() == "")
	{
		return "Insert status.";
	}
	
	
	return true;
}