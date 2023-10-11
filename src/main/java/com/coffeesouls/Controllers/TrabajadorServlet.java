package com.coffeesouls.Controllers;
import com.coffeesouls.Models.Trabajador;
import com.coffeesouls.Models.TrabajadorDAO;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;

@WebServlet(name = "TrabajadorServlet", urlPatterns = {"/trabajador"})
public class TrabajadorServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Aquí puedes implementar la lógica para manejar las solicitudes GET relacionadas con los trabajadores, si es necesario.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            // Obtener los parámetros del formulario para agregar un trabajador
            String nomEmp = request.getParameter("nomEmp");
            String apeEmp = request.getParameter("apeEmp");
            int edadEmp = Integer.parseInt(request.getParameter("edadEmp"));
            String dniEmp = request.getParameter("dniEmp");
            String email = request.getParameter("email");

            // Crear una instancia de TrabajadorDAO para agregar el trabajador
            TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
            trabajadorDAO.agregarTrabajador(nomEmp, apeEmp, edadEmp, dniEmp, email);
        } else if ("editar".equals(action)) {
            // Obtener los parámetros del formulario para editar un trabajador
            int idEmp = Integer.parseInt(request.getParameter("idEmp"));
            String nuevoNomEmp = request.getParameter("nuevoNomEmp");
            String nuevoApeEmp = request.getParameter("nuevoApeEmp");
            int nuevaEdadEmp = Integer.parseInt(request.getParameter("nuevaEdadEmp"));
            String nuevoDniEmp = request.getParameter("nuevoDniEmp");
            String nuevoEmail = request.getParameter("nuevoEmail");

            // Crear una instancia de TrabajadorDAO para editar el trabajador
            TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
            trabajadorDAO.editarTrabajador(idEmp, nuevoNomEmp, nuevoApeEmp, nuevaEdadEmp, nuevoDniEmp, nuevoEmail);
        } else if ("eliminar".equals(action)) {
            // Obtener el ID del trabajador a eliminar
            int idEmp = Integer.parseInt(request.getParameter("idEmp"));

            // Crear una instancia de TrabajadorDAO para eliminar el trabajador
            TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
            trabajadorDAO.eliminarTrabajador(idEmp);
        } else if ("buscar".equals(action)) {
            String criterioBusqueda = request.getParameter("criterio_busqueda");
            String tipoBusqueda = request.getParameter("tipo_busqueda"); // Puede ser "id_emp", "nom_emp", "ape_emp", o "dni_emp"

            // Llamar al método de búsqueda en TrabajadorDAO
            TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
            List<Trabajador> trabajadoresEncontrados = trabajadorDAO.buscarTrabajadores(criterioBusqueda, tipoBusqueda);

            for (Trabajador trabajador : trabajadoresEncontrados) {
                System.out.println("ID: " + trabajador.getIdEmp());
                System.out.println("Nombre: " + trabajador.getNomEmp());
                System.out.println("Apellido: " + trabajador.getApeEmp());
                System.out.println("Edad: " + trabajador.getEdadEmp());
                System.out.println("DNI: " + trabajador.getDniEmp());
                System.out.println("Email: " + trabajador.getEmail());
                System.out.println("---------------------------");
            }

            // Guardar la lista de trabajadores en el objeto de solicitud para mostrar en la página de resultados
            request.setAttribute("trabajadoresEncontrados", trabajadoresEncontrados);

            // Redirigir a la página de resultados de búsqueda (por ejemplo, "ResultadosBusqueda.jsp")
            request.getRequestDispatcher("ResultTrabajador.jsp").forward(request, response);
        }
        // Redirigir a la página de trabajadores usando GET
        response.sendRedirect("ManageTrabajador.jsp");
    }
}