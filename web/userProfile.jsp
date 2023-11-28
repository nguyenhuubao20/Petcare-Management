<%@page import="Pets.PetsDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
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
                    width: 10px;
                    height: 10px;
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

            .pet-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                margin-top: 20px;
            }

            .pet-container > div {
                max-width: 200px;
                text-align: center;
            }

            /* ... Your existing CSS styles ... */

            .user-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                align-items: center;
                gap: 20px;
                margin-top: 20px;
            }

            .user-info {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .user-info p {
                margin: 0;
            }

            .user-container img {
                height: 150px;
                width: 150px;
                border-radius: 50%;
                object-fit: cover;
                background: #dfdfdf;
            }
            img{
                height: 150px;
                width: 150px;
                border-radius: 50%;
                object-fit: cover;
                background: #dfdfdf;
            }

            form[action="ProfileController"] {
                display: inline-block;
                margin-right: 10px;
            }

            form[action="ProfileController"] input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 8px 16px;
                cursor: pointer;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            form[action="ProfileController"] input[type="submit"]:hover {
                background-color: #0056b3;
            }
            form[action="PetController"] {
                display: inline-block;
            }

            form[action="PetController"] input[type="submit"] {
                background-color: #28a745;
                color: #fff;
                border: none;
                padding: 8px 16px;
                cursor: pointer;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            form[action="PetController"] input[type="submit"]:hover {
                background-color: #1e7e34;
            }

        </style>
    </head>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const image = document.querySelector("img");
            const input = document.querySelector("input[type=file]");

            input.addEventListener("change", () => {
                image.src = URL.createObjectURL(input.files[0]);
            });
        });
    </script>
    <body>
        <header>
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
                    <c:if test="${empty sessionScope.user.name}">
                        <p class="welcome-text">You do not have any account? 
                            <a href="register.jsp">Sign up</a> to join us or
                            <a href="login.jsp">Log in</a>
                        </p>
                    </c:if>
                    <c:if test="${not empty sessionScope.user.name}">
                        <p class="welcome-text">Welcome <span class="user-name">${sessionScope.user.name}</span></p>
                        </c:if>
                </div>
            </nav>
        </header>


        <div class="user-container">
            <img src="https://nhanvietluanvan.com/wp-content/uploads/2023/05/c6e56503cfdd87da299f72dc416023d4-736x620.jpg"/>

            <div class="user-info">
                <p>Welcome ${sessionScope.user.name}</p>
                <p>Email: ${sessionScope.user.email}</p>
                <p>Address: ${sessionScope.user.address}</p>
                <p>Phone number: ${sessionScope.user.phonenumber}</p>
                <div>
                    <a href="addPet.jsp">Add more pet</a>
                </div>
            </div>



            <form action="ProfileController" method="POST">
                <input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
                <input type="hidden" name="action" value="edit">
                <input name="action" value="Edit" type="submit">
            </form>

            <form action="PetController" method="GET">
                <input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
                <input type="hidden" name="action" value="getall">
                <input type="submit" value="All your pets">
            </form>    
        </div>

        <br>



        <div class="pet-container">
            <c:if test="${not empty requestScope.listPetsDTO}">

                <c:forEach var="p" items="${requestScope.listPetsDTO}" varStatus="count">
                    <div>
                        <img src="${p.profilePicture}" alt="Pet Image"/>

                        <p>Number no: ${count.index + 1}</p>
                        <p>Pet Name: ${p.petName}</p>
                        <p>Pet Age: ${p.petAge}</p>
                        <p>Allergy: ${p.allergy} </p>
                        <p>Pet added date: ${p.orderDate}</p>
                        <form action="PetController" method="POST">
                            <input type="hidden" name="pet_id" value="${p.petId}">
                            <input type="hidden" name="action" value="edit">
                            <input name="action" value="Change Information" type="submit">
                        </form>
                        <br>
                        <form action="PetController" method="POST" style="display: inline;">
                            <input type="hidden" name="pet_id" value="${p.petId}">
                            <input type="hidden" name="action" value="delete">
                            <input name="action" value="Delete Pet" type="submit">
                        </form>                        
                    </div>
                    <br>

                </c:forEach>
            </c:if>

        </div>


        <br>
        <footer>

            <div class="footer-columns">
                <div class="footer-column1">
                    <img src="https://monspet.com/wp-content/uploads/2023/06/cropped-2-1-300x82.png" class="logo-footer">
                </div>
                <div class="footer-column">
                    <h3>List of pages</h3>
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
            <p>&; 2023 User Profile System. All rights reserved.</p>
        </footer>
    </body>
</html>