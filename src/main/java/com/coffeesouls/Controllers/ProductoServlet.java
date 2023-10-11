package com.coffeesouls.Controllers;

import com.coffeesouls.Models.ProductoDAO;
import com.coffeesouls.Models.Producto;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;



@WebServlet(name = "ProductoServlet", urlPatterns = {"/producto"})
public class ProductoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            // Obtener los parámetros del formulario para agregar un producto
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));

            // Crear una instancia de ProductoDAO para agregar el producto
            ProductoDAO productoDAO = new ProductoDAO();
            productoDAO.agregarProducto(nombre, precio);
        } else if ("editar".equals(action)) {
            // Obtener los parámetros del formulario para editar un producto
            int id = Integer.parseInt(request.getParameter("id"));
            String nuevoNombre = request.getParameter("nuevo_nombre");
            double nuevoPrecio = Double.parseDouble(request.getParameter("nuevo_precio"));

            // Crear una instancia de ProductoDAO para editar el producto
            ProductoDAO productoDAO = new ProductoDAO();
            productoDAO.editarProducto(id, nuevoNombre, nuevoPrecio);
        } else if ("eliminar".equals(action)) {
            // Obtener el ID del producto a eliminar
            int id = Integer.parseInt(request.getParameter("id"));

            // Crear una instancia de ProductoDAO para eliminar el producto
            ProductoDAO productoDAO = new ProductoDAO();
            productoDAO.eliminarProducto(id);
        }else if ("buscar".equals(action)) {
            String criterioBusqueda = request.getParameter("criterio_busqueda");
            String tipoBusqueda = request.getParameter("tipo_busqueda"); // Puede ser "nombre" o "id"

            // Llamar al método de búsqueda en ProductoDAO
            ProductoDAO productoDAO = new ProductoDAO();
            List<Producto> productosEncontrados = productoDAO.buscarProductos(criterioBusqueda, tipoBusqueda);

            for (Producto producto : productosEncontrados) {
                System.out.println("ID: " + producto.getId());
                System.out.println("Nombre: " + producto.getNombre());
                System.out.println("Precio: " + producto.getPrecio());
                System.out.println("---------------------------");
            }

            // Guardar la lista de productos en el objeto de solicitud para mostrar en la página de resultados
            request.setAttribute("productosEncontrados", productosEncontrados);

            request.getRequestDispatcher("ResultProductos.jsp").forward(request, response);
        }
        // Redirigir a la página de productos usando GET
        response.sendRedirect("ManageProducto.jsp");
    }
}