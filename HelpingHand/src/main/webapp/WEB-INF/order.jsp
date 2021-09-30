<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 <link rel="stylesheet" type="text/css" href="css/home.css">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Helping Hand</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="list.jsp">List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">???</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Login/Create Account
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
	<h3>Show Order:</h3>
<%-- <table>
	<c:forEach var="i" items="${list}">
		<tr>
			<td>${i.id}</td>
			<td>${i.inventory.name}</td>
			<td>
				<form action="addToCart.do" method="post">
 				<input type="hidden" name="inventoryItemId" value="${i.id}"/>
 				<input type="submit" value="Add To Cart" />
 				</form>
			</td>
		</tr>
	</c:forEach>
</table> --%>

<c:choose>
	<c:when test="${empty orderItems}">
		You haven't order yet!
	</c:when>
	<c:otherwise>
	<table>
		<tr>
			<td>Item Id</td>
			<td>Name</td>
			<td>Operation</td>
		</tr>
		<c:forEach var="order" items="${orderItems}">
		<tr>
			<td>${order.id}</td>
			<td>${order.inventoryItem.inventory.name}</td>
			<td>
				<form action="delete.do" method="post">
					<input type="hidden" name="cartItemId" value="${order.id}" /> 
					<input type="submit" value="Delete" />
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
	</c:otherwise>
</c:choose>
		
	<br />
	<hr />
	
	<form action="placeOrder.do" method="post">
		<input type="submit" value="Place Your Order" />
	</form>
	
	<form action="list.do" method="get">
		<input type="submit" value="Back To List" />
	</form>

</body>
</html>