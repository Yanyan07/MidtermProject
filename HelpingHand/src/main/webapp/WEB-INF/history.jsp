<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Order History</title>

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
			<c:when test="${empty orderHistory}">
				<center>You haven't order yet!</center>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>ItemId</th>
						<th>Name</th>
					</tr>
					<c:forEach var="i" items="${orderHistory}">
						<tr>
							<td>${i.id}</td>
							<td>${i.inventory.name}</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<br />
		<form action="backRecipient.do" method="get">
			<input class="btn info" type="submit" value="Back To Recipient" />
		</form>
	</div>
</body>
</html>