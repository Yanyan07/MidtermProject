<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment Page</title>
</head>
<body>
<%-- <c:forEach>var=" </c:forEach>' --%>

<form action="updateappointment.do?id=${appointment.id }" method="POST">
		<h5>To update an appointment, provide the following:</h5>
		
		<br>
		Date: <input type="text" name="name" value =${appointment.date }><br><br>
		Time: <input type="text" name="name" value =${appointment.time }><br><br>
		<br><br>
		
		<input class="btn btn-primary" type="submit" value="Edit Appointment"/>
		</form><br><br>
		
		<form class="form" action="create.do"method="GET">
	Update Appointment: <input type="text" name="id" /> <input
	class="btn btn-primary" type="submit" value="Update Appointment" />
	</form>
	
	<form action="newappointment.do" method="POST">
<h5>To create an appointment, please provide the following:</h5>
<br> UserId: <input type="text" name="userId"><br> 
<br> Appointment Date: <input type="datetime-local" name="appointmentDate"><br>
<br> Location: <input type="text" name="pantryId"><br>
<br> <input class="btn btn-primary" type="submit"
				value="Submit Appointment" /><br> <br>
				</form>
</body>
</html>
		

				