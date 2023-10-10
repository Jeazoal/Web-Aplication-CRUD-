package com.coffeesouls.Models;

import com.coffeesouls.Connections.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

public class ProductoDAO {
    private Connection connection;

    public ProductoDAO() {
        try {
            // Establece la conexión en el constructor
            connection = Conexion.getConnection();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos en el constructor de ProductoDAO: " + e.getMessage());
        }
    }

    public List<Producto> obtenerProductos() {
        List<Producto> productos = new ArrayList<>();

        try {
            // Llama al procedimiento almacenado
            String procedureCall = "{call obtener_productos}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                double precio = resultSet.getDouble("precio");
                // Otros campos...

                Producto producto = new Producto(id, nombre, precio);
                productos.add(producto);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener productos desde la base de datos: " + e.getMessage());
        } finally {
            // Asegúrate de cerrar la conexión al finalizar
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.err.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }

        return productos;
    }

    public List<Producto> buscarProductos(String criterio, String tipoBusqueda) {
        List<Producto> productosEncontrados = new ArrayList<>();

        try {
            String sql = "{CALL BuscarProductos(?, ?)}";

            // Preparar la llamada al procedimiento almacenado
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, criterio);
            statement.setString(2, tipoBusqueda);

            // Ejecutar el procedimiento almacenado
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                double precio = resultSet.getDouble("precio");

                Producto producto = new Producto(id, nombre, precio);
                productosEncontrados.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosEncontrados;
    }

    public void agregarProducto(String nombre, double precio) {
        try {
            // Llamar al procedimiento almacenado
            String procedureCall = "{call agregar_producto(?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setString(1, nombre);
            callableStatement.setDouble(2, precio);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Producto obtenerProductoPorID(int id) {
        Producto producto = null;

        try {
            // Llama al procedimiento almacenado
            String procedureCall = "{call obtener_producto_por_id(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                String nombre = resultSet.getString("nombre");
                double precio = resultSet.getDouble("precio");

                producto = new Producto(id, nombre, precio);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return producto;
    }

    public void editarProducto(int id, String nuevoNombre, double nuevoPrecio) {
        try {
            // Llama al procedimiento almacenado
            String procedureCall = "{call editar_producto(?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, id);
            callableStatement.setString(2, nuevoNombre);
            callableStatement.setDouble(3, nuevoPrecio);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarProducto(int id) {
        try {
            // Llamar al procedimiento almacenado
            String procedureCall = "{call eliminar_producto(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, id);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarProductosSeleccionados(List<Integer> ids) {
        try {
            // Crear una consulta SQL dinámica para eliminar varios productos por ID
            StringBuilder sql = new StringBuilder("DELETE FROM productos WHERE id IN (");
            for (int i = 0; i < ids.size(); i++) {
                sql.append("?");
                if (i < ids.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");

            PreparedStatement statement = connection.prepareStatement(sql.toString());

            // Establecer los IDs de los productos a eliminar en la consulta
            for (int i = 0; i < ids.size(); i++) {
                statement.setInt(i + 1, ids.get(i));
            }

            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al eliminar los productos seleccionados: " + e.getMessage());
        }
    }

    public List<Producto> obtenerTresProductosMasCaros() {
        List<Producto> productosCaros = new ArrayList<>();

        try {
            String sql = "SELECT TOP 3 * FROM productos ORDER BY precio DESC";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                double precio = resultSet.getDouble("precio");

                Producto producto = new Producto(id, nombre, precio);
                productosCaros.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosCaros;
    }


}

