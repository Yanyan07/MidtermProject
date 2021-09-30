<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make an appointment</title>
</head>
<body>

	<form action="newappointment.do" method="POST">
		<h3>Schedule a Pickup Appointment</h3>
		Appointment Date: <input type="datetime-local" name="appointmentDate"><br> <br> 
		<input class="btn btn-primary" type="submit" value="Submit Appointment" /><br> <br>
	</form>
	
	
	<c:if test="${not empty appointment}" >
	<h4>You have appointment at: </h4>
	${appointment.appointmentDate}<br/>
	Pick up at:<br/> 
	${appointment.pantry.address.streetAddress }
	${appointment.pantry.address.city }
	</c:if>

	<br/>
	<form action="backRecipient.do" method="get">
		<input type="submit" value="Back To Recipient" />
	</form>
	
	<br/>
	<form action="home.do" method="get">
		<input type="submit" value="Back To Home" />
	</form>
</body>
</html>