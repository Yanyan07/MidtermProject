<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
<div class="page">
	<br>
		<h3>Find the Pantry's Appointments:</h3>
		<form action="appointments.do" method="post">
			<input class="btn info" type="submit" />
		</form>
		<br>
		
		<h3>Show Inventory Short Stock:</h3>
		<form action="short.do">
			<input class="btn info" type="submit" />
		</form>
		<br>
		
		<h3>Refill Inventory Item:</h3>
		<form action="refill.do">
			<input class="btn info" type="submit" />
		</form>
		<br>
		<br>
		<hr/>
		<br>
		<c:if test="${not empty appointments}">
			<h3>Show This Pantry's Appointments:</h3>
			<table>
				<tr>
					<th>Name</th>
					<th>Appointment Time</th>
				</tr>
				<c:forEach var="app" items="${appointments}">
					<tr>
						<td>${app.user.firstName}</td>
						<td>${app.appointmentDate}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<br />
		<form action="backLogin.do" method="get">
			<input class="btn info" type="submit" value="Back To Provider" />
		</form>
		<br />
		<form action="home.do" method="get">
			<input class="btn info" type="submit" value="Back To Home" />
		</form>
</div>
</body>
</html>