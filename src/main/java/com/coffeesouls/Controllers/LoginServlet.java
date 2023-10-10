package com.coffeesouls.Controllers;

import com.coffeesouls.Connections.Conexion;
import com.coffeesouls.Models.cUsuarioDAO;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén los parámetros del formulario
        String nombreUsuario = request.getParameter("nombreUsuario");
        String contraseña = request.getParameter("contraseña");

        // Intenta establecer una conexión y validar las credenciales
        try (Connection connection = Conexion.getConnection()) {
            cUsuarioDAO usuarioDAO = new cUsuarioDAO(connection);
            boolean credencialesValidas = usuarioDAO.validarUsuario(nombreUsuario, contraseña);

            if (credencialesValidas) {
                // Las credenciales son válidas, redirige al usuario a la página de éxito
                response.sendRedirect("index.jsp");
            } else {
                // Las credenciales no son válidas, redirige al usuario a la página de error
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}