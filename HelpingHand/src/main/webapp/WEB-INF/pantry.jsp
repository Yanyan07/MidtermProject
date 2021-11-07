<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>

<body>
<div class="page">
		<c:choose>
			<c:when test="${empty sessionScope.pantry}">
			No pantry is found, please go back to search again.
			<form action="login.do" method="get">
				<input class="btn info" type="submit" value="Search Again" />
			</form>
			</c:when>
			<c:otherwise>
				<h3>Thank you for choosing:</h3>
					${sessionScope.pantry.name }<br />
					<form action="list.do" method="get">
						<input class="btn info" type="submit" value="Show Inventory" />
					</form>
			</c:otherwise>
		</c:choose>
		<hr />
		<br />
		<form action="backRecipient.do" method="get">
			<input class="btn info" type="submit" value="Back To Recipient" />
		</form>
		<br />
		<form action="home.do" method="get">
			<input class="btn info" type="submit" value="Back To Home" />
		</form>
		<br>
</div>

</body>
</html>





