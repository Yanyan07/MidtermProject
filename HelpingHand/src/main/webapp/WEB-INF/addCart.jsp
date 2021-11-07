<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Cart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>

	<div class="page">
		<h3>add item:</h3>
		<c:choose>
			<c:when test="${empty isAdded}">
			Fail to add item to cart!
		</c:when>
			<c:otherwise>
			Congratulations! The item has been added to cart!
		</c:otherwise>
		</c:choose>

		<form action="backList.do" method="get">
			<input class="btn info" type="submit" value="Back To List" />
		</form>
	</div>
</body>
</html>