<%-- 
    Document   : CRUDresource
    Created on : Jul 17, 2023, 9:28:08 PM
    Author     : ADMIN-PC
--%>
<%@page import="Resources.ResourcesDTO"%>
<%@page import="Resources.ResourcesDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resources</title>
        <style>
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #333;
                min-width: 160px;
                padding: 10px;
                z-index: 1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .my-btn {
                background-color: #333;
                color: #fff;
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
            .avatar {
                display: flex;
                align-items: center;
            }

            .avatar img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .avatar .username {
                color: #333;
                font-weight: bold;
            }

            nav {
                background-color: #000;
                color: #fff;
                padding: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
            }

            nav li {
                display: inline-block;
            }

            nav a {
                display: block;
                color: #fff;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            nav a:hover {
                background-color: #333;
            }

            /* CSS cho thanh search */
            .search-bar {
                background-color: #000;
                color: #fff;
                padding: 10px;
                display: flex;
                justify-content: flex-end;
                align-items: center;
            }

            .search-bar input[type="text"] {
                padding: 6px;
                border-radius: 4px;
            }

            .search-bar button {
                padding: 6px 12px;
                border-radius: 4px;
                background-color: #333;
                color: #fff;
                border: none;
                margin-left: 10px;
                cursor: pointer;
            }

            .search-bar button:hover {
                background-color: #555;
            }

            .article {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .article h2 {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .article p {
                margin-bottom: 10px;
            }

            .article .author {
                font-style: italic;
            }

            .article .date {
                color: #999;
            }
            .read-more-button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
            }

            .read-more-button:hover {
                background-color: #0056b3;
            }

            #pagination {
                text-align: center;
                margin-top: 20px;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            .content {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            h2 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            form {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"],
            textarea {
                width: 90%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-bottom: 10px;
            }

            input[type="submit"] {
                background-color: #333;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #555;
            }
            .content {
                max-width: 600px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .page-button {
                display: inline-block;
                margin: 5px;
                padding: 8px 12px;
                background-color: #eaeaea;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                color: #333;
                font-weight: bold;
                text-decoration: none;
            }

            .page-button:hover {
                background-color: #ccc;
            }

            .page-button.active {
                background-color: #333;
                color: #fff;
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

            .blur-background {
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center center;
                backdrop-filter: blur(5px);
            }
        </style>

    </head>
    <body>
        <nav>
            <div class="logo">
                <img src="https://monspet.com/wp-content/uploads/2023/06/cropped-2-1-300x82.png" class="pet-logo">
            </div>
            <ul>
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
                <li><a href="ServiceBookingo">Services</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
            <div class="avatar">
                <img src="path/to/avatar.jpg" alt="User Avatar">
                   <p>Welcome ${sessionScope.user.name}</p> 
            </div>

            <div class="search-bar">
                <input type="text" placeholder="Search">
                <button type="submit">Search</button>
            </div>
        </nav>
        <div class="add-article-form">
            <h2>Add a New Article</h2>
            <form action="MainController">

                <label for="title">Title:</label>
                <input type="text" id="title" name="title" required>

                <label for="description">Description:</label>
                <input type="text" id="description" name="description" placeholder="Main keyword of your article (Ex:DogCare)" required><br><br>

                <label for="content">Content:</label>
                <textarea id="content" name="content" required></textarea>

                <label for="category">Category:</label>
                <select id="category" name="category" required>
                    <option value="Dog">Dog</option>
                    <option value="Cat">Cat</option>
                    <option value="Other Animals">Other Animals</option>
                </select><br><br>
                <input type="hidden" id="author_name" name="author_name" value="${sessionScope.user.name}"required><br><br>
                <input type="hidden" id="author_id" name="author_id" value="${sessionScope.user.user_id}"required><br><br>
                <label for="image_link">Image Link:</label> 
                <input type="text" id="image_link" name="image_link" required><br><br>
                <button type="submit" value="addResource" name="action">Add Article</button>
            </form>
        </div>
                <p>${message}</p>
        <form action="login" name="form-login" method="POST">
            <input name="action" value="logout" type="submit">
        </form>

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
    </body>
</html>
