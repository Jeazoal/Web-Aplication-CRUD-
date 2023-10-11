package com.coffeesouls.Models;

import com.coffeesouls.Connections.Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InventarioDAO {

    private Connection connection;

    public InventarioDAO() {
        try {
            // Establece la conexión en el constructor
            connection = Conexion.getConnection();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos en el constructor de TrabajadorDAO: " + e.getMessage());
        }
    }

    public List<Inventario> obtenerInventario() {
        List<Inventario> inventario = new ArrayList<>();

        try {
            // Llama al procedimiento almacenado para obtener todo el inventario
            String procedureCall = "{call obtener_inventario}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int cod_invet = resultSet.getInt("cod_invet");
                String nom_invent = resultSet.getString("nom_invent");
                String tipo = resultSet.getString("tipo");
                String cantidad = resultSet.getString("cantidad");
                String proveedor = resultSet.getString("proveedor");

                Inventario item = new Inventario(cod_invet, nom_invent, tipo, cantidad, proveedor);
                inventario.add(item);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el inventario desde la base de datos: " + e.getMessage());
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

        return inventario;
    }

    public Inventario obtenerInventarioPorCodigo(int cod_invet) {
        Inventario item = null;

        try {
            // Llama al procedimiento almacenado para obtener un item de inventario por código
            String procedureCall = "{call obtener_inventario_por_codigo(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, cod_invet);
            ResultSet resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                String nom_invent = resultSet.getString("nom_invent");
                String tipo = resultSet.getString("tipo");
                String cantidad = resultSet.getString("cantidad");
                String proveedor = resultSet.getString("proveedor");

                item = new Inventario(cod_invet, nom_invent, tipo, cantidad, proveedor);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener un item de inventario por código desde la base de datos: " + e.getMessage());
        }

        return item;
    }

    public void agregarInventario(String nom_invent, String tipo, String cantidad, String proveedor) {
        try {
            // Llamar al procedimiento almacenado para agregar un item de inventario
            String procedureCall = "{call agregar_inventario(?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setString(1, nom_invent);
            callableStatement.setString(2, tipo);
            callableStatement.setString(3, cantidad);
            callableStatement.setString(4, proveedor);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editarInventario(int cod_invet, String nuevoNomInvent, String nuevoTipo, String nuevaCantidad, String nuevoProveedor) {
        try {
            // Llama al procedimiento almacenado para editar un item de inventario
            String procedureCall = "{call editar_inventario(?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, cod_invet);
            callableStatement.setString(2, nuevoNomInvent);
            callableStatement.setString(3, nuevoTipo);
            callableStatement.setString(4, nuevaCantidad);
            callableStatement.setString(5, nuevoProveedor);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarInventario(int cod_invet) {
        try {
            // Llama al procedimiento almacenado para eliminar un item de inventario por código
            String procedureCall = "{call eliminar_inventario(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, cod_invet);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Inventario> buscarInventario(String criterio, String tipoBusqueda) {
        List<Inventario> inventarioEncontrado = new ArrayList<>();

        try {
            String sql = "{CALL BuscarInventario(?, ?)}";

            // Preparar la llamada al procedimiento almacenado
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, criterio);
            statement.setString(2, tipoBusqueda);

            // Ejecutar el procedimiento almacenado
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int cod_invet = resultSet.getInt("cod_invet");
                String nom_invent = resultSet.getString("nom_invent");
                String tipo = resultSet.getString("tipo");
                String cantidad = resultSet.getString("cantidad");
                String proveedor = resultSet.getString("proveedor");

                Inventario item = new Inventario(cod_invet,nom_invent,tipo,cantidad,proveedor);
                inventarioEncontrado.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inventarioEncontrado;
    }
}
