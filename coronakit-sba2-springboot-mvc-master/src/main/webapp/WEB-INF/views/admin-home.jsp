<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>This is Admin dashboard</h1>
<hr>
<div><a href="${pageContext.request.contextPath}/admin/product-list"><input type="button" value="List Products"></a></div>
<hr>
<div><a href="${pageContext.request.contextPath}/admin/product-entry"><input type="button" value="Add Product"></a></div>
<hr>
<div><a href="${pageContext.request.contextPath}/home"><input type="button" value="Main Menu"></a></div>
</body>
</html>