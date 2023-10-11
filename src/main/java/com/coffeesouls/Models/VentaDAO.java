package com.coffeesouls.Models;

import com.coffeesouls.Connections.Conexion;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.math.BigDecimal;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;
public class VentaDAO {
    private Connection connection;

    public VentaDAO() {
        try {
            // Establece la conexión en el constructor
            connection = Conexion.getConnection();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos en el constructor de TrabajadorDAO: " + e.getMessage());
        }
    }

    public void agregarVenta(Date fecha_venta, BigDecimal monto, String descripcion, String nom_cliente) {
        String sql = "INSERT INTO VENTAS (fecha_venta, monto, descripcion, nom_cliente) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, new java.sql.Date(fecha_venta.getTime()));
            statement.setBigDecimal(2, monto);
            statement.setString(3, descripcion);
            statement.setString(4, nom_cliente);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Venta> obtenerVentas() {
        List<Venta> ventas = new ArrayList<>();
        String sql = "SELECT * FROM VENTAS";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id_venta = resultSet.getInt("id_venta");
                Date fecha_venta = resultSet.getDate("fecha_venta");
                BigDecimal monto = resultSet.getBigDecimal("monto");
                String descripcion = resultSet.getString("descripcion");
                String nom_cliente = resultSet.getString("nom_cliente");
                ventas.add(new Venta(id_venta, fecha_venta, monto, descripcion, nom_cliente));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ventas;
    }

    public List<Venta> buscarVentas(String criterio, String tipoBusqueda) {
        List<Venta> ventasEncontradas = new ArrayList<>();
        String sql = "SELECT * FROM VENTAS WHERE " + tipoBusqueda + " = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, criterio);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id_venta = resultSet.getInt("id_venta");
                    Date fecha_venta = resultSet.getDate("fecha_venta");
                    BigDecimal monto = resultSet.getBigDecimal("monto");
                    String descripcion = resultSet.getString("descripcion");
                    String nom_cliente = resultSet.getString("nom_cliente");
                    ventasEncontradas.add(new Venta(id_venta, fecha_venta, monto, descripcion, nom_cliente));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ventasEncontradas;
    }

    public Venta obtenerVentaPorID(int id_venta) {
        Venta venta = null;
        String sql = "SELECT * FROM VENTAS WHERE id_venta = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id_venta);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Date fecha_venta = resultSet.getDate("fecha_venta");
                    BigDecimal monto = resultSet.getBigDecimal("monto");
                    String descripcion = resultSet.getString("descripcion");
                    String nom_cliente = resultSet.getString("nom_cliente");
                    venta = new Venta(id_venta, fecha_venta, monto, descripcion, nom_cliente);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return venta;
    }

    public void editarVenta(int id_venta, Date nuevaFechaVenta, BigDecimal nuevoMonto, String nuevaDescripcion, String nuevoNomCliente) {
        String sql = "UPDATE VENTAS SET fecha_venta = ?, monto = ?, descripcion = ?, nom_cliente = ? WHERE id_venta = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, new java.sql.Date(nuevaFechaVenta.getTime()));
            statement.setBigDecimal(2, nuevoMonto);
            statement.setString(3, nuevaDescripcion);
            statement.setString(4, nuevoNomCliente);
            statement.setInt(5, id_venta);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarVenta(int id_venta) {
        String sql = "DELETE FROM VENTAS WHERE id_venta = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id_venta);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

