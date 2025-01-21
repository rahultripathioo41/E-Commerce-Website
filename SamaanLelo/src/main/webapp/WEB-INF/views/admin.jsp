<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 30px; /* Added margin of 30px */
        background-color: #f4f4f9;
    }

    h1 {
        text-align: center;
        color: #333;
    }

    button {
        background: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 10px 15px;
        font-size: 16px;
        cursor: pointer;
        margin: 10px 0;
    }

    button:hover {
        background: #0056b3;
    }

    .form-container {
        max-width: 600px;
        margin: 20px auto;
        background: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .form-row {
        display: flex;
        gap: 20px;
        margin-bottom: 15px;
    }

    .form-row label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-row input {
        flex: 1;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    .form-row input:focus {
        border-color: #007bff;
        outline: none;
    }

    .submit-btn {
        background: #28a745;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
    }

    .submit-btn:hover {
        background: #218838;
    }

    #form, #form2 {
        display: none;
    }
</style>
<script>
    function showForm() {
        document.getElementById("form").style.display = "block";
        document.getElementById("form2").style.display = "none";
    }

    function showForm2() {
        document.getElementById("form2").style.display = "block";
        document.getElementById("form").style.display = "none";
    }
</script>
</head>
<body>
    <jsp:include page="header.jsp" />
    <h1>Ha bhai tu hi admin hai</h1>
    <p style="text-align: center;">
        Product submit krna hai? 
        <button id="insertButton" onclick="showForm()">Ha</button>
    </p>
    <p style="text-align: center;">
        Product update krna hai? 
        <button id="updateButton" onclick="showForm2()">Ha</button>
    </p>

    <div class="form-container" id="form">
        <form action="submitProduct">
            <div class="form-row">
                <div>
                    <label for="productName">Product Name</label>
                    <input type="text" id="productName" name="productName" placeholder="Enter the name">
                </div>
                <div>
                    <label for="quantity">Quantity</label>
                    <input type="number" id="quantity" name="quantity" placeholder="Enter the quantity">
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label for="price">Price</label>
                    <input type="number" id="price" name="price" placeholder="Enter the price">
                </div>
                <div>
                    <label for="supplierName">Supplier Name</label>
                    <input type="text" id="supplierName" name="supplierName" placeholder="Enter the supplier name">
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label for="image">Image</label>
                    <input type="text" id="image" name="image" placeholder="Enter the image path">
                </div>
                <div>
                    <label for="description">Product Description</label>
                    <input type="text" id="description" name="description" placeholder="Enter the description">
                </div>
            </div>

            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>

    <div class="form-container" id="form2">
        <form action="updateProduct">
            <div class="form-row">
                <div>
                    <label for="productId">Product ID</label>
                    <input type="number" id="productId" name="productId" placeholder="Enter the ID">
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label for="quantity">Quantity</label>
                    <input type="number" id="quantity" name="quantity" placeholder="Enter the quantity">
                </div>
                <div>
                    <label for="price">Price</label>
                    <input type="number" id="price" name="price" placeholder="Enter the price">
                </div>
            </div>

            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
