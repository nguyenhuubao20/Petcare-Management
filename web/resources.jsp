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

            /* Phần tử div chứa một tài nguyên */
            .resource {
                padding: 10px;
                border: 1px solid gray;
                border-radius: 5px;
                margin-bottom: 20px;
            }

            /* Tiêu đề của tài nguyên */
            .resource .title {
                font-size: 24px;
                font-weight: bold;
            }

            /* Phần mô tả của tài nguyên */
            .resource .description {
                margin-top: 10px;
                font-weight: bold;
            }

            /* Phần nội dung của tài nguyên */
            .resource .content {
                margin-top: 10px;
                text-align: justify;
                line-height: 1.5;
            }

            /* Phần ảnh đại diện của tài nguyên */
            .resource .image img {
                display: block;
                max-width: 100%;
                height: auto;
                margin-top: 10px;
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
                        <form action="DogPageController" style="display: flex; align-items: center; justify-content: center;">
                            <input type="hidden" name="keyword" value="Rickettsia" />
                            <button class="my-btn">Dog</button>
                            <br></br>
                        </form>
                        <form action="ListSourceController" style="display: flex; align-items: center; justify-content: center;">
                            <input type="hidden" name="keyword" value="Rickettsia" />
                            <button class="my-btn" type="submit" name="action" value="ListSourceController">Cat</button>
                            <br></br>
                        </form>
                        <form action="ListSourceController" style="display: flex; align-items: center; justify-content: center;">
                            <input type="hidden" name="keyword" value="Rickettsia" />
                            <button class="my-btn" type="submit" name="action" value="ListSourceController">Other Animals</button>
                            <br></br>
                        </form>
                    </div>
                </li>
                <li><a href="ServiceBookingo">Services</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
            <div class="avatar">
                <img src="path/to/avatar.jpg" alt="User Avatar">
                <p>Welcome ${sessionScope.usersession.name}</p> 
            </div>

            <div class="search-bar">
                <input type="text" placeholder="Search">
                <button type="submit">Search</button>
            </div>
        </nav>

        <div class="resource">
            <h1 class="title 1">Chuyên mục: Chó</h1>
            <%
                List<ResourcesDTO> list = (List<ResourcesDTO>) request.getAttribute("LIST");

                if (list != null && !list.isEmpty()) {
                    for (ResourcesDTO dogResource : list) {
            %>
            <p class="author">Tác giả: <a href="link_tac_gia"><%= dogResource.getAuthorName()%></a></p>

            <br>
            <p class="date">Ngày đăng: <%= dogResource.getCreated_date()%></p>
            <br>
            <%
                        break;
                    }
                }
            %>


            <%
                if (list != null && !list.isEmpty()) {
                    for (ResourcesDTO dogResource : list) {
            %>
            <p class="title"><%= dogResource.getTitle()%></p>
            <p class="image">
                <% String imageLink = dogResource.getLink_img();
        if (imageLink != null && !imageLink.isEmpty()) {%>
                <img src="<%= imageLink%>" alt="Hình ảnh">
                <% }%>
            </p>
            <p class="content"><%= dogResource.getContent()%></p>
            <br>
            <%
                    }
                }
            %>
        </div>


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
