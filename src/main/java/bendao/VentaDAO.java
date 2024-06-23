/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bendao;

import bean.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.ConexionBD;

/**
 *
 * @author cesa1
 */
public class VentaDAO {

    Connection con;
    ConexionBD cn = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;
    int r;
    int vtdo;

    public String GenerarSerie() {
        String numeroserie = "";
        String sql = "select max(Numeroserie) from ventas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                numeroserie = rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return numeroserie;

    }

    public int IdVentas() {
        int idventas = 0;
        String sql = "select max(idventa) from ventas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idventas = rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("ERROR EN IDVENTAS");
        }
        return idventas;
    }

    public int guardarVenta(Venta ve) {
        String sql = "insert into ventas(Idcliente,Idempleado,Numeroserie,Fechaventa,Monto,Estado) values(?,?,?,curdate(),?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ve.getIdcliente());
            ps.setInt(2, ve.getIdempleado());
            ps.setString(3, ve.getNumSerie());
            ps.setDouble(4, ve.getPrecio());
            ps.setString(5, ve.getEstado());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return r;
    }

    public int guardarDetalleventas(Venta venta) {
        String sql = "insert into detalle_venta(idventa,Idproducto,Cantidad,Precioventa) values(?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, venta.getId());
            ps.setInt(2, venta.getIdproducto());
            ps.setInt(3, venta.getCantidad());
            ps.setDouble(4, venta.getPrecio());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return r;
    }

}
