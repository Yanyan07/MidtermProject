<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
<div class="page" >
	<h3>Please Sign In</h3>

	<form action="login.do" method="post">
		<label>Username:</label> <input type="text" name="username" placeholder="rlarson" /><br /> 
		<label>Password:</label> <input type="text" name="password" placeholder="ralphlarson" /><br /> 
		<input class="btn info" type="submit" value="Login as Recipient">
	</form>
	<br />
	<form action="login.do" method="post">
		<label>Username:</label> <input type="text" name="username" placeholder="atate" /><br /> 
		<label>Password:</label> <input type="text" name="password" placeholder="anntate" /><br /> 
		<input class="btn info" type="submit" value="Login as Provider">
	</form>
	<br />
	
	<form action="signup.do" method="post">
		<label>Username:</label> <input type="text" name="username" /><br /> 
		<label>Password:</label> <input type="text" name="password" /><br /> 
		<label>Role:</label> <input type="text" name="role" /><br /> 
		<label>FirstName:</label> <input type="text" name="firstName" /><br /> 
		<label>LastName:</label> <input type="text" name="lastName" /><br /> 
		<label>Email:</label> <input type="text" name="email" /><br /> 
		<label>Phone:</label> <input type="text" name="phone" /><br /> 
		<input class="btn info" type="submit" value="Sign Up">
	</form>
	<br />
	
	<form action="logout.do" method="post">
		<input class="btn info" type="submit" value="Sign Out" />
	</form>
	<br />
	
	<form action="home.do" method="get">
		<input class="btn info" type="submit" value="Back To Home" />
	</form>
</div>
</body>
</html>