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

	<c:choose>
		<c:when test="${empty sessionScope.pantry}">
			No pantry is found, please go back to search again.
			<form action="login.do" method="get" >
				<input type="submit" value="Search Again"/>
			</form>
		</c:when>
		<c:otherwise>
			<h3>Thank you for choosing:</h3>
			${sessionScope.pantry.name }<br/>
			<form action="list.do" method="get">
			<%-- <input type="hidden" name="pantryId" value="${sessionScope.pantry.id}" /><br/> --%>
			<input type="submit" value="Show Inventory of the Pantry" />
			</form>
		</c:otherwise>
	</c:choose>

	<hr />
	
	<!-- <form action="orderHistory.do" method="get">
		<input type="submit" value="Show Order History" />
	</form> -->
	
	
	<h3>Your Order Is Placed!</h3>
	<form>
		
	</form>
	
	<br/>
	<form action="backRecipient.do" method="get">
		<input type="submit" value="Back To Recipient" />
	</form>
	
	<br/>
	<form action="home.do" method="get">
		<input type="submit" value="Back To Home" />
	</form>
</body>
</html>