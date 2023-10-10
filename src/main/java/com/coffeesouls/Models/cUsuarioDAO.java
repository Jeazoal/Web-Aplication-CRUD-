package com.coffeesouls.Models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;


public class cUsuarioDAO {
    private Connection connection;

    // Constructor que recibe la conexión
    public cUsuarioDAO(Connection connection) {
        this.connection = connection;
    }

    // Método para verificar las credenciales de inicio de sesión
    public boolean validarUsuario(String nombreUsuario, String contraseña) {
        String sql = "SELECT contraseña FROM Usuarios WHERE nombreUsuario = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, nombreUsuario);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String contraseñaAlmacenada = resultSet.getString("contraseña");
                // Verificar la contraseña con BCrypt
                return BCrypt.checkpw(contraseña, contraseñaAlmacenada);
            } else {
                // El usuario no existe en la base de datos
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}