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

	<c:choose>
		<c:when test="${empty sessionScope.pantry}">
			No pantry is found, please go back to search again.
			<form action="login.do" method="get">
				<input type="submit" value="Search Again" />
			</form>
		</c:when>
		<c:otherwise>
			<h3>Thank you for choosing:</h3>
			${sessionScope.pantry.name }<br />
			<form action="list.do" method="get">
				<%-- <input type="hidden" name="pantryId" value="${sessionScope.pantry.id}" /><br/> --%>
				<input type="submit" value="Show Inventory of the Pantry" />
			</form>
		</c:otherwise>
	</c:choose>

	<hr />

	<h3>Your Order Is Placed!</h3>
	<form></form>

	<br />
	<form action="backRecipient.do" method="get">
		<input type="submit" value="Back To Recipient" />
	</form>

	<br />
	<form action="home.do" method="get">
		<input type="submit" value="Back To Home" />
	</form>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>