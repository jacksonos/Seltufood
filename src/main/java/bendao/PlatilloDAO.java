package bendao;

import bean.Categoria_platillo;
import bean.Platillo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.ConexionBD;

public class PlatilloDAO {

    //Llamado de la clase conexión
    ConexionBD conexionbd = new ConexionBD();
    //Variables sql
    Connection cn = null;
    PreparedStatement ps = null;
    Statement st = null;
    ResultSet rs = null;
    String sql;
    int rto;

    public List<Platillo> ListarPlatillos() {

        List<Platillo> listaplat = new ArrayList<>();
        Platillo plati;

        sql = "SELECT p.Idproducto, c.Nombre Categ, p.Nombre, p.Foto, p.Descripcion, p.Precio, p.Stock, p.Estado, c.Idcategoria "
                + "FROM producto P "
                + "INNER JOIN categoria_platillo C "
                + "on c.Idcategoria = p.Idcategoria "
                + "ORDER BY p.Idproducto;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                plati = new Platillo();
                plati.setIdPlatillo(rs.getInt(1));
                plati.setCategoria_platillo(new Categoria_platillo());
                plati.getCategoria_platillo().setNombre(rs.getString(2));
                plati.setNombre(rs.getString(3));
                plati.setFoto(rs.getString(4));
                plati.setDescripcion(rs.getString(5));
                plati.setPrecio(rs.getDouble(6));
                plati.setStock(rs.getInt(7));
                plati.setEstado(rs.getInt(8));
                plati.getCategoria_platillo().setIdCategoria(rs.getInt(9));
                listaplat.add(plati);
                System.out.println("NOMBRE DE LA CATE AQUI " + plati.getCategoria_platillo().getIdCategoria());
            }

        } catch (SQLException e) {

            System.out.println("Error al listar las platilloS -> " + e);

        }

        return listaplat;
    }

    public int AgregarPlatillo(Platillo plat) {

        sql = "INSERT INTO `producto`(`Idcategoria`, `Nombre`, `Foto`, `Descripcion`, `Precio`, `Stock`, `Estado`) VALUES (?,?,?,?,?,?,?);";

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, plat.getCategoria_platillo().getIdCategoria());
            ps.setString(2, plat.getNombre());
            ps.setString(3, plat.getFoto());
            ps.setString(4, plat.getDescripcion());
            ps.setDouble(5, plat.getPrecio());
            ps.setInt(6, plat.getStock());
            ps.setInt(7, plat.getEstado());
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al agregar un platillo --> " + e);

        }

        return rto;
    }

    public Platillo ListarporId(int idcate) {

        conexionbd = new ConexionBD();
        Platillo platillo_porid = new Platillo();
        sql = "SELECT * FROM `producto` WHERE Idproducto  = '" + idcate + "' ORDER BY Idproducto;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                platillo_porid.setIdPlatillo(rs.getInt(1));
                platillo_porid.setCategoria_platillo(new Categoria_platillo());
                platillo_porid.getCategoria_platillo().setIdCategoria(2);
                platillo_porid.setNombre(rs.getString(3));
                platillo_porid.setFoto(rs.getString(4));
                platillo_porid.setDescripcion(rs.getString(5));
                platillo_porid.setPrecio(rs.getDouble(6));
                platillo_porid.setStock(rs.getInt(7));
                platillo_porid.setEstado(rs.getInt(8));
            }

        } catch (SQLException e) {

            System.out.println("Error al listar platillo por ID: " + e);

        }
        return platillo_porid;
    }

    public int actualizarPlatillo(Platillo plati) {

        sql = "UPDATE `producto` SET `Idcategoria`=?,`Nombre`=?,`Foto`=?,`Descripcion`=?,`Precio`=?,`Stock`=?,`Estado`=? WHERE `Idproducto`=? ;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, plati.getCategoria_platillo().getIdCategoria());
            ps.setString(2, plati.getNombre());
            ps.setString(3, plati.getFoto());
            ps.setString(4, plati.getDescripcion());
            ps.setDouble(5, plati.getPrecio());
            ps.setInt(6, plati.getStock());
            ps.setInt(7, plati.getEstado());
            ps.setInt(8, plati.getIdPlatillo());
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al actualizar platillo " + e);

        }

        return rto;
    }

    public void BorrarProducto(int id) {

        sql = "DELETE FROM `producto` WHERE `Idproducto`=" + id;

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al borrar el platillo          .");

        }
    }

    public void CambiarEstadoPlatillo(Platillo platillocamesta) {

        int variable;

        if (platillocamesta.getEstado() == 1) {
            variable = 0;
        } else {
            variable = 1;
        }

        sql = "UPDATE `producto` SET `Estado`=" + variable + " WHERE `Idproducto`=" + platillocamesta.getIdPlatillo();

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al cambiar el estado del platillo.");
        }
    }

    public List<Platillo> PlatillosMasVentidos() {

        List<Platillo> listplatvend = new ArrayList<>();
        Platillo plat;

        sql = "SELECT p.Nombre,sum(cantidad) as platillos_mas_vendidos "
                + "FROM compra "
                + "c INNER JOIN detalle_compra d "
                + "ON c.Idcompra=d.Idcompra "
                + "INNER JOIN producto p "
                + "ON d.Idproducto=p.Idproducto "
                + "group by p.Nombre "
                + "ORDER BY `platillos_mas_vendidos` "
                + "DESC limit 5;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                plat = new Platillo();
                plat.setNombre(rs.getString(1));
                plat.setStock(rs.getInt(2));
                listplatvend.add(plat);
            }

        } catch (SQLException e) {

            System.out.println("Error al listar los platillos más ventidos : " + e);

        }
        return listplatvend;

    }

    public Platillo BuscarProducto(String id) {
        Platillo emp = new Platillo();
        String sql = "select Idproducto, Nombre, Precio, Stock from producto where nombre LIKE" + "'%" + id + "%'";
        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdPlatillo(rs.getInt(1));
                emp.setNombre(rs.getString(2));
                emp.setPrecio(rs.getDouble(3));
                emp.setStock(rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println("ERROR AL BUSCAR PRODUCTO: " + e);
        }
        return emp;
    }

}
