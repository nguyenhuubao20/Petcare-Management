<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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

            .login-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-form {
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

            .error-message {
                text-align: center;
                color: red;
                margin-top: 10px;
            }

            .register-link {
                text-align: center;
                margin-top: 20px;
            }

            .register-link a {
                color: #333;
                text-decoration: none;
            }

            .register-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="login-form">
                <h1>Login</h1>
                <form action="MainController" name="form-login" method="POST">
                    <%! String err;%>
                    <% err = (String) request.getAttribute("error");
                        if (err != null) {%>
                    <p class="error-message"><%= err%></p>
                    <% }%>
                    <label for="email">Email:</label>
                    <input name="email" type="text" placeholder="Email (name@example.com)">

                    <label for="password">Password:</label>
                    <input name="password" type="password" placeholder="Password">


                    <input name="action" value="Login" type="submit">
                </form>

                <div class="register-link">
                    <p>Don't have an account? <a href="register.jsp">Register</a></p>
                    <p>Remember password</p><input type="checkbox" id="remember" name="remember"> 
                </div>
            </div>
        </div>
    </body>
</html>
