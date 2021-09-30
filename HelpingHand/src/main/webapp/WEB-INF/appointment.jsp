<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">

</head>

<body>

	<form action="updateappointment.do?id=${appointment.id }" method="POST">
		<h5>To update an appointment, provide the following:</h5>

		<br> Date: <input type="text" name="name"
			value=${appointment.date }><br> <br> Time: <input
			type="text" name="name" value=${appointment.time }><br>
		<br> <br> <br> <input class="btn btn-primary"
			type="submit" value="Edit Appointment" />
	</form>
	<br>
	<br>

	<form class="form" action="create.do" method="GET">
		Update Appointment: <input type="text" name="id" /> <input
			class="btn btn-primary" type="submit" value="Update Appointment" />
	</form>

	<form action="newappointment.do" method="POST">
		<h5>To create an appointment, please provide the following:</h5>
		<br> UserId: <input type="text" name="userId"><br> <br>
		Appointment Date: <input type="datetime-local" name="appointmentDate"><br>
		<br> Location: <input type="text" name="pantryId"><br>
		<br> <input class="btn btn-primary" type="submit"
			value="Submit Appointment" /><br> <br>
	</form>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>


