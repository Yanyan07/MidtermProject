<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Available List</title>
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
			<c:when test="${empty availableList}">
				No product remaining.
		</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>ItemId</th>
						<th>Name</th>
						<th>Status</th>
					</tr>
					<c:forEach var="order" items="${availableList}">
						<tr>
							<td>${order.id}</td>
							<td>${order.inventory.name}</td>
							<td>Available</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
		<br />
		<hr />

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