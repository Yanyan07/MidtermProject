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
		<c:when test="${empty orderMap}">
				You haven't order yet!
			</c:when>
		<c:otherwise>
			<c:forEach var="order" items="${orderMap}">
					${order.key.name} ${order.value}<br />
				<form action="delete.do" method="post">
					<input type="hidden" name="inventoryId" value="${order.key.id}" /> 
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
	
	<form action="backList.do" method="get">
		<input type="submit" value="Back To List" />
	</form>

</body>
</html>