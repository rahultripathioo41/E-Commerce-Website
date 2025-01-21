<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Product Page</title>
    
    <style type="text/css"></style>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script type="text/javascript">
        // Hide forms for products with 0 quantity after the page is fully loaded
        document.addEventListener("DOMContentLoaded", function () {
            const products = ${products}; // Pass products array as JSON
            products.forEach(product => {
                if (product.quantity === 0) {
                    const form = document.getElementById(`productForm-${product.productId}`);
                    if (form) {
                        form.style.display = "none";
                    }
                }
            });
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp" />
    <h1>Welcome ${customer.name}</h1>
    <h2>Your ID is ${customer.id}</h2>
    <form action="viewOrders">
    	<input type="hidden" value="${customer.id}" name="customerId">
    	<button type="submit">view orders</button>
    </form>

    <div class="container mt-5">
        <div class="row">
            <!-- Loop through the products -->
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img class="card-img-top" src="${product.image}"
                             alt="${product.productName}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${product.productName}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">
                                <strong>Price: </strong> ${product.price}
                            </p>
                            <c:if test="${product.quantity > 0}">
                                <form id="productForm-${product.productId}" action="buyProduct" method="post">
                                	<input type="hidden" name="productName" value="${product.productName}">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <input type="hidden" name="productPrice" value="${product.price}">
                                    <input type="hidden" name="customerId" value="${customer.id}">
                                    <input type="number" name="quantity" class="form-control mb-2"
                                           placeholder="Enter quantity" min="1" max="${product.quantity}" required>
                                    <button type="submit" class="btn btn-primary">Buy now</button>
                                </form>
                            </c:if>
                            <c:if test="${product.quantity == 0}">
                                <p class="text-danger">Out of Stock</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
