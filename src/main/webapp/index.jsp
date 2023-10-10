<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Producto, com.coffeesouls.Models.ProductoDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Coffee Souls </title>
    <link rel="stylesheet" href="Styles/Style-Sidebar.css">
    <link rel="stylesheet" href="Styles/Style-Product.css">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="sidebar close">
    <div class="logo-details">
        <i class='bx bx-coffee-togo'></i>
        <span class="logo_name">CoffeSouls</span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="index.jsp">
                <i class='bx bx-home-alt'></i>
                <span class="link_name">Home</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="index.jsp">Home</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-grid-alt' ></i>
                <span class="link_name">Dashboard</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Dashboard</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-coffee'></i>
                    <span class="link_name">Products</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Products</a></li>
                <li><a href="ManageProducto.jsp">Manage Products</a></li>
                <li><a href="#">Search Products</a></li>
                <li><a href="#">Report for Products</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-collection' ></i>
                    <span class="link_name">Inventory</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Inventory</a></li>
                <li><a href="#">Manage Inventory</a></li>
                <li><a href="#">Search Inventory</a></li>
                <li><a href="#">Report for Inventory</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-cabinet'></i>
                    <span class="link_name">Category</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Category</a></li>
                <li><a href="#">Manage Category</a></li>
                <li><a href="#">Search Category</a></li>
                <li><a href="#">Report for Category</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-dollar-circle'></i>
                    <span class="link_name">Sales</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Sales</a></li>
                <li><a href="#">Manage Sales</a></li>
                <li><a href="#">Search Sales</a></li>
                <li><a href="#">Report for Sales</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-user-pin' ></i>
                    <span class="link_name">Employees</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Employees</a></li>
                <li><a href="#">Manage Employees</a></li>
                <li><a href="#">Search Employees</a></li>
                <li><a href="#">Report for Employees</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-cog' ></i>
                <span class="link_name">Setting</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Setting</a></li>
            </ul>
        </li>
        <li>
            <div class="profile-details">
                <div class="profile-content">
                    <img src="Assets/Coffe-Icon.png" alt="profileImg">
                </div>
                <div class="name-job">
                    <div class="profile_name">Coffe User</div>
                    <div class="job">Administration</div>
                </div>
                <div class="logout">
                    <a href="Login.jsp">
                        <i class='bx bx-log-out' ></i>
                    </a>
                </div>
            </div>
        </li>
    </ul>
</div>
<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu' ></i>
        <span class="text">Home</span>
    </div>
</section>
<script src="Scripts/Sidebar.js"></script>
</body>
</html>
