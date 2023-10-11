<%--
  Created by IntelliJ IDEA.
  User: Jeazoal
  Date: 11/10/2023
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Inventario, com.coffeesouls.Models.InventarioDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Coffee Souls </title>
    <link rel="stylesheet" href="CSS/Style-Sidebar.css">
    <link rel="stylesheet" href="CSS/Style-Form.css">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="sidebar close">
    <!-- Código de la barra lateral (sidebar) similar al anterior -->
</div>
<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu' ></i>
        <span class="text">RESULTS</span>
    </div>
    <div class="section-table">
        <table>
            <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Cantidad</th>
                <th>Proveedor</th>
                <th>Acción De Editar</th>
                <th>Acción De Eliminar</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Inventario> inventarioEncontrado = (List<Inventario>) request.getAttribute("inventarioEncontrado");
                for (Inventario item : inventarioEncontrado) {
            %>
            <tr>
                <td><%= item.getCod_invet() %></td>
                <td><%= item.getNom_invent() %></td>
                <td><%= item.getTipo() %></td>
                <td><%= item.getCantidad() %></td>
                <td><%= item.getProveedor() %></td>
                <td>
                    <form method="post" action="EditInventory.jsp">
                        <input type="hidden" name="cod_invet" value="<%= item.getCod_invet() %>">
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
            </tbody>
        </table>
    </div>
</section>
<script src="JS/Sidebar.js"></script>
</body>
</html>
