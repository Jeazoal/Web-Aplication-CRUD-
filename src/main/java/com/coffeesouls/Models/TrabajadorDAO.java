package com.coffeesouls.Models;
import com.coffeesouls.Connections.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class TrabajadorDAO {

    private Connection connection;

    public TrabajadorDAO() {
        try {
            // Establece la conexión en el constructor
            connection = Conexion.getConnection();
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos en el constructor de TrabajadorDAO: " + e.getMessage());
        }
    }

    public List<Trabajador> obtenerTrabajadores() {
        List<Trabajador> trabajadores = new ArrayList<>();

        try {
            // Llama al procedimiento almacenado para obtener todos los trabajadores
            String procedureCall = "{call obtener_trabajadores}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int idEmp = resultSet.getInt("id_emp");
                String nomEmp = resultSet.getString("nom_emp");
                String apeEmp = resultSet.getString("ape_emp");
                int edadEmp = resultSet.getInt("edad_emp");
                String dniEmp = resultSet.getString("dni_emp");
                String email = resultSet.getString("email");

                Trabajador trabajador = new Trabajador(idEmp, nomEmp, apeEmp, edadEmp, dniEmp, email);
                trabajadores.add(trabajador);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener trabajadores desde la base de datos: " + e.getMessage());
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

        return trabajadores;
    }

    public Trabajador obtenerTrabajadorPorID(int idEmp) {
        Trabajador trabajador = null;

        try {
            // Llama al procedimiento almacenado para obtener un trabajador por ID
            String procedureCall = "{call obtener_trabajador_por_id(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, idEmp);
            ResultSet resultSet = callableStatement.executeQuery();

            if (resultSet.next()) {
                String nomEmp = resultSet.getString("nom_emp");
                String apeEmp = resultSet.getString("ape_emp");
                int edadEmp = resultSet.getInt("edad_emp");
                String dniEmp = resultSet.getString("dni_emp");
                String email = resultSet.getString("email");

                trabajador = new Trabajador(idEmp, nomEmp, apeEmp, edadEmp, dniEmp, email);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener un trabajador por ID desde la base de datos: " + e.getMessage());
        }

        return trabajador;
    }

    public void agregarTrabajador(String nomEmp, String apeEmp, int edadEmp, String dniEmp, String email) {
        try {
            // Llamar al procedimiento almacenado para agregar un trabajador
            String procedureCall = "{call agregar_trabajador(?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setString(1, nomEmp);
            callableStatement.setString(2, apeEmp);
            callableStatement.setInt(3, edadEmp);
            callableStatement.setString(4, dniEmp);
            callableStatement.setString(5, email);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editarTrabajador(int idEmp, String nuevoNomEmp, String nuevoApeEmp, int nuevaEdadEmp, String nuevoDniEmp, String nuevoEmail) {
        try {
            // Llama al procedimiento almacenado para editar un trabajador
            String procedureCall = "{call editar_trabajador(?, ?, ?, ?, ?, ?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, idEmp);
            callableStatement.setString(2, nuevoNomEmp);
            callableStatement.setString(3, nuevoApeEmp);
            callableStatement.setInt(4, nuevaEdadEmp);
            callableStatement.setString(5, nuevoDniEmp);
            callableStatement.setString(6, nuevoEmail);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarTrabajador(int idEmp) {
        try {
            // Llamar al procedimiento almacenado para eliminar un trabajador por ID
            String procedureCall = "{call eliminar_trabajador(?)}";
            CallableStatement callableStatement = connection.prepareCall(procedureCall);
            callableStatement.setInt(1, idEmp);
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarTrabajadoresSeleccionados(List<Integer> ids) {
        try {
            // Crear una consulta SQL dinámica para eliminar varios trabajadores por ID
            StringBuilder sql = new StringBuilder("DELETE FROM trabajadores WHERE id_emp IN (");
            for (int i = 0; i < ids.size(); i++) {
                sql.append("?");
                if (i < ids.size() - 1) {
                    sql.append(", ");
                }
            }
            sql.append(")");

            PreparedStatement statement = connection.prepareStatement(sql.toString());

            // Establecer los IDs de los trabajadores a eliminar en la consulta
            for (int i = 0; i < ids.size(); i++) {
                statement.setInt(i + 1, ids.get(i));
            }

            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al eliminar los trabajadores seleccionados: " + e.getMessage());
        }
    }

    public List<Trabajador> buscarTrabajadores(String criterio, String tipoBusqueda) {
        List<Trabajador> trabajadoresEncontrados = new ArrayList<>();

        try {
            String sql = "{CALL BuscarTrabajadores(?, ?)}";

            // Preparar la llamada al procedimiento almacenado
            CallableStatement statement = connection.prepareCall(sql);
            statement.setString(1, criterio);
            statement.setString(2, tipoBusqueda);

            // Ejecutar el procedimiento almacenado
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int idEmp = resultSet.getInt("id_emp");
                String nomEmp = resultSet.getString("nom_emp");
                String apeEmp = resultSet.getString("ape_emp");
                int edadEmp = resultSet.getInt("edad_emp");
                String dniEmp = resultSet.getString("dni_emp");
                String email = resultSet.getString("email");

                Trabajador trabajador = new Trabajador(idEmp, nomEmp, apeEmp, edadEmp, dniEmp, email);
                trabajadoresEncontrados.add(trabajador);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return trabajadoresEncontrados;
    }

}
