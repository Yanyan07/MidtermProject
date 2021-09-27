<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Show List:</h2>
	${list} <br/>
	<%-- <ul>
	<c:forEach var="i" items="list">
		<li>${i.id} ${i.name}</li><br/>
	</c:forEach>
	</ul> --%>
 
 	<form action="addToCart.do" method="post">
 		<input type="hidden" name="inventoryId" value="23"/>
 		<input type="submit" value="Add Item To Cart" />
 	</form>
 	
</body>
</html>