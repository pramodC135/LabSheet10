//page load
$(document).ready(function()
{	
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

//Save button
$(document).on("click", "#btnSubmit", function(event)
{

	//clear status msges--------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	//Form validation-------------------
	var status = validateItemForm();

	//If not valid
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	// IF valid
	$("#formItem").submit();

});

$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	$("#itemCode").val($(this).closest("tr").find('td:eq(0)').text());
	$("#itemName").val($(this).closest("tr").find('td:eq(1)').text());
	$("#itemPrice").val($(this).closest("tr").find('td:eq(2)').text());
	$("#itemDesc").val($(this).closest("tr").find('td:eq(3)').text());
});

function validateItemForm()
{	
	// CODE
	if ($("#itemCode").val().trim() == "")
	{
		return "Insert Item Code.";
	}
	
	// Name
	if ($("#itemName").val().trim() == "")
	{
		return "Insert Item Name.";
	}
	
	// Price
	if ($("#itemPrice").val().trim() == "")
	{
		return "Insert Item Price.";
	}
	
	// is numerical value
	var tmpPrice = $("#itemPrice").val().trim();
	if (!$.isNumeric(tmpPrice))
	{
		return "Insert a numerical value for Item Price."
	}
	
	// convert to decimal price
	$("#itemPrice").val(parseFloat(tmpPrice).toFixed(2));
	
	// Description
	if ($("#itemDesc").val().trim() == "")
	{
		return "Insert Item Description.";
	}
	
	return true;
}
