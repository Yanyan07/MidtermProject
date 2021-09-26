<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helping Hand</title>
</head>
<body>

	<h1>Welcome to Helping Hand</h1>

	${DEBUG.firstName} <br/>
	${DEBUG.lastName} <br/>
	<hr/>
	
	<h3>Show User</h3>
	${user.firstName} <br/>
	${user.lastName} <br/>
	<hr/>
	
	<h3>Show Inventory</h3>
	${i}
	<hr/>
	
	<h3>Show List</h3>
	${list} <br/>
	<hr/>

	<form action="list.do" method="get">
		ID: <input type="text" value="id" />
		<input type="submit" value="Show List" />
	</form>

</body>
</html>