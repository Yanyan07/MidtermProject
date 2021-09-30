<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	
	<h3>Show stuff short in stock:</h3>
	<form action="short.do" >
		<input type="submit" />
	</form>
	
	<h3>Refill Inventory Item</h3>
	<form action="refill.do" >
		<input type="submit" />
	</form>
	
	
	<c:if test="${not empty appointments}">
		<h3>Show appointments in this pantry</h3>
		<c:forEach var="app" items="${appointments}">
			${sessionScope.user.id}
			${sessionScope.user.firstName}
			${app.appointmentDate}<br/>
		</c:forEach>
	</c:if>
	
</body>
</html>