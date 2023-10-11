<%--
  Created by IntelliJ IDEA.
  User: Jeazoal
  Date: 11/10/2023
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%-- Created by IntelliJ IDEA. User: Jeazoal Date: 10/10/2023 Time: 02:24 To change this template use File | Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Inventario, com.coffeesouls.Models.InventarioDAO" %>
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
                <i class='bx bx-grid-alt'></i>
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
                <i class='bx bxs-chevron-down arrow'></i>
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
                    <i class='bx bx-collection'></i>
                    <span class="link_name">Inventory</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
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
                    <i class='bx bx-cabinet'></i>
                    <span class="link_name">Category</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Category</a></li>
                <li><a href="ManageCategoria.jsp">Manage Category</a></li>
                <li><a href="#">Report for Category</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-dollar-circle'></i>
                    <span class="link_name">Sales</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
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
                    <i class='bx bx-user-pin'></i>
                    <span class="link_name">Employees</span>
                </a>
                <i class='bx bxs-chevron-down arrow'></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Employees</a></li>
                <li><a href="ManageTrabajador.jsp">Manage Employees</a></li>
                <li><a href="#">Report for Employees</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-cog'></i>
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
                        <i class='bx bx-log-out'></i>
                    </a>
                </div>
            </div>
        </li>
    </ul>
</div>
<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu'></i>
        <span class="text">Manage Categories</span>
    </div>
    <div class="create">
        <h1>Create</h1>
        <form method="post" action="categoria?action=agregar">
            <div class="values">
                <label for="nom_categoria">Nombre de la Categoría:</label>
                <input class="input_create" type="text" id="nom_categoria" name="nom_categoria" required placeholder="Enter Category Name..."><br>

                <label for="estado">Nombre de Estado:</label>
                <input class="input_create" type="text" id="estado" name="estado" required placeholder="Enter Category Name..."><br>
            </div>
            <div class="execute">
                <input class="BotonAgregar" type="submit" value="Add Category">
            </div>
        </form>
    </div>

    <h1 class="titulo-two">Lista de Productos en Inventario</h1>
    <div class="section-table">
        <div class="table">
            <table id="">
                <thead>
                <tr>
                    <th colspan="8" class="top-table">
                        <form class="form-search" action="inventario?action=buscar" method="post">
                            <div class="content-selector">
                                <label class="selector-option" for="criterio_busqueda">Filter Search:</label>
                                <select class="selector" name="tipo_busqueda" required>
                                    <option value="cod_invent">
                                        Por Código
                                    </option>
                                    <option value="nom_invent">Por Nombre</option>
                                    <option value="proveedor">Por Proveedor</option>
                                </select>
                            </div>
                            <div class="content-label">
                                <input type="hidden" name="action" value="buscar">
                                <label class="search-title" for="criterio_busqueda">Search:</label>
                                <input class="input_search" type="text" id="criterio_busqueda" name="criterio_busqueda" placeholder="Buscar ..." required>
                                <i class='bx bx-search-alt-2'></i>
                            </div>
                        </form>
                    </th>
                </tr>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Proveedor</th>
                    <th>Acción De Editar</th>
                    <th>Acción De Eliminar</th>
                </tr>
                </thead>
                <tbody>
                <%
                    InventarioDAO inventarioDAO = new InventarioDAO();
                    List<Inventario> inventario = inventarioDAO.obtenerInventario();

                    int currentPage = 1;
                    int inventarioPerPage = 6;
                    int totalInventario = inventario.size();
                    int totalPages = (int) Math.ceil((double) totalInventario / inventarioPerPage);

                    if (request.getParameter("page") != null) {
                        currentPage = Integer.parseInt(request.getParameter("page"));
                    }

                    int startIndex = (currentPage - 1) * inventarioPerPage;
                    int endIndex = Math.min(startIndex + inventarioPerPage, totalInventario);

                    List<Inventario> inventarioPagina = inventario.subList(startIndex, endIndex);

                    for (Inventario item : inventarioPagina) {
                %>
                <tr>
                    <td><%= item.getCod_invet() %></td>
                    <td><%= item.getNom_invent() %></td>
                    <td><%= item.getTipo() %></td>
                    <td><%= item.getProveedor() %></td>
                    <td>
                        <form method="post" action="EditInventory.jsp">
                            <input type="hidden" name="cod_invent" value="<%= item.getCod_invet() %>">
                            <input class="edit-button" type="submit" value="Editar">
                        </form>
                    </td>
                    <td>
                        <form method="post" action="inventario?action=eliminar">
                            <input type="hidden" name="cod_invet" value="<%= item.getCod_invet() %>">
                            <input class="delete-button" type="submit" value="Eliminar">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td class="bottom-table-i" colspan="6">
                        <div class="pagination">
                            <ul>
                                <%
                                    if (currentPage > 1) {
                                %>
                                <li><a href="?page=<%= currentPage - 1 %>">Anterior</a></li>
                                <%
                                    }

                                    for (int i = 1; i <= totalPages; i++) {
                                %>
                                <li <%= (i == currentPage) ? "class='active'" : "" %>><a href="?page=<%= i %>"><%= i %></a></li>
                                <%
                                    }

                                    if (currentPage < totalPages) {
                                %>
                                <li><a href="?page=<%= currentPage + 1 %>">Siguiente</a></li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<script src="JS/Sidebar.js"> </script>
</body>
</html>
