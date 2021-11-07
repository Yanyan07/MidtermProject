<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Order</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
	<div class="page">
		<h3>Show Order:</h3>

		<c:choose>
			<c:when test="${empty orderItems}">
		You haven't order yet!
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>ItemId</th>
						<th>Name</th>
						<th>Operation</th>
					</tr>
					<c:forEach var="order" items="${orderItems}">
						<tr>
							<td>${order.id}</td>
							<td>${order.inventoryItem.inventory.name}</td>
							<td>
								<form action="delete.do" method="post"> 
									<input type="hidden" name="cartItemId" value="${order.id}" /> 
									<input class="btn warning" type="submit" value="Delete" />
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<br />
		<hr />

		<form action="placeOrder.do" method="post">
			<input class="btn info" type="submit" value="Place Your Order" />
		</form>
		<br>
		<form action="list.do" method="get">
			<input class="btn info" type="submit" value="Back To List" />
		</form>
		<br>
	</div>

</body>
</html>