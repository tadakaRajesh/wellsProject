<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<spring:form action="${pageContext.request.contextPath}/user/finalize"
		method="POST" modelAttribute="ck">

		<div>
			<div>
				<spring:label path="orderDate">Order Date : ${ck.orderDate}</spring:label>
			</div>
		</div>
		<br>
		<div>
			<div>
				<spring:label path="totalAmount">Total Kit Amount : ${ck.totalAmount}</spring:label>
			</div>
			<br>

			<div>
				<div>
					<spring:label path="deliveryAddress">shipping address :</spring:label>
				</div>
				<br>
				<div>
					<spring:input path="deliveryAddress" />
					<spring:errors path="deliveryAddress" cssClass="error" />
				</div>
			</div>
			<br>

			<span>
				<input type="submit" value="Submit" />
			</span>
			<span>
				<a href="${pageContext.request.contextPath}/user/show-kit"><input type="button" value="show cart" /> </a>
			</span>
		</div>
	</spring:form>

</body>
</html>