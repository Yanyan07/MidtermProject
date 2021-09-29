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

	<h2>Show List:</h2>
	<ul>
	<c:forEach var="i" items="${list}">
		<li>${i.inventory.name}</li>
		<form action="addToCart.do" method="post">
 			<input type="hidden" name="inventoryItemId" value="${i.id}"/>
 			<input type="submit" value="Add To Cart" />
 		</form>
	</c:forEach>
	</ul>
	
 	<hr/>
 	<h3>Show the order:</h3>
 	<form action="showOrder.do" method="get">
 		<!-- Cart Id: <input type="text" name="cartId" /><br/> -->
 		<input type="submit" value="Items in Cart" />
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