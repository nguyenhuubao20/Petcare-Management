<%--
    Document   : dogsource
    Created on : Jul 11, 2023, 10:16:52 AM
    Author     : ADMIN-PC
--%>

<%@page import="Resources.ResourcesDAO"%>
<%@page import="Resources.ResourcesDTO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title>Dog info</title>
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
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
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
        }

        .welcome-text {
            font-size: 18px;
            color: #f9f9f9; /* Adjust the color as desired */
        }

        /* Style your name to be more prominent */
        .user-name {
            font-size: 24px;
            font-style: italic;
            font-weight: bold;
            color: #fff;
        }
        .message {
            font-size: 18px;
            color: #333;
            margin: 0;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 4px;
        }  

        .articles-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .article {
            max-width: 400px;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            margin: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .article h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .date {
            color: #888;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .author {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .read-more-button,
        .update-button,
        .delete-button {
            padding: 8px 12px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: #fff;
        }

        .read-more-button {
            background-color: #4CAF50;
        }

        .update-button {
            background-color: #2196F3;
            margin-right: 5px;
        }

        .delete-button {
            background-color: #F44336;
        }

        .read-more-button:hover,
        .update-button:hover,
        .delete-button:hover {
            opacity: 0.9;
        }
        .add-link {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .add-link:hover {
            background-color: #45a049;
        }
        #pagination {
            margin-top: 10px;
        }

        .page-button {
            padding: 5px 10px;
            margin: 5px;
            cursor: pointer;
            border: none;
            background-color: #000;
            color: white;
            border-radius: 3px;
        }

        .page-button:hover {
            background-color: #45a049;
        }
        footer {
            background-color: #000;
            color: #fff;
            padding: 30px 0;
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
                    <a href="#" class="dropbtn">Pet-related Resources</a>
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
    <body>

        <div class="container">
            <form action="FindResourceController" class="search-form">
                <select name="filterBy">
                    <option value="">All Fields</option>
                    <option value="author_name">Author Name</option>
                    <option value="title">Title</option>
                    <option value="description">Description</option>
                    <option value="content_resources">Content</option>
                </select>
                <input type="text" name="searchKeyword" placeholder="Your Keyword">
                <button type="submit">Apply Filter</button>
            </form>
            <p class="message">${mess}</p>
        </div>

        <div class="articles-container">
            <c:forEach var="resource" items="${baibaoLIST}">
                <div class="article">
                    <h2>${resource.title}</h2>
                    <p class="date">Last update time: ${resource.created_date}</p>
                    <p>${resource.description}</p>
                    <p class="author">Author: <a href="link_to_author_profile">${resource.authorName}</a></p>
                    <form action="MainController" >
                        <input type="hidden" name="category" value="${resource.category}" />
                        <input type="hidden" name="description" value="${resource.description}" />
                        <input type="hidden" name="action" value="GetAll" />
                        <button class="read-more-button" type="submit">Read More</button>
                    </form>
                    <c:if test="${sessionScope.user.user_id eq resource.authorID}">
                        <form action="MainController" >
                            <input type="hidden" name="category" value="${resource.category}" />
                            <input type="hidden" name="description" value="${resource.description}" />
                            <input type="hidden" name="action" value="updateResource" />
                            <button class="update-button" type="submit">Update</button>
                        </form>

                        <form action="MainController" >
                            <input type="hidden" name="category" value="${resource.category}" />
                            <input type="hidden" name="description" value="${resource.description}" />
                            <input type="hidden" name="action" value="deleteResource" />
                            <button class="delete-button" type="submit">Delete</button>
                        </form>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        <a href="AddResources.jsp" class="add-link">Add new writing</a>  
        <div id="pagination"></div>  
    </body>
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
        <p>&copy; 2023 PetCare Management System. All rights reserved.</p>
    </footer>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            var articlesPerPage = 2;
            var $articles = $('.article');
            var totalArticles = $articles.length;
            var totalPages = Math.ceil(totalArticles / articlesPerPage);
            showPage(1);
            for (var i = 1; i <= totalPages; i++) {
                var $pagination = $('<button class="page-button">' + i + '</button>');
                $pagination.data('page', i);
                $pagination.click(function () {
                    var page = $(this).data('page');
                    showPage(page);
                });
                $('#pagination').append($pagination);
            }

            function showPage(page) {
                var start = (page - 1) * articlesPerPage;
                var end = start + articlesPerPage;
                $articles.slideUp(400, function () {
                    // After hiding the current articles, show the selected ones with a slide down effect
                    $articles.hide().slice(start, end).slideDown(400);
                });
            }
        });

    </script>
</html>

