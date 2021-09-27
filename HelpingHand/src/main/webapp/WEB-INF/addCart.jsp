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
			Fail to create cart!
		</c:when>
		<c:otherwise>
			Congratulations! The cart has been created!
		</c:otherwise>
	</c:choose>
</body>
</html>