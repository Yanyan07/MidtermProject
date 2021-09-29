<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Show Order:</h3>

	<c:choose>
		<c:when test="${empty orderItems}">
				You haven't order yet!
			</c:when>
		<c:otherwise>
			<c:forEach var="order" items="${orderItems}">
					${order.inventoryItem.inventory.name} <br />
				<form action="delete.do" method="post">
					<input type="hidden" name="cartItemId" value="${order.id}" /> 
					<input type="submit" value="Delete" />
				</form>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<br />
	<hr />
	
	<form action="placeOrder.do" method="post">
		<input type="submit" value="Place Your Order" />
	</form>
	
	<form action="list.do" method="get">
		<input type="submit" value="Back To List" />
	</form>

</body>
</html>