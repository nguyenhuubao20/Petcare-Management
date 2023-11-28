<%-- 
    Document   : admin
    Created on : Jul 20, 2023, 7:25:58 PM
    Author     : ADMIN-PC
--%>

<%@page import="ServiceProvider.PurchasedServiceWithDetailsDTO"%>
<%@page import="Contact.ContactDTO"%>
<%@page import="Contact.ContactDAO"%>
<%@page import="ServiceProvider.ServiceProviderDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <title>Admin</title>
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

        
         body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
        }

        /* Styling for the directories */
        .directory {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
        }

        .directory h2 {
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 5px;
        }

        .directory form {
            margin-bottom: 10px;
        }

        .directory input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        .directory input[type="submit"]:hover {
            background-color: #45a049;
        }

        .directory ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .directory li {
            padding: 10px;
            border-bottom: 1px solid #ccc;
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



             <div class="directory">
        <h2>User Directory</h2>
        
         <form action="AdminController" method="GET">            
        <input type="hidden" name="action" value="getalluser">
        <input type="submit" value="Get all user">
    </form>  
        <form action="AdminController">
                <select name="filterBy">
                    <option value="">All Fields</option>
                    <option value="name">Name</option>
                    <option value="email">Email</option>
                    <option value="address">Address</option>
                    <option value="phonenumber">Phonenumber</option>
                </select>
                <input type="text" name="searchKeyword" placeholder="Your Keyword">
                <input type="hidden" name="action" value="searchUser">
                <button type="submit">Apply Filter</button>
            </form>
    <div>
        <c:if test="${not empty requestScope.listUsersDTO}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Number no</th>
                        <th>User ID</th>
                        <th>USer Name</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <c:forEach var="u" items="${requestScope.listUsersDTO}" varStatus="count">
                    <tbody>
                        <tr>
                            <td>${count.index +1}</td>
                            <td>${u.user_id}</td>
                            <td>${u.name}</td>
                            <td>${u.email}</td>
                            <td>${u.address}</td>
                            <td>${u.phonenumber}</td>
                            <td>
                                <form action="AdminController">
                                    <input type="hidden" name="user_id" value="${u.user_id}">
                                    <input type="hidden" name="action" value="deleteuser">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>
                            <td>
                                <form action="adminedituser.jsp">
                                    <input type="hidden" name="user_id" value="${u.user_id}">
                                    <input type="hidden" name="name" value="${u.name}">
                                    <input type="hidden" name="email" value="${u.email}">
                                    <input type="hidden" name="password" value="${u.password}">
                                    <input type="hidden" name="phonenumber" value="${u.phonenumber}">
                                    <input type="hidden" name="action" value="updateuser">
                                    <input type="submit" value="Update">
                                </form>
                            </td>
                            
                        </tr>
                    </tbody>
                     </c:forEach>
                </table>
           
        </c:if>
    </div>
    
        
        <h2>Pet Directory</h2>
    <form action="AdminController" method="GET">            
        <input type="hidden" name="action" value="getallpet">
        <input type="submit" value="Get all pet">
    </form>  
    
     <div>
        <c:if test="${not empty requestScope.listPetsDTO}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Number no</th>
                        <th>Pet ID</th>
                        <th>User ID</th>
                        <th>Pet Name</th>
                        <th>Pet Age</th>
                        <th>Allergy</th>
                        <th>Profile Picture</th>
                       
                    </tr>
                </thead>
                <c:forEach var="p" items="${requestScope.listPetsDTO}" varStatus="count">
                    <tbody>
                        <tr>
                            <td>${count.index +1}</td>
                            <td>${p.petId}</td>
                            <td>${p.userId}</td>
                            <td>${p.petName}</td>
                            <td>${p.petAge}</td>
                            <td>${p.allergy}</td>
                            <td>${p.profilePicture}</td>                           
                        </tr>
                    </tbody>
                     </c:forEach>
                </table>
           
        </c:if>
    </div>
 
 
        <h2>Resource Directory</h2>
        <form action="AdminController">            
            <input type="hidden" name="action" value="getallresource">
            <input type="submit" value="Get all resource">
        </form>
        <form action="AdminController">
                <select name="filterBy">
                    <option value="">All Fields</option>
                    <option value="author_name">Author Name</option>
                    <option value="title">Title</option>
                    <option value="description">Description</option>
                    <option value="content_resources">Content</option>
                    <option value="category">Category</option>
                </select>
                <input type="text" name="searchKeyword" placeholder="Your Keyword">
                <input type="hidden" name="action" value="search">
                <button type="submit">Apply Filter</button>
            </form>
        <div>
            <c:if test="${not empty requestScope.list}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Number</th>
                            <th>Resource ID</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Content</th>
                            <th>Category</th>
                            <th>Author ID</th>
                            <th>Author Name</th>
                            <th>Created Date</th>
                            <th>Image Link</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <c:forEach var="r" items="${requestScope.list}" varStatus="count">
                        <tbody>
                            <tr>
                                <td>${count.index +1}</td>
                                <td>${r.re_id}</td>
                                <td>${r.title}</td>
                                <td>${r.description}</td>
                                <td>${r.content}</td>
                                <td>${r.category}</td>          
                                <td>${r.authorID}</td>
                                <td>${r.authorName}</td>
                                <td>${r.created_date}</td>
                                <td>${r.link_img}</td>
                                <td>
                                    <form action="AdminResourceController" >
                                        <input type="submit" value="Remove" name="action">
                                        <input type="hidden" name="re_id" value="${r.re_id}">
                                    </form>
                                <td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>

            </c:if>
        </div>
    
    

  
    <h2>Service Directory</h2>
    
    <form action="AdminController" method="GET">            
        <input type="hidden" name="action" value="getallservice">
        <input type="submit" value="Get all service">
    </form>  
     <table border="1">
           <% 
        int count1 = 1;
        List<ServiceProviderDTO> serList1 = (List<ServiceProviderDTO>) request.getAttribute("serList1");
        if (serList1 != null && !serList1.isEmpty()) {
            for (ServiceProviderDTO ser : serList1) {
        %>
    <thead>
        <tr>
            <th>Service No</th>
            <th>Service Name</th>
            <th>Service Type</th>
            <th>Service Location</th>
            <th>Service Description</th>
            <th>Service Price</th>
            <th>Service Date</th>
            <th>Action</th>
             <th>Action</th>
        </tr>
    </thead>
    <tbody>
      
        <tr>
            <td><%= count1 %></td>
            <td><%= ser.getServiceName() %></td>
            <td><%= ser.getServiceType() %></td>
            <td><%= ser.getServiceLocation() %></td>
            <td><%= ser.getDescription() %></td>
            <td><%= ser.getServicePrice() %></td>
            <td><%= ser.getDate() %></td>
            <td>
                <form action="AdminController" onsubmit="return confirmSubmit()">
                    <input type="hidden" name="ser_id" value="<%= ser.getServiceID() %>">
                       <input type="hidden" name="action" value="deleteservice">
                    <input  type="submit" value="Delete"  class="read-more-button">
                </form>
            </td>
             
        </tr>
        <% 
            count1++;
            }
        }
        %>
    </tbody>
      <tr>  <form action="AdminController"  onsubmit="return confirmSubmit()">
                 <input type="hidden" name="action" value="insertservice">       
                    <input type="submit" value="Insert" class="read-more-button">
                </form></tr>
</table>

     <h2>Contact Directory</h2>
       <form action="AdminController" method="GET">            
        <input type="hidden" name="action" value="getallcontact">
        <input type="submit" value="Get all contact">
    </form>  
        <% 
       
        
        List<ContactDTO> contactList = (List<ContactDTO>) request.getAttribute("conList");
        if (contactList != null && !contactList.isEmpty()) {
            for (ContactDTO contact : contactList) {
        %>
    <table border="1">
        <tr>
            <th>Contact ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
            <th>Action</th>
        </tr>

        <tr>
            <td><%= contact.getLineAdd() %></td>
            <td><%= contact.getContactName() %></td>
            <td><%= contact.getContactMail() %></td>
            <td><%= contact.getContactMessage() %></td>
            
            <td>
                <form action="AdminController" onsubmit="return confirmSubmit()">
                    <input type="hidden" name="contact_id" value="<%= contact.getLineAdd() %>">
                       <input type="hidden" name="action" value="deletecontact">
                    <input  type="submit" value="Delete"  class="read-more-button">
                </form>
            </td>
        </tr>
        <% 
            }
        }
        %>
    </table>
    
    <h2>User Service Directory</h2>
    <form action="AdminController" method="GET">            
        <input type="hidden" name="action" value="getallpur">
        <input type="submit" value="Get all purchased service">
    </form>  
        <% 
       
        
        List<PurchasedServiceWithDetailsDTO> purList = (List<PurchasedServiceWithDetailsDTO>) request.getAttribute("purList");
        if (purList != null && !purList.isEmpty()) {
            for (PurchasedServiceWithDetailsDTO pur : purList) {
        %>
     <table border="1">
        <tr>
            <th>Purchased ID</th>
            <th>User ID</th>
            <th>Service Name</th>
            <th>User Name</th>
            <th>Purchase Date</th>
            <th>Status</th>
        </tr>

         <tr>
                <td><%= pur.getProviderId() %></td>
                <td><%= pur.getUserId() %></td>
                <td><%= pur. getServiceName() %></td>
                <td><%= pur.getUsername() %></td>
                <td><%= pur.getPurchaseDate() %></td>
               <td><%= pur.isStatus() %></td>
                <td>
                    <form action="AdminController" >
                        <input type="hidden" name="seruser" value="<%= pur.getUserId() %>">
                        <input type="hidden" name="serid" value="<%= pur.getProviderId() %>">
                          <input type="hidden" name="action" value="deletepur">
                        <input type="submit" value="Don't allow user to use more">
                    </form>
                </td>
            </tr>
        <% 
            }
        }
        %>
    </table>
     
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
   <script>
        function confirmSubmit() {
            var confirmed = confirm("Are you sure you want to do this?");
            return confirmed;
        }
    </script>                 
</html>