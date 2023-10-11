package com.coffeesouls.Models;

import com.coffeesouls.Connections.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.CallableStatement;

public class CategoriaDAO {
    private Connection connection;

    public CategoriaDAO() {
        try {
            // Establece la conexión en el constructor
            connection = Conexion.getConnection();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos en el constructor de TrabajadorDAO: " + e.getMessage());
        }
    }


    public List<Categoria> obtenerCategorias() {
        List<Categoria> categorias = new ArrayList<>();
        try {
            String procedureCall = "{call obtener_categorias}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int id_categoria = resultSet.getInt("id_categoria");
                String nom_categoria = resultSet.getString("nom_categoria");
                String estado = resultSet.getString("estado");

                Categoria categoria = new Categoria(id_categoria, nom_categoria, estado);
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categorias;
    }

    public List<Categoria> buscarCategorias(String criterio, String tipoBusqueda) {
        List<Categoria> categoriasEncontradas = new ArrayList<>();

        try {
            String sql = "{CALL BuscarCategorias(?, ?)}";

            // Preparar la llamada al procedimiento almacenado
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, criterio);
            statement.setString(2, tipoBusqueda);

            // Ejecutar el procedimiento almacenado
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id_categoria = resultSet.getInt("id_categoria");
                String nom_categoria = resultSet.getString("nom_categoria");
                String estado = resultSet.getString("estado");

                Categoria categoria = new Categoria(id_categoria, nom_categoria, estado);
                categoriasEncontradas.add(categoria);
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar categorías desde la base de datos: " + e.getMessage());
        }

        return categoriasEncontradas;
    }

    public void agregarCategoria(String nom_categoria, String estado) {
        try {
            String procedureCall = "{call agregar_categoria(?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setString(1, nom_categoria);
            callableStatement.setString(2, estado);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Categoria obtenerCategoriaPorID(int id_categoria) {
        Categoria categoria = null;

        try {
            String procedureCall = "{call obtener_categoria_por_id(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, id_categoria);
            ResultSet resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                String nomCategoria = resultSet.getString("nom_categoria");
                String estado = resultSet.getString("estado");

                categoria = new Categoria(id_categoria, nomCategoria, estado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoria;
    }

    public void editarCategoria(int id_categoria, String nuevoNomCategoria, String nuevoEstado) {
        try {
            String procedureCall = "{call editar_categoria(?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, id_categoria);
            callableStatement.setString(2, nuevoNomCategoria);
            callableStatement.setString(3, nuevoEstado);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarCategoria(int id_categoria) {
        try {
            String procedureCall = "{call eliminar_categoria(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, id_categoria);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


