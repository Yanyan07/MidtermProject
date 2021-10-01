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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Helping Hand</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" aria-current="page" href="home.do">Home</a>
					<!-- <a
						class="nav-link" href="pantry.do">Pantry</a> -->
					<a class="nav-link" href="signin.do">Login</a>
					<!-- <a class="nav-link disabled">Disabled</a> -->
				</div>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<div class="page">
			<form action="newappointment.do" method="POST">
				<center><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Schedule a Pickup Appointment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3></center>
				<label>Date:</label>
				<input type="datetime-local" name="appointmentDate"><br>
				<center><input class="btn info" type="submit" value="Submit Appointment" /></center>
			</form>


			<c:if test="${not empty appointment}">
				<center><h4>You have appointment at:</h4></center>
	<center>${appointment.appointmentDate}</center><br />
	<center>Pick up at:</center><br /> 
	<center>${appointment.pantry.address.streetAddress }</center>
	<center>${appointment.pantry.address.city }</center>
	</c:if>

			<br />
			<center><form action="backRecipient.do" method="get">
				<input class="btn info" type="submit" value="Back To Recipient" />
			</form></center>

			<br />
			<center><form action="home.do" method="get">
				<input class="btn info" type="submit" value="Back To Home" />
			</form></center>
		</div>
		
		<center><img src="https://www.gannett-cdn.com/presto/2021/07/05/NAAS/0bbd2250-5e90-4eea-8492-cfeea171f0ee-Calendar.JPG?crop=851,479,x0,y0&width=851&height=479&format=pjpg&auto=webp" width="700" height="500">

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