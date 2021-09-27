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
	
	<h3>Show List</h3>
	${list} <br/>
	<%-- <ul>
	<c:forEach var="i" items="list">
		<li>${i}</li><br/>
	</c:forEach>
	</ul> --%>
	<hr/>
	
	<form action="login.do" method="get" >
		Username: <input type="text" name="username" /><br/>
		Password: <input type="text" name="password" /><br/>
		<input type="submit" value="Login as Recipient" >
	</form>
	<br/>
	<form action="login.do" method="get" >
		Username: <input type="text" name="username" /><br/>
		Password: <input type="text" name="password" /><br/>
		<input type="submit" value="Login as Provider" >
	</form>

	<form action="list.do" method="get">
		ID: <input type="text" value="id" />
		<input type="submit" value="Show List" />
	</form>

</body>
</html>