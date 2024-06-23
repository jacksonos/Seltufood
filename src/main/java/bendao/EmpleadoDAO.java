package bendao;

import bean.Empleado;
import bean.Tipo_empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConexionBD;

public class EmpleadoDAO {

      //Llamado de la clase conexión
    ConexionBD conexionbd = new ConexionBD();
    //Variables sql
    Connection cn = null;
    PreparedStatement ps= null;
    ResultSet rs= null;
    
    int rto;

    public Empleado validarEmpleado(String correo, String password) throws SQLException{
        
        //Creación de objeto de clase Empleado y variable de consulta sql
        Empleado empleadovalidado = new Empleado();
        String sql = "SELECT E.Idempleado, T.Nombre, E.Nombre, E.Apellido, E.Genero, E.Telefono, E.Correo, E.Password, E.Estado "
                + "from empleado E "
                + "INNER JOIN tipo_empleado T "
                + "ON E.Idtipo_empleado = T.Idtipo_empleado "
                + "WHERE E.Correo=? "
                + "AND E.Password=? "
                + "AND E.Estado = 1";
        
        //Conexión y recepción de los datos de la BD
        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();
            
            while(rs.next()){
                empleadovalidado.setIdempleado(rs.getInt(1));
                empleadovalidado.setTipo_empleado(new Tipo_empleado());
                empleadovalidado.getTipo_empleado().setNombre(rs.getString(2));
                empleadovalidado.setNombre(rs.getString(3));
                empleadovalidado.setApellido(rs.getString(4));
                empleadovalidado.setGenero(rs.getString(5));
                empleadovalidado.setTelefono(rs.getInt(6));
                empleadovalidado.setCorreo(rs.getString(7));
                empleadovalidado.setPassword(rs.getString(8));
                empleadovalidado.setEstado(rs.getInt(9));
            }
            
        } catch (SQLException e) {
            
            System.out.println("Error al validar el empleado -> "+e);
            
        }finally{
            
            cn.close();
            ps.close();
            rs.close();
            
        }
        return empleadovalidado;
    }
    
    public List<Empleado> ListarEmpleados() {

        List<Empleado> listaEmple = new ArrayList<>();
        Empleado emple;

        String sql = "SELECT E.Idempleado, T.Nombre, E.Nombre, E.Apellido, E.Genero, E.Telefono, E.Correo, E.Password, E.Estado "
                + "from empleado "
                + "E INNER JOIN tipo_empleado T "
                + "ON E.Idtipo_empleado = T.Idtipo_empleado;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                emple = new Empleado();
                emple.setIdempleado(rs.getInt(1));
                emple.setTipo_empleado(new Tipo_empleado());
                emple.getTipo_empleado().setNombre(rs.getString(2));
                emple.setNombre(rs.getString(3));
                emple.setApellido(rs.getString(4));
                emple.setGenero(rs.getString(5));
                emple.setTelefono(rs.getInt(6));
                emple.setCorreo(rs.getString(7));
                emple.setPassword(rs.getString(8));
                emple.setEstado(rs.getInt(9));
                listaEmple.add(emple);
            }

        } catch (SQLException e) {

            System.out.println("Error al listar los empleados -> " + e);

        }

        return listaEmple;
    }
    
    public int AgregarCliente(Empleado emple) {

        String sql = "INSERT INTO `empleado`(`Idtipo_empleado`, `Nombre`, `Apellido`, `Genero`, `Telefono`, `Correo`, `Password`, `Estado`) VALUES (?,?,?,?,?,?,?,?);";

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, emple.getTipo_empleado().getIdtipo_empleado());
            ps.setString(2, emple.getNombre());
            ps.setString(3, emple.getApellido());
            ps.setString(4, emple.getGenero());
            ps.setInt(5, emple.getTelefono());
            ps.setString(6, emple.getCorreo());
            ps.setString(7, emple.getPassword());
            ps.setInt(8, emple.getEstado());
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al agregar un empleado --> " + e);

        }

        return rto;
    }
    
    public Empleado ListarEmpleadoporId(int idcate) {

        Empleado emp = new Empleado();
        String sql = "SELECT * FROM `empleado` WHERE Idempleado = '" + idcate + "' ORDER BY Idempleado;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                emp.setIdempleado(rs.getInt(1));
                emp.setTipo_empleado(new Tipo_empleado());
                emp.getTipo_empleado().setIdtipo_empleado(2);
                emp.setNombre(rs.getString(3));
                emp.setApellido(rs.getString(4));
                emp.setGenero(rs.getString(5));
                emp.setTelefono(rs.getInt(6));
                emp.setCorreo(rs.getString(7));
                emp.setPassword(rs.getString(8));
                emp.setEstado(rs.getInt(9));
            }

        } catch (SQLException e) {

            System.out.println("Error al listar empleados por ID: " + e);

        }
        return emp;
    }
    
     public int actualizarEmpleado(Empleado emp) {

        String sql = "UPDATE `empleado` SET `Idtipo_empleado`=?,`Nombre`=?,`Apellido`=?,`Genero`=?,`Telefono`=?,`Correo`=?,`Password`=?,`Estado`=? WHERE Idempleado = ?;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, emp.getTipo_empleado().getIdtipo_empleado());
            ps.setString(2, emp.getNombre());
            ps.setString(3, emp.getApellido());
            ps.setString(4, emp.getGenero());
            ps.setInt(5, emp.getTelefono());
            ps.setString(6, emp.getCorreo());
            ps.setString(7, emp.getPassword());
            ps.setInt(8, emp.getEstado());
            ps.setInt(9, emp.getIdempleado());
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al actualizar empleado " + e);

        }

        return rto;
    }
     
     public void BorrarEmpleado(int id) {

        String sql = "DELETE FROM `empleado` WHERE Idempleado=" + id;

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al borrar al empleado -> " + e);

        }
    }
     
     public void CambiarEstadoCliente(Empleado empleadoestado) {

        int variable;

        if (empleadoestado.getEstado() == 1) {
            variable = 0;
        } else {
            variable = 1;
        }

        String sql = "UPDATE `empleado` SET `Estado`=" + variable + " WHERE `Idempleado`=" + empleadoestado.getIdempleado();

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al cambiar el estado del empleado -> " + e);
        }
    }

}
