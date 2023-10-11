<%--
  Created by IntelliJ IDEA.
  User: Jeazoal
  Date: 11/10/2023
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Venta, com.coffeesouls.Models.VentaDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Coffee Souls</title>
    <link rel="stylesheet" href="CSS/Style-Sidebar.css">
    <link rel="stylesheet" href="CSS/Style-Form.css">
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
            <a href="Dashboard.jsp">
                <i class='bx bx-grid-alt' ></i>
                <span class="link_name">Dashboard</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="Dashboard.jsp">Dashboard</a></li>
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
                <li><a href="#">Report for Inventory</a></li>
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
        <li><a href="ManageTrabajador.jsp">Manage Employees</a></li>
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
            <div class="profile_name">Coffee User</div>
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
        <span class="text">Manage Sales</span>
    </div>
    <div class="create">
        <h1>Create</h1>
        <form method="post" action="venta?action=agregar">
            <div class="values">
                <label for="fecha_venta">Fecha de Venta:</label>
                <input class="input_create" type="date" id="fecha_venta" name="fecha_venta" required><br>
                <label for="monto">Monto:</label>
                <input class="input_create" type="text" id="monto" name="monto" required placeholder="Enter Amount..."><br>
                <label for="descripcion">Descripción:</label>
                <input class="input_create" type="text" id="descripcion" name="descripcion" required placeholder="Enter Description..."><br>
                <label for="nom_cliente">Nombre del Cliente:</label>
                <input class="input_create" type="text" id="nom_cliente" name="nom_cliente" required placeholder="Enter Customer Name..."><br>
            </div>
            <div class="execute">
                <input class="BotonAgregar" type="submit" value="Add Sale">
            </div>
        </form>
    </div>
    <h1 class="titulo-two">Sale List</h1>
    <div class="section-table">
        <table id="ventasTable">
            <thead>
            <tr>
                <th colspan="7" class="top-table">
                    <form class="form-search" action="venta?action=buscar" method="post">
                        <div class="content-selector">
                            <label class="selector-option" for="criterio_busqueda">Filter Search:</label>
                            <select class="selector" name="tipo_busqueda" required>
                                <option value="id_venta">
                                    By ID
                                </option>
                                <option value="fecha_venta">
                                    By Date
                                </option>
                                <option value="nom_cliente">
                                    By Customer Name
                                </option>
                            </select>
                        </div>
                        <div class="content-label">
                            <input type="hidden" name="action" value="buscar">
                            <label class="search-title" for="criterio_busqueda">Search:</label>
                            <input class="input_search" type="text" id="criterio_busqueda" name="criterio_busqueda" placeholder="Search..." required>
                            <i class='bx bx-search-alt-2'></i>
                        </div>
                    </form>
                </th>
            </tr>
            <tr>
                <th>ID</th>
                <th>Fecha de Venta</th>
                <th>Monto</th>
                <th>Descripción</th>
                <th>Nombre Cliente</th>
                <th>Accion De Editar</th>
                <th>Accion De Eliminar</th>
            </tr>
            </thead>
            <tbody>
            <%
                VentaDAO ventaDAO = new VentaDAO();
                List<Venta> ventas = ventaDAO.obtenerVentas();

                for (Venta venta : ventas) {
            %>
            <tr>
                <td><%= venta.getIdVenta() %></td>
                <td><%= venta.getFechaVenta() %></td>
                <td><%= venta.getMonto() %></td>
                <td><%= venta.getDescripcion() %></td>
                <td><%= venta.getNomCliente() %></td>
                <td>
                    <form method="post" action="EditVenta.jsp">
                        <input type="hidden" name="id_venta" value="<%= venta.getIdVenta() %>">
                        <input class="edit-button" type="submit" value="Edit">
                    </form>
                </td>
                <td>
                    <form method="post" action="venta?action=eliminar">
                        <input type="hidden" name="id_venta" value="<%= venta.getIdVenta() %>">
                        <input class="delete-button" type="submit" value="Eliminar">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</section>
<script src="JS/Sidebar.js"></script>
</body>
</html>
