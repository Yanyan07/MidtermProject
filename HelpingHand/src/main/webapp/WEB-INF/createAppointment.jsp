<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make an appointment</title>
</head>
<body>

	<form action="newappointment.do" method="POST">
		<h5>To create an appointment, please provide the following:</h5><br> 
		<%-- UserId: <input type="hidden" name="userId" value="${sessionScope.user.id}" ><br> <br> --%>
		Appointment Date: <input type="datetime-local" name="appointmentDate"><br> <br> 
		<%-- Location: <input type="text" name="pantryId" value="${sessionScope.pantry.address}" ><br> <br>   --%>
		<input class="btn btn-primary" type="submit" value="Submit Appointment" /><br> <br>
	</form>
	
	<h4>Show you appointment: </h4>
	${appointment.appointmentDate}
	Pick up at: 
	${appointment.pantry.address.streetAddress }
	${appointment.pantry.address.city }

</body>
</html>