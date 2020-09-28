<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

.error{
	
	font-family:sans-serif;
	font-size:x-small;
	color: red;

}

</style>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<spring:form
		action="${pageContext.request.contextPath}/admin/product-save"
		method="POST" modelAttribute="product">

		<div>
			<div>
				<spring:label path="productName">Product Name :</spring:label>
			</div>
			<div>
				<spring:input path="productName" />
				<spring:errors path="productName" cssClass="error" />
			</div>
		</div>
		<br>
		<div>
			<div>
				<spring:label path="cost">Product Price :</spring:label>
			</div>
			<div>
				<spring:input path="cost" />
				<spring:errors path="cost" cssClass="error" />
			</div>
		</div>
		<br>
		<div>
			<div>
				<spring:label path="productDescription">Product Description :</spring:label>
			</div>
			<div>
				<spring:input path="productDescription" />
				<spring:errors path="productDescription" cssClass="error" />
			</div>
		</div>
		<br>
		<div><input type="submit" value="Submit" /></div>
	</spring:form>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>