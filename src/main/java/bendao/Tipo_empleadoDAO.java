/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bendao;

import bean.Tipo_empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.ConexionBD;

/**
 *
 * @author miche
 */
public class Tipo_empleadoDAO {
    ConexionBD conexionbd = new ConexionBD();
    //Variables sql
    Connection cn = null;
    PreparedStatement ps = null;
    Statement st = null;
    ResultSet rs = null;
    String sql;
    int rto;
    
    public List<Tipo_empleado> ListarTipoEmpleado() {

        List<Tipo_empleado> listatipemple = new ArrayList<>();
        Tipo_empleado tipemp;

        sql = "SELECT * FROM `tipo_empleado` ORDER by Idtipo_empleado;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                tipemp = new Tipo_empleado();
                tipemp.setIdtipo_empleado(rs.getInt(1));
                tipemp.setNombre(rs.getString(2));
                tipemp.setEstado(rs.getInt(3));
                listatipemple.add(tipemp);
            }

        } catch (SQLException e) {

            System.out.println("Error al listar  tipo empleado -> " + e);

        }

        return listatipemple;
    }
    
}

