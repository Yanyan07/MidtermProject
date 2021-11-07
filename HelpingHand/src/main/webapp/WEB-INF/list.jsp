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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
	<div class="page">

		<h2>Show List:</h2>
		<c:choose>
			<c:when test="${empty list}">
		The List Is Empty!
		</c:when>
			<c:otherwise>
					<table>
						<tr>
							<th>ItemId</th>
							<th>Name</th>
							<th>Operation</th>
						</tr>
						<c:forEach var="i" items="${list}">
							<tr>
								<td>${i.id}</td>
								<td>${i.inventory.name}</td>
								<td>
									<form action="addToCart.do" method="post">
										<input type="hidden" name="inventoryItemId" value="${i.id}" />
										<input class="btn info" type="submit" value="Add To Cart" />
									</form>
								</td>
							</tr>
						</c:forEach>
					</table>
			</c:otherwise>
		</c:choose>
		<hr />
		<h3>Show the order:</h3>
		<form action="showOrder.do" method="get">
			<input class="btn info" type="submit" value="Items in Cart" />
		</form>
		<br />
		<form action="backRecipient.do" method="get">
			<input class="btn info" type="submit" value="Back To Recipient" />
		</form>
		<br />
		<form action="home.do" method="get">
			<input class="btn info" type="submit" value="Back To Home" />
		</form>
	</div>
</body>
</html>