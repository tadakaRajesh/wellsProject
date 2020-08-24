<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Place Order(user)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>
<h1>Confirm Order</h1>
<%-- Required View Template --%>
<%String cid=(String)request.getAttribute("cid"); %>
<hr/>	
<form action="user?action=saveorder&cid=<%=cid%>" method ="post">
<div><label for="addr"><h3>Address : <h3><label></div>
<textarea name="addr" rows="4" cols="50">
Type Address
</textarea>
<div><input type="submit" value="Proceed"></div>
</form>
</body>
</html>