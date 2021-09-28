<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h3>Welcome ${user.username}</h3>
	
	
	<h3>Search the closest pantry by zipcode</h3>
	<form action="pantry.do" method="get">
		zipcode:<input type="text" name="zipcode" />
		<input type="submit" value="Search The Closest Pantry" />
	</form>
	
</body>
</html>