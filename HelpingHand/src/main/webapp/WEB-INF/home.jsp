<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helping Hand</title>
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


	
	<div id="Main">
	
	<h1>Welcome to Helping Hand</h1>

	<%-- ${DEBUG.firstName}
	${DEBUG.lastName}  --%>
	<!-- <hr/> -->
	
	<%-- <h3>Show List</h3>
	${list}  --%>
	<%-- <ul>
	<c:forEach var="i" items="list">
		<li>${i}</li>
	</c:forEach>
	</ul> --%>
	<!-- <hr/> -->
	
	<!-- image goes here -->
	<img src="https://www.w3schools.com/images/lamp.jpg" alt="Food Pantry Homepage" width="500" height="500">
	
	
	<!-- <form action="login.do" method="get" >
		Username: <input type="text" name="username" /><br/>
		Password: <input type="text" name="password" /><br/>
		<input type="submit" value="Login as Recipient" >
	</form>
	<br/>
	<form action="login.do" method="get" >
		Username: <input type="text" name="username" /><br/>
		Password: <input type="text" name="password" /><br/>
		<input type="submit" value="Login as Provider" >
	</form>

	<form action="list.do" method="get">
		ID: <input type="text" value="id" />
		<input type="submit" value="Show List" />
	</form> -->
	</div>
	
	

</body>
</html>