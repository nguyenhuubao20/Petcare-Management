<%-- 
    Document   : service.jsp
    Created on : Jul 5, 2023, 9:41:07 PM
    Author     : sontv
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ServiceProvider.ServiceProviderDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <meta charset="UTF-8">
    <title>Service Booking</title>
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
                <li><a href="MyServices">My Services</a></li>
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
 ${mess}
    <h2>Service Booking</h2>
    <% int count1 = 1;
        List<ServiceProviderDTO> serList1 = (List<ServiceProviderDTO>) request.getAttribute("serList1");
        if (serList1 != null && !serList1.isEmpty()) {
            for (ServiceProviderDTO ser : serList1) {
    %>
    <div class="article">
        <h3>Service No: <%= count1%></h3>
        <p>Service name: <%= ser.getServiceName()%></p>
        <p>Service Type: <%= ser.getServiceType()%></p>
        <p>Service Location: <%= ser.getServiceLocation()%></p>
        <p>Service Description: <%= ser.getDescription()%></p>
        <p>Service Price: <%= ser.getServicePrice()%></p>
        <p>Service Date: <%= ser.getDate()%></p>
        <hr>
        <form action="ServiceBooking" method="POST" onsubmit="return confirmSubmit()">
            <input type="hidden" name="serID" value="<%= ser.getServiceID()%>">   
            <input type="hidden" name="userID" value="${sessionScope.user.user_id}">
            <input type="submit" value="Use this service" name="action" class="read-more-button">
        </form>
    </div>
    <% count1++;
       }
    } else { %>
    <div class="article">
        <h2>There is no Service for you to purchase now!</h2>
        <h3>Sorry for this.</h3>
    </div>
    <% } %>

    <div class="article all-services-container">
        <h2>All Services Available:</h2>
        <% int count2 = 1;
           List<ServiceProviderDTO> serList2 = (List<ServiceProviderDTO>) request.getAttribute("serList2");
           if (serList2 != null && !serList2.isEmpty()) {
               %>
               <table   border = "1">
                   <tr>
                       <th>Serivce No</th>
                       <th>Service Name</th>
                       <th>Service Type</th>
                       <th>Service Location</th>
                       <th>Service Description</th>
                       <th>Service Price</th>
                       <th>Service Date</th>
                   </tr>
                   <% for (ServiceProviderDTO ser : serList2) { %>
                       <tr>
                           <td><%= count2 %></td>
                           <td><%= ser.getServiceName() %></td>
                           <td><%= ser.getServiceType() %></td>
                           <td><%= ser.getServiceLocation() %></td>
                           <td><%= ser.getDescription() %></td>
                           <td><%= ser.getServicePrice() %></td>
                           <td><%= ser.getDate() %></td>
                       </tr>
                       <% count2++;
                          }
                   %>
               </table>
               <% } else { %>
               <h3>No services are currently available.</h3>
               <% } %>
    </div>

    <footer>
        <p>&copy; 2023 PetCare Management System. All rights reserved.</p>
    </footer>

    <script>
        function confirmSubmit() {
            var confirmed = confirm("Are you sure you want to use this service? <br> You will get a call from Service Assistant in 24h");
            return confirmed;
        }
    </script>
</body>
</html>


