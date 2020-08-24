<%@ page language="java" import="com.iiht.evaluation.coronokit.model.ProductMaster" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Edit Product(Admin)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>
<h3>Edit Details</h3>
<hr/>
<%ProductMaster pm=(ProductMaster)request.getAttribute("record");%>
<form action="admin?action=updateproduct&id=<%=pm.getId()%>" method ="post">
		<table>
		<tr>
			<td><label for="product_name">Product Name : </label> </td><td><input type="text" id="product_name" name="product_name" value="<%=pm.getProductName()%>"></td>
		</tr>
		<tr>
			<td><label for="product_desc">Product Description : </label></td><td><input type="text" id="product_desc" name="product_desc" value="<%=pm.getProductDescription()%>"></td> 
		</tr>
		<tr>
			<td><label for="product_price">Product Cost : </label></td> <td><input type="text" id="product_price" name="product_price" value="<%=pm.getCost()%>"></td>
		</tr>
		</table>
		<br/>
		<input type="submit" value="Update">
</form>
<%-- Required View Template --%>

<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>