<%-- 
    Document   : insertservice
    Created on : Jul 21, 2023, 3:46:29 AM
    Author     : sontv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>

        .my-btn {
            background-color: #333;
            color: #000;
            border: none;
            min-width: 160px;
            padding: 10px;
            z-index: 1;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .my-btn:hover {
            background-color: #fff;
            color: #333;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif; 
            background-color: #f0f0f0;
        }

        nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #000; 
            padding: 10px;
            color: white; 
        }

        .logo img {
            width: 100px;
            height: auto; 
        }

        ul {
            list-style-type: none;
            display: flex;
        }

        li {
            margin-left: 20px;
        }

        li a {
            text-decoration: none;
            color: white;
            font-weight: bold; 
            transition: color 0.3s; 
        }

        li a:hover {
            color: #ffc107; 
        }

        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content button {
            display: block;
            width: 100%;
            text-align: left;
            padding: 10px;
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .dropdown-content button:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .avatar img {
            display: flex;
            align-items: center;
            margin-right: 20px;
        }

        .avatar p {
            font-weight: bold;
        }

 
        @media screen and (min-width: 768px) {
            nav {
                padding: 20px;
            }

            .logo img {
                width: 200px;
            }
        }


        @media screen and (max-width: 576px) {
            nav {
                flex-direction: column;
                align-items: flex-start;
            }

            ul {
                margin-top: 10px;
            }

            li {
                margin-left: 0;
                margin-bottom: 10px;
            }

            .avatar img {
                width: 30px;
                height: 30px;
            }

            .avatar p {
                font-size: 14px;
            }
        }
        select,
        input[type="text"],
        button {
            padding: 8px 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        select {
            margin-right: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        .logout-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 5px;
            margin-left: 20px;
        }

        .logout-button:hover {
            background-color: #45a049;
        }


        .logout-button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .welcome-text {
            font-size: 18px;
            color: #f9f9f9; 
        }
        .user-name {
            font-size: 24px;
            font-style: italic;
            font-weight: bold;
            color: #fff;
        }

        footer {
            background-color: #000;
            color: #fff;
            padding: 30px 0;
            height: 190px;
        }

        .footer-columns {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        .footer-column {
            flex-basis: 30%;
            margin-bottom: 20px;
        }
        .footer-column:first-child {
            flex-basis: 40%;
        }

        .footer-column h3 {
            font-size: 18px;
            margin-bottom: 10px;
            margin-left: 20px;
        }

        .footer-column ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .footer-column li {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }


        .footer-column img {
            width: 24px;
            height: 24px;
            margin-right: 10px;
        }

        .footer-column a {
            color: #fff;
            text-decoration: none;
        }

        .footer-column a:hover {
            color: #ff0000;
        }

        footer p {
            background-color: #f1f1f1;
            padding: 10px;
            text-align: center;
            margin-top: 20px;
        }

        footer p {
            background-color: #f1f1f1;
            padding: 10px;
            text-align: center;
            margin-top: 20px;
            color: #000;
        }
        .pet-logo{
            width: 25%;
            height: 25%;
        }
        .logo-footer{
            width: 100%;
            height: 100%;
        }

form {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  background-color: #f9f9f9;
}

form label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

form input[type="text"],
form input[type="number"],
form textarea,
form input[type="date"] {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 10px;
}

form textarea {
  resize: vertical;
}

form input[type="submit"] {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 10px 16px;
  cursor: pointer;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  width: 100%;
}

form input[type="submit"]:hover {
  background-color: #0056b3;
}

a.comeback-link {
  display: inline-block;
  background-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  text-decoration: none;
  border-radius: 5px;
  margin-bottom: 20px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

a.comeback-link:hover {
  background-color: #0056b3;
}

        
    </style>
    <nav>
        <div class="logo">
            <img src="https://monspet.com/wp-content/uploads/2023/06/cropped-2-1-300x82.png" class="pet-logo">
        </div>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="userProfile.jsp">Profile</a></li>
            <li class="dropdown">
                <a href="#" class="dropbtn">Pet-related Resources &#9662;</a>
                <div class="dropdown-content">
                    <form action="NewsContronller" style="display: flex; align-items: center; justify-content: center;">
                        <input type="hidden" name="category" value="Dog" />
                        <button class="my-btn" type="submit">Dog</button>
                    </form>
                    <form action="NewsContronller" style="display: flex; align-items: center; justify-content: center;">
                        <input type="hidden" name="category" value="Cat" />
                        <button class="my-btn" type="submit">Cat</button>
                    </form>
                    <form action="NewsContronller" style="display: flex; align-items: center; justify-content: center;">
                        <input type="hidden" name="category" value="OtherAnimal" />
                        <button class="my-btn" type="submit">Other Animal</button>
                    </form>
                </div>
            </li>
            <li><a href="ServiceBooking">Services</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
        <div class="logout-button-container">
            <c:if test="${not empty sessionScope.user.name}">
                <form action="login" name="form-login" method="POST">
                    <button class="logout-button" name="action" type="submit">
                        Log out
                    </button>
                </form>
            </c:if>
        </div>
        <div class="avatar">
            <c:if test="${not empty sessionScope.user.name}">
                <p class="welcome-text">Welcome <span class="user-name">${sessionScope.user.name}</span></p>
            </c:if>
        </div>
    </nav>

    <body>
<a class="comeback-link" href="admin.jsp">Comeback to admin page</a>

        <h1>Input Service Provider:</h1>
        <h3>Sample(Follow this sample)</h3>

        <p>Name:Healthy Pets Clinic </p> 
        <p>Type:Veterinary Care </p> 
        <p>Location:Quan 1</p> 
        <p>Descriptiopn:Quality veterinary care for your beloved pets to keep them happy and healthy.</p> 
       <p>Price:75.0</p> 
         <p>Date:2023-07-21</p> 
         <br>
         <br>
         
        <form action="AdminController" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>

            <label for="type">Type:</label>
            <input type="text" id="type" name="type" required><br>

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" required><br>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" step="0.01" required><br>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required><br>

            <input type="submit" value="Save">
        </form>
${messdone}
        <footer>
            <div class="footer-columns">
                <div class="footer-column1">
                    <img src="https://monspet.com/wp-content/uploads/2023/06/cropped-2-1-300x82.png" class="logo-footer">
                </div>
                <div class="footer-column">
                    <ul>
                        <li><a href="#">Introduction</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Follow us at</h3>
                    <ul>
                        <li><a href="#"><img src="https://cdn-icons-png.flaticon.com/128/5968/5968764.png" alt="Image 1"></a></li>
                        <li><a href="#"><img src="https://cdn-icons-png.flaticon.com/128/3955/3955024.png" alt="Image 2"></a></li>
                        <li><a href="#"><img src="https://cdn-icons-png.flaticon.com/128/3670/3670147.png" alt="Image 3"></a></li>
                    </ul>
                </div>

            </div>
            <p>&copy; 2023 PetCare Management System. All rights reserved.</p>
        </footer> 
    </body>
</html>
