<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Producto, com.coffeesouls.Models.ProductoDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados de Búsqueda</title>
</head>
<body>
<h1>Resultados de Búsqueda</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Precio</th>
    </tr>
    </thead>
    <tbody>
    <%
        // Accede a la lista de productos desde el objeto de solicitud
        List<Producto> productosEncontrados = (List<Producto>) request.getAttribute("productosEncontrados");

        // Itera a través de la lista y muestra los resultados
        for (Producto producto : productosEncontrados) {
    %>
    <tr>
        <td><%= producto.getId() %></td>
        <td><%= producto.getNombre() %></td>
        <td><%= producto.getPrecio() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>