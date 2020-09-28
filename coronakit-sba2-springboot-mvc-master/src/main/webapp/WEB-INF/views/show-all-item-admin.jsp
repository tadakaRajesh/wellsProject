<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table,th,td{
border: 1px solid purple
}

#delete
{
padding: 30,30,30,30
}

</style>
</head>
<body>
<h2> List of Products</h2>
<hr>
<table>
<tr>
<th>Product Name</th>
<th>Product Description</th>
<th>Price/Unit</th>
</tr>
<core:forEach var="products" items="${productList}">
<tr>
<td>${products.productName}</td>
<td>${products.productDescription}</td>
<td>${products.cost}</td>
<td><a href="${pageContext.request.contextPath}/admin/product-delete/${products.id}"><input id="delete" type="button" value="Delete"></a></td>
</tr>
</core:forEach>
</table>
<hr>
<div><a href="${pageContext.request.contextPath}/admin/home"><input type="button" value="Admin Home"></a></div>
</body>
</html>