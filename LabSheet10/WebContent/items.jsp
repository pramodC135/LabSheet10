<%@page import="com.PAF.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>

<title>Items Management</title>
</head>
<body>

	<div class="container">
					<div class="row">
							<div class="col">
								
								<h1>Items Management V10</h1>
								<form id="formItem" name="formItem" method="post" action="items.jsp">
									Item code: <input name="itemCode" id="itemCode" type="text" class="form-control form-control-sm"><br>
									Item name: <input name="itemName" id="itemName" type="text" class="form-control form-control-sm"><br>
									Item price: <input name="itemPrice" id="itemPrice" type="text" class="form-control form-control-sm"><br>
									Item Description: <input name="itemDesc" id="itemDesc" type="text" class="form-control form-control-sm">
									<br>
									<div id="alertSuccess" class="alert alert-success"></div>
									<div id="alertError" class="alert alert-danger"></div>
									<input name="btnSave" id="btnSave" type="button" value="Save" class="btn btn-primary">
									<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
								</form>
								
								<br>
								
								<div id="divItemsGrid"> 
										<%
										Item itemObj = new Item();
										out.print(itemObj.readItems());
										%>	
								</div>
	
							</div>
					</div>
	</div>

</body>
</html>