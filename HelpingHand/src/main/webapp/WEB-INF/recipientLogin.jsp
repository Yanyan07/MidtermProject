<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Portal</title>
</head>
<body>
	<h3>Login</h3>
	Welcome ${user.username}
	
	<h3>List the Items</h3>
	<form action="list.do" method="get">
	 <input type="submit" />
	</form>
	
	<h3>Find My Pickup Appointment/s</h3>
	<form action="appointments.do" method="get">
	<input type="submit"/>
	</form>
	
	<h3>Schedule a Pickup Appointment</h3>
	<form action="newappointment.do" method="get">
	<input type="submit"/>
	</form>
</body>
</html>