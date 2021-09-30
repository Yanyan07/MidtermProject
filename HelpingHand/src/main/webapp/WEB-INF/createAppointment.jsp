<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make an appointment</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="css/home.css">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Helping Hand</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="list.jsp">List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">???</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Login/Create Account
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

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