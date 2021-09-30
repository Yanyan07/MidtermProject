<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show the short list</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty shortList}">
				Everything is full!
		</c:when>
		<c:otherwise>
			<c:forEach var="order" items="${shortList}">
					${order.id}
					${order.inventory.name} 
					empty<br />
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<br />
	<hr />
	
	<form action="back.do" method="post">
		<input type="submit" value="Back To Provider" />
	</form>
	
	<form action="home.do" method="get">
		<input type="submit" value="Back To Home" />
	</form>
	

</body>
</html>