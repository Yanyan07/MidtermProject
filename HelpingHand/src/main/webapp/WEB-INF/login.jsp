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

<h3>Please SignIn</h3>
<br/>
	
	<form action="login.do" method="get" >
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

</body>
</html>