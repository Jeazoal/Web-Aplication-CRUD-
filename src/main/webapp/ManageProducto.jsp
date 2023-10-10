<%--
  Created by IntelliJ IDEA.
  User: Jeazoal
  Date: 9/10/2023
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
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
        <span class="text">Manage Products</span>
    </div>
    <div class="create">
        <h1>Crear</h1>
        <form method="post" action="producto?action=agregar">
            <div class="values">
                <label for="nombre">Nombre del Producto:</label>
                <input class="input_create" type="text" id="nombre" name="nombre" required placeholder="Ingrese Nombre Del Producto..."><br>

                <label for="precio">Precio:</label>
                <input class="input_create" type="text" id="precio" name="precio" required placeholder="Ingrese Precio Del Producto..."><br>
            </div>
            <div class="execute">
                <input class="BotonAgregar" type="submit" value="Agregar Producto" >
            </div>
        </form>
    </div>

    <h1 class="titulo-two">Lista de Productos</h1>

    <div class="top-table">
        <form class="form-search" action="producto?action=buscar" method="post">
            <div class="content-selector">
                <label class="selector-option" for="criterio_busqueda">Filter Search:</label>
                <select class="selector" name="tipo_busqueda" required>
                    <option value="nombre">
                        Nombre
                    </option>
                    <option value="id">Por ID</option>
                </select>
            </div>
            <div class="content-label">
                <input type="hidden" name="action" value="buscar">
                <label class="search-title" for="criterio_busqueda">Search:</label>
                <input class="input_search" type="text" id="criterio_busqueda" name="criterio_busqueda" placeholder="Search ..." required>
                <i class='bx bx-search-alt-2'></i>
            </div>
        </form>
    </div>
    <form method="post" action="producto?action=eliminarSeleccionados">
        <div class="section-table">
            <div class="table">
                <table id="productTable">
                    <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Accion De Editar</th>
                        <th>Accion De Eliminar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ProductoDAO productoDAO = new ProductoDAO();
                        List<Producto> productos = productoDAO.obtenerProductos();

                        for (Producto producto : productos) {
                    %>
                    <tr>
                        <td class="check-td">
                            <label class="checkbox-container">
                                <input type="checkbox" name="productosSeleccionados" value="<%= producto.getId() %>">
                                <span class="checkmark"></span>
                            </label>
                        </td>
                        <td><%= producto.getId() %></td>
                        <td><%= producto.getNombre() %></td>
                        <td><%= producto.getPrecio() %></td>
                        <td>
                            <form method="post" action="EditProduct.jsp">
                                <input type="hidden" name="id" value="<%= producto.getId() %>">
                                <input class="edit-button" type="submit" value="Editar">
                            </form>
                        </td>
                        <td>
                            <form method="post" action="producto?action=eliminar">
                                <input type="hidden" name="id" value="<%= producto.getId() %>">
                                <input class="delete-button" type="submit" value="Eliminar">
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td class="bottom-table-i">
                            <button class="Eliminaciones" type="submit"><i class='bx bx-trash'></i></button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td  class="bottom-table-r"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</section>
<script src="Scripts/Sidebar.js"> </script>
</body>
</html>