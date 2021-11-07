<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">

</head>
<body>

<div class="page" >

	<c:if test="${empty sessionScope.user}">
		You haven't registered yet or failed to register, please register.
	</c:if>
	<br/>
	<hr/>
	
	<form action="signin.do" method="get">
		<!-- <label>Username:</label> <input type="text" name="username" /><br /> 
		<label>Password:</label> <input type="text" name="password" /><br /> 
		<label>Role:</label> <input type="text" name="role" /><br />  -->
		<input class="btn info" type="submit" value="Sign Up">
	</form>
	<br />

	<form action="home.do" method="get">
		<input class="btn info" type="submit" value="Back To Home" />
	</form>
	
</div>
</body>
</html>