package com.coffeesouls.Controllers;

import com.coffeesouls.Models.Inventario;
import com.coffeesouls.Models.InventarioDAO;

import java.io.IOException;
import java.util.List;

import com.coffeesouls.Models.Trabajador;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "InventarioServlet", urlPatterns = {"/inventario"})
public class InventarioServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí puedes implementar la lógica para manejar las solicitudes GET relacionadas con el inventario, si es necesario.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            // Obtener los parámetros del formulario para agregar un elemento de inventario
            String nom_invent = request.getParameter("nom_invent");
            String tipo = request.getParameter("tipo");
            String cantidad = request.getParameter("cantidad");
            String proveedor = request.getParameter("proveedor");

            // Crear una instancia de InventarioDAO para agregar el elemento de inventario
            InventarioDAO inventarioDAO = new InventarioDAO();
            inventarioDAO.agregarInventario(nom_invent,tipo,cantidad,proveedor);
        } else if ("editar".equals(action)) {
            // Obtener los parámetros del formulario para editar un elemento de inventario
            int cod_invet = Integer.parseInt(request.getParameter("cod_invet"));
            String nuevoNomInvent = request.getParameter("nuevoNomInvent");
            String nuevaCantidad = request.getParameter("nuevaCantidad");
            String nuevoTipo = request.getParameter("nuevoTipo");
            String nuevoProveedor = request.getParameter("nuevoProveedor");

            // Crear una instancia de InventarioDAO para editar el elemento de inventario
            InventarioDAO inventarioDAO = new InventarioDAO();
            inventarioDAO.editarInventario(cod_invet, nuevoNomInvent, nuevoTipo,nuevaCantidad ,nuevoProveedor);
        } else if ("eliminar".equals(action)) {
            // Obtener el código del elemento de inventario a eliminar
            int cod_invet = Integer.parseInt(request.getParameter("cod_invet"));

            // Crear una instancia de InventarioDAO para eliminar el elemento de inventario
            InventarioDAO inventarioDAO = new InventarioDAO();
            inventarioDAO.eliminarInventario(cod_invet);
        } else if ("buscar".equals(action)) {
            String criterioBusqueda = request.getParameter("criterio_busqueda");
            String tipoBusqueda = request.getParameter("tipo_busqueda"); // Puede ser "cod_invent", "nom_invent" o "proveedor"

            // Llamar al método de búsqueda en InventarioDAO
            InventarioDAO inventarioDAO = new InventarioDAO();
            List<Inventario> inventarioEncontrado = inventarioDAO.buscarInventario(criterioBusqueda, tipoBusqueda);

            for (Inventario inventario : inventarioEncontrado) {
                System.out.println("ID: " + inventario.getCod_invet());
                System.out.println("Nombre: " + inventario.getNom_invent());
                System.out.println("Tipo: " + inventario.getTipo());
                System.out.println("Cantidad: " + inventario.getCantidad());
                System.out.println("Proveedor: " + inventario.getProveedor());
                System.out.println("---------------------------");
            }

            // Guardar la lista de elementos de inventario en el objeto de solicitud para mostrar en la página de resultados
            request.setAttribute("inventarioEncontrado", inventarioEncontrado);

            // Redirigir a la página de resultados de búsqueda (por ejemplo, "ResultadosBusquedaInventario.jsp")
            request.getRequestDispatcher("ResultInventario.jsp").forward(request, response);
        }
        // Redirigir a la página de inventario usando GET
        response.sendRedirect("ManageInventario.jsp");
    }
}
