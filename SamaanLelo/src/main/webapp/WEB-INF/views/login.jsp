<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Full height for centering */
        flex-direction: column;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 300px;
        display: flex;
        flex-direction: column;
        margin:30px;
    }

    form input[type="email"],
    form input[type="password"] {
        width: 100%;
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

    /* Responsive design for smaller screens */
    @media (max-width: 600px) {
        form {
            width: 90%;
        }
    }

    /* Padding for body to ensure footer is not overlapping */
    .content {
        padding-bottom: 50px; /* Height of the footer */
    }
</style>
</head>
<jsp:include page="header.jsp" />
<body>
    <div class="content">
        <form action="login">
            <h2>Welcome to the Login Page</h2>
            <label for="email">Email:</label><br>
            <input name="email" id="email" type="email" required><br>
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
<jsp:include page="footer.jsp" />
</html>
