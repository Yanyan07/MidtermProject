<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Login</h3>
	Welcome ${user.username}
	
	<h3>Find Our Pantry's Appointments</h3>
	<form action="appointments.do" method="post">
	<input type="submit"/>
	</form>
	
	
</body>
</html>