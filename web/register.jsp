<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            background-image: url("img/andrew-s-ouo1hbizWwo-unsplash_1.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .form-wrapper {
            width: 300px;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 91%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 8px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        p {
            text-align: center;
            margin-top: 20px;
        }

        .error-message {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <h1>Registration Form</h1>

            <c:if test="${not empty requestScope.successMessage}">
                <p>${requestScope.successMessage}</p>
            </c:if>

            <form action="MainController" method="post" name="form-login">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                
                <label for="address">Address</label>
                <input type="text" id="address" name="address" required>
                
                <label for="phonenumber">Phonenumber</label>
                <input type="text" id="phonenumber" name="phonenumber" required>
                
                <input name="action" type="submit" value="Register">
            </form>

            <c:if test="${not empty requestScope.errorMessage}">
                <script>
                    alert("${requestScope.errorMessage}");
                </script>
            </c:if>
        </div>
    </div>
</body>
</html>
