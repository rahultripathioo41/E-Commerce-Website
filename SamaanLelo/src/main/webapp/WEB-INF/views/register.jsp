<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    h2 {
        text-align: center;
        color: #333;
    }
    form {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 300px;
    }
    form input[type="text"],
    form input[type="email"],
    form input[type="password"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }
    form input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        width: 100%;
        cursor: pointer;
        font-size: 16px;
    }
    form input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
    <form action="registerDetails">
        <h2>Welcome to the Registration Page</h2>
        <label for="name">Name:</label><br>
        <input name="name" id="name" type="text"><br>
        <label for="email">Email:</label><br>
        <input name="email" id="email" type="email"><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br>
        <input type="submit" value="Submit">
    </form>
    <jsp:include page="footer.jsp" />
</body>
</html>
