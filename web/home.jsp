<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title>PetCare Management System</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
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
            .slogan {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
                color: #fff;
            }

            .slogan h2 {
                font-size: 24px;
                margin-bottom: 16px;
            }

            .slogan p {
                font-size: 18px;
                margin-bottom: 24px;
            }

            .slogan .cta-button {
                display: inline-block;
                padding: 12px 24px;
                background-color: #333;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
                font-size: 18px;
            }

            .slogan .cta-button:hover {
                background-color: #555;
            }

            .pet-image{
                width: 100%;
                height: 50%;
            }

            .introduction-section {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 50px;
            }

            .introduction-section .content {
                flex: 1;
            }

            .introduction-section .content h1 {
                font-size: 36px;
                margin-bottom: 16px;
            }

            .introduction-section .content p {
                font-size: 18px;
                margin-bottom: 24px;
            }

            .introduction-section .image {
                flex: 1;
                padding: 0 50px;
            }

            .introduction-section .image img {
                width: 100%;
                height: auto;
            }

            .commitment-section {
                padding: 50px;
                background-color: #999;
                text-align: center;
            }

            .commitment-section h2 {
                font-size: 24px;
                margin-bottom: 16px;
            }

            .commitment-section .commitment-items {
                display: flex;
                justify-content: space-around;
                align-items: center;
                flex-wrap: wrap;
                margin-top: 30px;
            }

            .commitment-section .commitment-item {
                flex-basis: 30%;
                padding: 20px;
                margin-bottom: 20px;
                background-color: #fff;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            }

            .commitment-section .commitment-item h3 {
                font-size: 18px;
                margin-bottom: 10px;
            }

            .commitment-section .commitment-item p {
                font-size: 16px;
                margin-bottom: 10px;
            }

            .commitment-section .commitment-item img {
                width: 64px;
                height: 64px;
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
                        <a href="register.jsp">Register</a> and join with us or 
                        <a href="login.jsp">Log in</a>
                    </p>
                </c:if>
                <c:if test="${not empty sessionScope.user.name}">
                    <p class="welcome-text">Welcome <span class="user-name">${sessionScope.user.name}</span></p>
                    </c:if>
            </div>
        </nav>
                    </header>
        <img src="https://www.chamsocpet.com/wp-content/uploads/2021/12/kham-pha-nhung-dieu-thu-vi-ve-meo-2.jpg" alt="Pet Image" class="pet-image">
        <div class="slogan">
            <h1>3AEPetCare</h1>
            <p>Organize and track your pet's health and activities</p>
            <h2>Treat your pet like a part of your family</h2>
            <p>Discover a comprehensive platform to manage and care for your beloved pets.</p>
            <a href="login.jsp" class="cta-button">Get Started</a>
        </div>

        <div class="introduction-section">
            <div class="content">
                <h1>Introduction</h1>
                <p>The purpose of the PetCare Management system is to provide a web-based platform where users can conveniently access and manage detailed information about their pets.
                    It aims to assist pet owners in organizing and tracking essential details related to their pets' health, activities, and general well-being.</p>
                <a href="login.jsp" class="cta-button">Detail</a>
            </div>
            <div class="image">
                <img src="https://static-images.vnncdn.net/files/publish/2022/5/24/anh-cho-bull-phap-3-1304.jpg" alt="intro-Image">
            </div>
        </div>

        <div class="commitment-section">
            <h2>Our Commitments</h2>
            <div class="commitment-items">
                <div class="commitment-item">
                    <h3>Content</h3>
                    <img src="https://cdn-icons-png.flaticon.com/128/3079/3079941.png" alt="Content Icon">
                    <p>Quality content, accurate, reputable sources, vetted, and carefully vetted.</p>
                </div>
                <div class="commitment-item">
                    <h3>Product</h3>
                    <img src="https://cdn-icons-png.flaticon.com/128/2652/2652218.png" alt="Product Icon">
                    <p>Products are suggested fairly, analyzed and reviewed in detail accurately.</p>
                </div>
                <div class="commitment-item">
                    <h3>Support</h3>
                    <img src="https://cdn-icons-png.flaticon.com/128/1067/1067566.png" alt="Support Icon">
                    <p>Fully support, guide reputable and quality pet medical examination sources.</p>
                </div>
            </div>
        </div>
  </body>



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
</html>

