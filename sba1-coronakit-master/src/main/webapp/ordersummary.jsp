<%@ page language="java" import="java.util.List" import="com.iiht.evaluation.coronokit.model.OrderSummary" import="com.iiht.evaluation.coronokit.model.CoronaKit" import="com.iiht.evaluation.coronokit.model.KitDetail" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Order Summary(user)</title>
<style>
table,th,td{
border: 1px solid purple;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>
<h1> Order Summary</h1>
<hr/>
<% OrderSummary os=(OrderSummary)request.getAttribute("order");
CoronaKit ck=os.getCoronaKit();
List<KitDetail> kd=os.getKitDetails();
%>
<label ><b>Name :</b></label> <label><%=ck.getPersonName()%></label>    <label><b>Total Amount :</b></label> <label><%=ck.getTotalAmount()%></label>     <label><b>Email :</b></label> <label><%=ck.getEmail()%></label>      <label><b>Mobile :</b></label> <label><%=ck.getContactNumber()%></label> 
<br/>
<label><b>Shipping Address :</b></label> <label><%=ck.getDeliveryAddress()%></label> 	
<hr/>
<h3><blink> <b>Products</b> </blink></h3>
<table>
<tr><th>Product</th><th>Qty.</th><th>Amount</th>
<%for(KitDetail item:kd){
	%>
	<tr><td><%=item.getProductId()%></td><td><%=item.getQuantity()%></td><td><%=item.getAmount()%></td></tr>
<%} %>
</table>
<hr/>
	<jsp:include page="footer.jsp"/>
</body>
</html>