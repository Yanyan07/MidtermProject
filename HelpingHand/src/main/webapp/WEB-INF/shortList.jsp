<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Restocking</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
	<div class="page">
		<c:choose>
			<c:when test="${empty shortList}">
				Everything is full!
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>ItemId</th>
						<th>Name</th>
						<th>Status</th>
					</tr>
					<c:forEach var="order" items="${shortList}">
						<tr>
							<td>${order.id}</td>
							<td>${order.inventory.name}</td>
							<td>Empty</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<br />
		<hr />

		<c:if test="${not empty appointments}">
			<h3>Show appointments in this pantry</h3>
			<table>
				<tr>
					<th>Name
					</th>
					<th>Appointment Time
					</th>
				</tr>
				<c:forEach var="app" items="${appointments}">
					<tr>
						<td>${sessionScope.user.firstName}</td>
						<td>${app.appointmentDate}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<form action="backProviderList.do" method="post">
			<input class="btn info" type="submit" value="Back To List" />
		</form>
		<br/>

		<form action="home.do" method="get">
			<input class="btn info" type="submit" value="Back To Home" />
		</form>
	</div>
</body>
</html>