<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin:30px;
    }
    a {
        display: inline-block;
        text-decoration: none;
        color: white;
        background-color: #007BFF;
        padding: 10px 20px;
        border-radius: 5px;
        margin: 10px;
        font-size: 16px;
    }
    a:hover {
        background-color: #0056b3;
    }
    .text {
        margin: 20px 0;
        font-size: 18px;
        color: #333;
    }
</style>
</head>
	<jsp:include page="WEB-INF/views/header.jsp" />
<body>
    <a href="loginHere">Login Here</a><br>
    <div class="text">New Customer?</div>
    <a href="register">Register Here</a>
</body>
    <jsp:include page="WEB-INF/views/footer.jsp" />
</html>
