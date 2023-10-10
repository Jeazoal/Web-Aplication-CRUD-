package com.coffeesouls.Controllers;

import com.coffeesouls.Connections.Conexion;
import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén los parámetros del formulario de registro
        String nombreUsuario = request.getParameter("nombreUser");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseñaregistro");

        // Realiza validaciones en el lado del servidor
        if (nombreUsuario != null && contraseña != null && correo != null && nombreUsuario.matches("[A-Za-z0-9]{4,}") && contraseña.length() >= 8) {
            // Los datos son válidos, procede con el registro
            // Encripta la contraseña
            String hashedPassword = BCrypt.hashpw(contraseña, BCrypt.gensalt());

            // Intenta establecer una conexión y registrar al nuevo usuario en la base de datos
            try (Connection connection = Conexion.getConnection()) {
                // Define la consulta SQL para insertar un nuevo usuario
                String sql = "INSERT INTO Usuarios (nombreUsuario, contraseña, correo) VALUES (?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, nombreUsuario);
                    statement.setString(2, hashedPassword);
                    statement.setString(3, correo);

                    // Ejecuta la consulta para insertar el nuevo usuario
                    int filasAfectadas = statement.executeUpdate();

                    if (filasAfectadas > 0) {
                        // El registro se realizó correctamente, redirige al usuario a la página de éxito
                        response.sendRedirect("Login.jsp");
                    } else {
                        // Hubo un problema al registrar al usuario, redirige a la página de error
                        response.sendRedirect("error_registro.jsp");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error_registro.jsp");
            }
        } else {
            // Los datos no son válidos, muestra un mensaje de error al usuario
            request.setAttribute("error", "Datos de registro no válidos");
            request.getRequestDispatcher("aaaa.jsp").forward(request, response);
        }
    }
}
