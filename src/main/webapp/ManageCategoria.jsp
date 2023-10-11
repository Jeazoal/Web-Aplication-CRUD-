<%--
  Created by IntelliJ IDEA.
  User: Jeazoal
  Date: 11/10/2023
  Time: 06:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Categoria, com.coffeesouls.Models.CategoriaDAO" %>
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

    <h1 class="titulo-two">Category List</h1>

    <div class="section-table">
        <div class="table">
            <table id="categoriaTable">
                <thead>
                <tr>
                    <th colspan="5" class="top-table">
                        <form class="form-search" action="categoria?action=buscar" method="post">
                            <div class="content-selector">
                                <label class="selector-option" for="criterio_busqueda">Filter Search:</label>
                                <select class="selector" name="tipo_busqueda" required>
                                    <option value="nom_categoria">
                                        Name
                                    </option>
                                    <option value="id_categoria">By ID</option>
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
                    <th>Name</th>
                    <th>Status</th>
                    <th>Accion De Editar</th>
                    <th>Accion De Eliminar</th>
                </tr>
                </thead>
                <tbody>
                <%
                    CategoriaDAO categoriaDAO = new CategoriaDAO();
                    List<Categoria> categorias = categoriaDAO.obtenerCategorias();

                    int currentPage = 1;
                    int categoriesPerPage = 6;
                    int totalCategories = categorias.size();
                    int totalCategoryPages = (int) Math.ceil((double) totalCategories / categoriesPerPage);

                    if (request.getParameter("page") != null) {
                        currentPage = Integer.parseInt(request.getParameter("page"));
                    }

                    int startIndex = (currentPage - 1) * categoriesPerPage;
                    int endIndex = Math.min(startIndex + categoriesPerPage, totalCategories);

                    List<Categoria> categoriasPagina = categorias.subList(startIndex, endIndex);

                    for (Categoria categoria : categoriasPagina) {
                %>
                <tr>
                    <td><%= categoria.getId_categoria() %></td>
                    <td><%= categoria.getNom_categoria() %></td>
                    <td><%= categoria.getEstado() %></td>
                    <td>
                        <form method="post" action="EditCategory.jsp">
                            <input type="hidden" name="id_categoria" value="<%= categoria.getId_categoria() %>">
                            <input class="edit-button" type="submit" value="Edit">
                        </form>
                    </td>
                    <td>
                        <form method="post" action="categoria?action=eliminar">
                            <input type="hidden" name="id_categoria" value="<%= categoria.getId_categoria() %>">
                            <input class="delete-button" type="submit" value="Eliminar">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td class="bottom-table-i" colspan="5">
                        <div class="pagination">
                            <ul>
                                <%
                                    if (currentPage > 1) {
                                %>
                                <li><a href="?page=<%= currentPage - 1 %>">Previous</a></li>
                                <%
                                    }

                                    for (int i = 1; i <= totalCategoryPages; i++) {
                                %>
                                <li <%= (i == currentPage) ? "class='active'" : "" %><a href="?page=<%= i %>"><%= i %></a></li>
                                <%
                                    }

                                    if (currentPage < totalCategoryPages) {
                                %>
                                <li><a href="?page=<%= currentPage + 1 %>">Next</a></li>
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
<script src="JS/Sidebar.js"></script>
</body>

