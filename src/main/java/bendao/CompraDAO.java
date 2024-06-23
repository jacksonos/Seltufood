/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bendao;

import bean.Compra;
import bean.Detalle_compra;
import bean.Platillo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConexionBD;

/**
 *
 * @author miche
 */
public class CompraDAO {

    Connection con;
    ConexionBD cn = new ConexionBD();
    PreparedStatement ps;
    ResultSet rs;

    public int IdCompra() {
        int idc = 0;
        String sql = "select max(Idcompra) from compra";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idc = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el Id compra " + e);
        }
        return idc;
    }

    public int guardarCompra(Compra co) {
        String sql = "insert into compra(Idcliente,Idpago, Fechacompra,Monto,Estado)values(?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, co.getIdcliente());
            ps.setInt(2, co.getIdpago());
            ps.setString(3, co.getFechacompra());
            ps.setDouble(4, co.getMonto());
            ps.setString(5, co.getEstado());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al guardar compra " + e);
        }
        return 1;
    }

    public int guardarDetalleCompra(Detalle_compra dc) {
        String sql = "insert into detalle_compra(Idproducto, Idcompra, Cantidad, Precio)values(?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dc.getIdproducto());
            ps.setInt(2, dc.getIdcompra());
            ps.setInt(3, dc.getCantidad());
            ps.setDouble(4, dc.getPrecio());
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar el detalle de compra " + e);
        }
        return 1;
    }

    public List misCompras(int id) {
        List lista = new ArrayList();
        String sql = "select * from compra where Idcliente =" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Compra com = new Compra();
                com.setIdcompra(rs.getInt(1));
                com.setIdcliente(rs.getInt(2));
                com.setIdpago(rs.getInt(3));
                com.setFechacompra(rs.getString(4));
                com.setMonto(rs.getDouble(5));
                com.setEstado(rs.getString(6));
                lista.add(com);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar mis compras " + e);
        }
        return lista;
    }

    public List Detalle(int id) {
        List lista = new ArrayList();
        String sql = "select DC.Iddetalle, P.Foto, P.Nombre, DC.Idcompra, DC.Cantidad, DC.Precio "
                + "FROM detalle_compra DC "
                + "inner join producto P "
                + "on P.Idproducto = DC.Idproducto "
                + "where Idcompra=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Detalle_compra dcom = new Detalle_compra();
                dcom.setIddetalle(rs.getInt(1));
                dcom.setPlatillo(new Platillo());
                dcom.getPlatillo().setFoto(rs.getString(2));
                dcom.getPlatillo().setNombre(rs.getString(3));
                dcom.setIdcompra(rs.getInt(4));
                dcom.setCantidad(rs.getInt(5));
                dcom.setPrecio(rs.getDouble(6));
                lista.add(dcom);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar los detalles " + e);
        }
        return lista;
    }

    public int Pagar(double monto) {
        String sql = "insert into pago(Monto)values(?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, monto);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al pagar " + e);
        }
        return 1;
    }

    public int IdPago() {
        int idpago = 0;
        String sql = "select max(Idpago) from pago";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idpago = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener idpago " + e);
        }
        return idpago;
    }

    public int CantidadOrdenes() {

        int cantidad = 0;

        String sql = "SELECT count(Idcompra) FROM compra;";

        try {

            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                cantidad = rs.getInt(1);

            }

        } catch (SQLException e) {

            System.out.println("Error al obtener la cantidad de -> " + e);

        }
        return cantidad;
    }

    public double MontoCompras() {
        double monto = 0.0;

        String sql = "SELECT SUM(Monto) SUMValor FROM compra;";

        try {

            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                monto = rs.getDouble(1);

            }

        } catch (SQLException e) {

            System.out.println("Error al obtener el monto de compras -> " + e);

        }

        return monto;
    }

    public List<Compra> TotalCompraPorCliente() {

        List<Compra> listacompraxcli = new ArrayList<>();

        String sql = "SELECT cliente.Nombres, SUM(Monto) AS TotalCompras "
                + "FROM compra "
                + "INNER JOIN cliente "
                + "ON cliente.Idcliente = compra.Idcliente "
                + "GROUP BY cliente.Nombres "
                + "ORDER BY `TotalCompras` DESC "
                + "LIMIT 3;";

        try {

            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                Compra objCompra = new Compra();
                objCompra.setNombreCli(rs.getString(1));
                objCompra.setMonto(rs.getDouble(2));
                System.out.println("EL NOBMRE DEL CLIENTE ES " + objCompra.getNombreCli());
                System.out.println("EL MONTO DEL CLIENTE ES " + objCompra.getMonto());
                listacompraxcli.add(objCompra);

            }
            System.out.println("tamaño lista " + listacompraxcli.size());

        } catch (SQLException e) {

            System.out.println("Error al obtener el monto total del cliente -> " + e);

        }
        return listacompraxcli;
    }

    public int CantidadProductosVendidos() {

        int cantidadventidadeproductos = 0;

        String sql = "SELECT sum(Cantidad) as Total_de_Productos_Vendidos "
                + "FROM `detalle_compra`;";
        try {

            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                cantidadventidadeproductos = rs.getInt(1);

            }

        } catch (SQLException e) {

            System.out.println("Error al obtener el monto de compras -> " + e);

        }

        return cantidadventidadeproductos;

    }

}
