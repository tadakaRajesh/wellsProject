<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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

#atk
{
padding: 30,30,30,30
}
</style>
</head>
<body>
<h2>Products List For <security:authentication property="principal.username"/></h2>
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
<td><a href="${pageContext.request.contextPath}/user/add-to-cart/${products.id}"><input id="atk" type="button" value="Add to Kit"></a></td>
</tr>
</core:forEach>
</table>

</body>
</html>