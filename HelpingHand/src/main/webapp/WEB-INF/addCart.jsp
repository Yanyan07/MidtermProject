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
		<input type="submit" value="Back To List"  />
	</form>
	
</body>
</html>