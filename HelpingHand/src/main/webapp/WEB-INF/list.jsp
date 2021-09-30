<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Your Order</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

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
>>>>>>> 5fd171abf9d1a58640898f3a21599df3b796a6a9
</nav>

	<h2>Show List:</h2>
<<<<<<< HEAD
	<!--  <ul>-->
	<table>
		<c:forEach var="i" items="${list}">
			<tr>
				<td>${i.inventory.name}</td>
				<td>
					<form action="addToCart.do" method="post">
						<input type="hidden" name="inventoryItemId" value="${i.id}" /> <input
							type="submit" value="Add To Cart" />
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<hr />
	<h3>Show the order:</h3>
	<form action="showOrder.do" method="get">
		<input type="submit" value="Items in Cart" />
	</form>

	<br />
=======
<table>
	<c:forEach var="i" items="${list}">
		<tr>
			<td>${i.inventory.name}</td>
			<td>
				<form action="addToCart.do" method="post">
 				<input type="hidden" name="inventoryItemId" value="${i.id}"/>
 				<input type="submit" value="Add To Cart" />
 				</form>
			</td>
		</tr>
	</c:forEach>
</table>
	
 	<hr/>
 	<h3>Show the order:</h3>
 	<form action="showOrder.do" method="get">
 		<input type="submit" value="Items in Cart" />
 	</form>
 	
 	<br/>
>>>>>>> 5fd171abf9d1a58640898f3a21599df3b796a6a9
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