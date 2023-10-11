package com.coffeesouls.Controllers;


import com.coffeesouls.Models.Categoria;
import com.coffeesouls.Models.CategoriaDAO;

import com.coffeesouls.Models.TrabajadorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoriaServlet", urlPatterns = {"/categoria"})
public class CategoriaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí puedes implementar la lógica para manejar las solicitudes GET relacionadas con las categorías, si es necesario.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            // Obtener los parámetros del formulario para agregar una categoría
            String nom_categoria = request.getParameter("nom_categoria");
            String estado = request.getParameter("estado");

            // Crear una instancia de CategoriaDAO para agregar la categoría
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            categoriaDAO.agregarCategoria(nom_categoria,estado);
        } else if ("editar".equals(action)) {
            // Obtener los parámetros del formulario para editar una categoría
            int id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
            String nuevoNomCategoria = request.getParameter("nuevo_nom_categoria");
            String nuevoEstado = request.getParameter("nuevo_estado");

            // Crear una instancia de CategoriaDAO para editar la categoría
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            categoriaDAO.editarCategoria(id_categoria,nuevoNomCategoria,nuevoEstado);
        } else if ("eliminar".equals(action)) {
            // Obtener el ID de la categoría a eliminar
            int id_categoria = Integer.parseInt(request.getParameter("id_categoria"));

            // Crear una instancia de CategoriaDAO para eliminar la categoría
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            categoriaDAO.eliminarCategoria(id_categoria);
        } else if ("buscar".equals(action)) {
            String criterioBusqueda = request.getParameter("criterio_busqueda");
            String tipoBusqueda = request.getParameter("tipo_busqueda"); // Puede ser "id_categoria", "nom_categoria" o "estado"

            // Llamar al método de búsqueda en CategoriaDAO
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            List<Categoria> categoriasEncontradas = categoriaDAO.buscarCategorias(criterioBusqueda, tipoBusqueda);

            for (Categoria categoria : categoriasEncontradas) {
                System.out.println("ID Categoría: " + categoria.getId_categoria());
                System.out.println("Nombre Categoría: " + categoria.getNom_categoria());
                System.out.println("Estado: " + categoria.getEstado());
                System.out.println("---------------------------");
            }

            // Guardar la lista de categorías en el objeto de solicitud para mostrar en la página de resultados
            request.setAttribute("categoriasEncontradas", categoriasEncontradas);

            // Redirigir a la página de resultados de búsqueda (por ejemplo, "ResultadosCategoria.jsp")
            request.getRequestDispatcher("ResultCategorias.jsp").forward(request, response);
        }
        // Redirigir a la página de categorías usando GET
        response.sendRedirect("ManageCategoria.jsp");
    }
}
