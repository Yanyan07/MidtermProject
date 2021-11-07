<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make an appointment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
	<div class="page">
		<form action="newappointment.do" method="POST">
			<h3>Schedule a Pickup Appointment</h3>
			<label>Date:</label> <input type="datetime-local"
				name="appointmentDate"><br> <input class="btn info"
				type="submit" value="Submit Appointment" />
		</form>
		<br/>
		<hr/>
		<br/>
		<c:if test="${not empty appointment}">
			You have appointment at:
			<h4>${appointment.appointmentDate}</h4>
			Pick up at:
			<h4>${appointment.pantry.address.streetAddress }
			${appointment.pantry.address.city }
			</h4>
		</c:if>

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