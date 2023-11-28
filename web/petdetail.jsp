<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pet Detail</title>
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
            font-family: Arial, sans-serif; /* Use a more common font-family for better compatibility */
            background-color: #f0f0f0; /* Set a light background color */
        }

        nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #000; /* Set a dark background color for the navigation bar */
            padding: 10px;
            color: white; /* Set the text color to white */
        }

        .logo img {
            width: 100px; /* Adjust the logo size */
            height: auto; /* Maintain aspect ratio */
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
            font-weight: bold; /* Make the links bold */
            transition: color 0.3s; /* Add a smooth color transition on hover */
        }

        li a:hover {
            color: #ffc107; /* Change link color on hover */
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
            background-color: #ddd; /* Change button background on hover */
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .avatar img {
            display: flex;
            align-items: center; /* Center items vertically */
            margin-right: 20px;
        }

        .avatar p {
            font-weight: bold;
        }

        /* Adjust styling for larger screens */
        @media screen and (min-width: 768px) {
            nav {
                padding: 20px;
            }

            .logo img {
                width: 200px;
            }
        }

        /* Adjust styling for smaller screens */
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

        /* Hover effect */
        .logout-button:hover {
            background-color: #45a049;
        }

        /* Optional: Adjust the button width or center it on the page */
        .logout-button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .welcome-text {
            font-size: 18px;
            color: #f9f9f9; /* Adjust the color as desired */
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
    </style>
</head>
<body>
    <div class="logo">
        <img src="logo.png" alt="PetCare Logo">
    </div>
    <div class="search">
        <input type="text" placeholder="Search">
        <button type="submit">Search</button>
    </div>
    <div class="user">
        <p>Welcome ${sessionScope.usersession.name}</p> 
        <a href="service.jsp" class="user-service-button">My Services</a>
    </div>

    <nav>
        <ul>
            <li><a href="userProfile.jsp">Profile</a></li>
            <li><a href="resources.jsp">Pet-related Resources</a></li>
            <li><a href="ServiceBooking">Services</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>

    <form action="login" name="form-login" method="POST">
        <input name="action" value="logout" type="submit">
    </form>

    <footer>
        <p>&copy; 2023 PetCare Management System. All rights reserved.</p>
    </footer>
</body>
</html>
