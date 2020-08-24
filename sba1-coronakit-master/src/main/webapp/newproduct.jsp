<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Add New Product(Admin)</title>
<style>
table,tr,td{
border: 1px solid purple
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>

<h3>Add Product Details</h3>

<form action="admin?action=insertproduct" method ="post">
		<table>
		<tr>
			<td><label for="product_name">Enter Product Name : </label> </td><td><input type="text" id="product_name" name="product_name"></td>
		</tr>
		<tr>
			<td><label for="product_desc">Enter Product Description : </label></td><td><input type="text" id="product_desc" name="product_desc"></td> 
		</tr>
		<tr>
			<td><label for="product_price">Enter Product Cost : </label></td> <td><input type="text" id="product_price" name="product_price"></td>
		</tr>
		</table>
		<br/>
		<div>
			<input type="submit" value="Add Product">
		</div>

</form>


<%-- Required View Template --%>

<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>