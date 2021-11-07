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
		Welcome ${user.username}

		<br>
		<h3>Find Pantry by Pantry Id:</h3>
		<form action="pantry.do" method="post">
			<label>Zip Code:</label><input type="text" name="zipcode" />
			<input class="btn info" type="submit" value="Find Closest Pantry" /> 
		</form>
		<br>
		
		<h3>Your Order History:</h3>
		<form action="orderHistory.do" method="get">
			<input class="btn info" type="submit" value="Show Order History" />
		</form>
		<br>
		
		<form action="home.do" method="get">
			<input class="btn info" type="submit" value="Back To Home" />
		</form>
	</div>
	<br>
</body>
</html>