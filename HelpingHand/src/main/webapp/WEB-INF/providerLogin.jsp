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
	<h3>Find Pantry by Id:</h3>
		<form action="pantryId.do" method="post">
			<label>Pantry Id:</label><input type="text" name="pantryId" />
			<input class="btn info" type="submit" />
		</form>
	<br>
	<hr/>
	<br>
	<form action="signin.do" method="get">
		<input class="btn info" type="submit" value="Back To SignIn" />
	</form> 
	<br/>
	<form action="home.do" method="get">
		<input class="btn info" type="submit" value="Back To Home" />
	</form>   
</div>
</body>
</html>