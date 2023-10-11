package com.coffeesouls.Controllers;

import com.coffeesouls.Models.Venta;
import com.coffeesouls.Models.VentaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "VentaServlet", urlPatterns = {"/venta"})
public class VentaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            // Obtener los parámetros del formulario para agregar una venta
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaVenta = null;
            try {
                fechaVenta = dateFormat.parse(request.getParameter("fecha_venta"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            BigDecimal monto = new BigDecimal(request.getParameter("monto"));
            String descripcion = request.getParameter("descripcion");
            String nomCliente = request.getParameter("nom_cliente");

            // Crear una instancia de VentaDAO para agregar la venta
            VentaDAO ventaDAO = new VentaDAO();
            ventaDAO.agregarVenta(fechaVenta, monto, descripcion, nomCliente);
        } else if ("editar".equals(action)) {
            // Obtener los parámetros del formulario para editar una venta
            int idVenta = Integer.parseInt(request.getParameter("id_venta"));
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date nuevaFechaVenta = null;
            try {
                nuevaFechaVenta = dateFormat.parse(request.getParameter("nueva_fecha_venta"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            BigDecimal nuevoMonto = new BigDecimal(request.getParameter("nuevo_monto"));
            String nuevaDescripcion = request.getParameter("nueva_descripcion");
            String nuevoNomCliente = request.getParameter("nuevo_nom_cliente");

            // Crear una instancia de VentaDAO para editar la venta
            VentaDAO ventaDAO = new VentaDAO();
            ventaDAO.editarVenta(idVenta, nuevaFechaVenta, nuevoMonto, nuevaDescripcion, nuevoNomCliente);
        } else if ("eliminar".equals(action)) {
            // Obtener el ID de la venta a eliminar
            int idVenta = Integer.parseInt(request.getParameter("id_venta"));

            // Crear una instancia de VentaDAO para eliminar la venta
            VentaDAO ventaDAO = new VentaDAO();
            ventaDAO.eliminarVenta(idVenta);
        } else if ("buscar".equals(action)) {
            String criterioBusqueda = request.getParameter("criterio_busqueda");
            String tipoBusqueda = request.getParameter("tipo_busqueda"); // Puede ser "id_venta" o "fecha_venta"

            // Llamar al método de búsqueda en VentaDAO
            VentaDAO ventaDAO = new VentaDAO();
            List<Venta> ventasEncontradas = ventaDAO.buscarVentas(criterioBusqueda, tipoBusqueda);

            for (Venta venta : ventasEncontradas) {
                System.out.println("ID Venta: " + venta.getIdVenta());
                System.out.println("Fecha Venta: " + venta.getFechaVenta());
                System.out.println("Monto: " + venta.getMonto());
                System.out.println("Descripción: " + venta.getDescripcion());
                System.out.println("Nombre Cliente: " + venta.getNomCliente());
                System.out.println("---------------------------");
            }

            // Guardar la lista de ventas en el objeto de solicitud para mostrar en la página de resultados
            request.setAttribute("ventasEncontradas", ventasEncontradas);

            // Redirigir a la página de resultados de búsqueda (por ejemplo, "ResultadosVentas.jsp")
            request.getRequestDispatcher("ResultVentas.jsp").forward(request, response);
        }

        // Redirigir a la página de ventas usando GET
        response.sendRedirect("ManageVentas.jsp");
    }
}