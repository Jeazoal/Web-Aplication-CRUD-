<%--
  Created by IntelliJ IDEA.
  User: Jeazoal
  Date: 10/10/2023
  Time: 02:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Trabajador, com.coffeesouls.Models.TrabajadorDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Coffee Souls </title>
    <link rel="stylesheet" href="Styles/Style-Form.css">
    <link rel="stylesheet" href="Styles/Style-Sidebar.css">
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
                    <i class='bx bx-cabinet'></i>
                    <span class="link_name">Category</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Category</a></li>
                <li><a href="#">Manage Category</a></li>
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
        <span class="text">Manage Employees</span>
    </div>
    <div class="create">
        <h1>Crear</h1>
        <form method="post" action="trabajador?action=agregar">
            <div class="values">
                <label for="nomEmp">Nombre del Trabajador:</label>
                <input class="input_create" type="text" id="nomEmp" name="nomEmp" required placeholder="Ingrese Nombre del Trabajador..."><br>

                <label for="apeEmp">Apellido del Trabajador:</label>
                <input class="input_create" type="text" id="apeEmp" name="apeEmp" required placeholder="Ingrese Apellido del Trabajador..."><br>

                <label for="edadEmp">Edad del Trabajador:</label>
                <input class="input_create" type="text" id="edadEmp" name="edadEmp" required placeholder="Ingrese Edad del Trabajador..."><br>

                <label for="dniEmp">DNI del Trabajador:</label>
                <input class="input_create" type="text" id="dniEmp" name="dniEmp" required placeholder="Ingrese DNI del Trabajador..."><br>

                <label for="email">Email del Trabajador:</label>
                <input class="input_create" type="text" id="email" name="email" required placeholder="Ingrese Email del Trabajador..."><br>
            </div>
            <div class="execute">
                <input class="BotonAgregar" type="submit" value="Agregar Trabajador">
            </div>
        </form>
    </div>

    <h1 class="titulo-two">Lista de Trabajadores</h1>
        <div class="section-table">
            <div class="table">
                <table id="">
                    <thead>
                        <tr>
                            <th colspan="8" class="top-table">
                                <form class="form-search" action="trabajador?action=buscar" method="post">
                                    <div class="content-selector">
                                        <label class="selector-option" for="criterio_busqueda">Filter Search:</label>
                                        <select class="selector" name="tipo_busqueda" required>
                                            <option value="id_emp">
                                                Por ID
                                            </option>
                                            <option value="nom_emp">Por Nombre</option>
                                            <option value="ape_emp">Por Apellido</option>
                                            <option value="dni_emp">Por DNI</option>
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
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Edad</th>
                        <th>DNI</th>
                        <th>Email</th>
                        <th>Acción De Editar</th>
                        <th>Acción De Eliminar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
                        List<Trabajador> trabajadores = trabajadorDAO.obtenerTrabajadores();

                        int currentPage = 1;
                        int trabajadorPerPage = 6;
                        int totalTrabajadores = trabajadores.size();
                        int totalPages = (int) Math.ceil((double) totalTrabajadores / trabajadorPerPage);

                        if (request.getParameter("page") != null) {
                            currentPage = Integer.parseInt(request.getParameter("page"));
                        }

                        int startIndex = (currentPage - 1) * trabajadorPerPage;
                        int endIndex = Math.min(startIndex + trabajadorPerPage, totalTrabajadores);

                        List<Trabajador> trabajadorPagina = trabajadores.subList(startIndex, endIndex);

                        for (Trabajador trabajador : trabajadorPagina) {
                    %>
                    <tr>
                        <td><%= trabajador.getIdEmp() %></td>
                        <td><%= trabajador.getNomEmp() %></td>
                        <td><%= trabajador.getApeEmp() %></td>
                        <td><%= trabajador.getEdadEmp() %></td>
                        <td><%= trabajador.getDniEmp() %></td>
                        <td><%= trabajador.getEmail() %></td>
                        <td>
                            <form method="post" action="EditTrabajador.jsp">
                                <input type="hidden" name="idEmp" value="<%= trabajador.getIdEmp() %>">
                                <input class="edit-button" type="submit" value="Editar">
                            </form>
                        </td>
                        <td>
                            <form method="post" action="trabajador?action=eliminar">
                                <input type="hidden" name="idEmp" value="<%= trabajador.getIdEmp() %>">
                                <input class="delete-button" type="submit" value="Eliminar">
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td class="bottom-table-i" colspan="8">
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
<script src="Scripts/Sidebar.js"> </script>
</body>
</html>
