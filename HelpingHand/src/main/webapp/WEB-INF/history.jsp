<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Order History</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty orderHistory}">
				You haven't order yet!
		</c:when>
		<c:otherwise>
			<ul>
			<c:forEach var="order" items="${orderHistory}">
					<li>${order.key.name} ${order.value}</li>
			</c:forEach>
			</ul>
		</c:otherwise>
	</c:choose>
	<br/>
	<form action="backPantry.do" method="get">
		<input type="submit" value="Back To Pantry"  />
	</form>
</body>
</html>