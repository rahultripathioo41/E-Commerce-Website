<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        .order-container {
            width: 80%;
            margin: 20px auto;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .no-orders {
            text-align: center;
            padding: 20px;
            font-size: 18px;
            color: #777;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
    <h1>Customer Orders</h1>
    <div class="order-container">
        <c:choose>
            <c:when test="${not empty orderList}">
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Product Id</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Total Cost</th>
                            
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orderList}">
                            <tr>
                                <td>${order.orderId}</td>
                                <td>${order.date}</td>
                                <td>${order.productId}</td>
                                <td>${order.productName}</td>
                                <td>${order.quantity}</td>
                                <td>${order.totalCost}</td>
                             
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="no-orders">
                    No orders found for this customer.
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
