package com.coffeesouls.Connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    // Información de conexión
    private static final String jdbcUrl = "jdbc:sqlserver://DESKTOP-FT5EC3K:1433;databaseName=CoffeeSouls;encrypt=false";
    private static final String usuario = "sa";
    private static final String contraseña = "1234";

    // Método para obtener la conexión a la base de datos
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Cargar el controlador JDBC
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            // Intenta establecer la conexión
            connection = DriverManager.getConnection(jdbcUrl, usuario, contraseña);
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (ClassNotFoundException e) {
            System.err.println("No se pudo encontrar el controlador JDBC: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
            throw e; // Reenviar la excepción para manejarla en otro lugar si es necesario
        }
        return connection;
    }

    public static void main(String[] args) {
        Connection connection = null;
        try {
            // Intenta obtener una conexión
            connection = Conexion.getConnection();

            // Realiza operaciones de prueba aquí
            if (connection != null) {
                // La conexión se estableció correctamente, puedes realizar operaciones en la base de datos aquí
                // Por ejemplo, puedes imprimir información sobre la base de datos
                System.out.println("Versión de la base de datos: " + connection.getMetaData().getDatabaseProductVersion());
            } else {
                System.err.println("La conexión no se pudo establecer.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones aquí si la conexión falla
        } finally {
            // Asegúrate de cerrar la conexión al finalizar
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
