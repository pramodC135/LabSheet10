<%@page import="com.PAF.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%    
    //Save item----------------------------------
	if (request.getParameter("itemCode") != null)
	{
			Item itemObj = new Item();
			String stsMsg = "";
			
			//Insert----------------------------
			if (request.getParameter("hidItemIDSave") == "")
			{
				 stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
									request.getParameter("itemName"),
									request.getParameter("itemPrice"),
									request.getParameter("itemDesc"));
				
			}
			else //Update-------------------------------
			{
				stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
							request.getParameter("itemCode"),
							request.getParameter("itemName"),
							request.getParameter("itemPrice"),
							request.getParameter("itemDesc"));
			}
			
			session.setAttribute("statusMsg", stsMsg);
		
	}
	
	//Remove Item-------------------------------------
	if(request.getParameter("hidItemIDDelete") != null)
	{
			Item itemObj = new Item();
			String stsMsg = itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
			session.setAttribute("statusMsg", stsMsg);
			
	}
	
	//
%> 
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
								
								<h1>Items Management</h1>
								<form id="formItem" name="formItem" method="post" action="items.jsp">
									Item code: <input name="itemCode" id="itemCode" type="text" class="form-control form-control-sm"><br>
									Item name: <input name="itemName" id="itemName" type="text" class="form-control form-control-sm"><br>
									Item price: <input name="itemPrice" id="itemPrice" type="text" class="form-control form-control-sm"><br>
									Item Description: <input name="itemDesc" id="itemDesc" type="text" class="form-control form-control-sm">
									<br>
									<div id="alertSuccess" class="alert alert-success"></div>
									<div id="alertError" class="alert alert-danger"></div>
									<input name="btnSubmit" id="btnSubmit" type="button" value="Save" class="btn btn-primary">
									<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
								</form>
								
								<div  class="alert alert-success">
										<%
											out.print(session.getAttribute("statusMsg"));
										%>
								</div> 
								
								<br>
								
								<%
								
								Item itemObj = new Item();
								out.print(itemObj.readItems());
								
								 //<table border="1">
								//	<tr>
								//		<th>Item Code</th><th>Item Name </th><th>Item Price</th><th>Item Description</th><th>Update</th><th>Remove</th>
								//	</tr>
								//	<tr>
								//	<td> <% out.println(session.getAttribute("itemCome")); </td>
								//		<td><%out.println(session.getAttribute("itemName")); </td>
								//		<td><%out.println(session.getAttribute("itemPrice")); </td>
								//		<td><%out.println(session.getAttribute("itemDesc")); </td>
								//		<td><input name="btnUpdate" type="button" value="Update"></td>
								//		<td><input name="btnRemove" type="button" value="Remove"></td>
								//	</tr>
								//</table>
								%>		
									
							</div>
					</div>
	</div>

</body>
</html>