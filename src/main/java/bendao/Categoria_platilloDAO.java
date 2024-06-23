package bendao;

//Librerias sql
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
//Librerias de otras clases
import bean.Categoria_platillo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.ConexionBD;
//Librerias java
import java.util.List;

public class Categoria_platilloDAO {

    //Llamado de la clase conexión
    ConexionBD conexionbd = new ConexionBD();
    //Variables sql
    Connection cn = null;
    PreparedStatement ps = null;
    Statement st = null;
    ResultSet rs = null;
    String sql;
    int rto;

    public List<Categoria_platillo> ListarCatPlatillos() {

        List<Categoria_platillo> listacat_plat = new ArrayList<>();
        Categoria_platillo cat_plat;

        sql = "SELECT * FROM categoria_platillo ORDER BY Idcategoria;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                cat_plat = new Categoria_platillo();
                cat_plat.setIdCategoria(rs.getInt("Idcategoria"));
                cat_plat.setNombre(rs.getString("Nombre"));
                cat_plat.setEstado(rs.getInt("Estado"));
                listacat_plat.add(cat_plat);
            }

        } catch (SQLException e) {

            System.out.println("Error al listar las categorías del platillo -> " + e);

        }

        return listacat_plat;
    }

    public int AgregarCategoria(Categoria_platillo cat_plat) {

        sql = "INSERT INTO categoria_platillo (Nombre, Estado) VALUES (?,?)";

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cat_plat.getNombre());
            ps.setInt(2, cat_plat.getEstado());
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al agregar una categoría del platillo --> " + e);

        }

        return rto;
    }

    public Categoria_platillo ListarporId(int idcate) {

        conexionbd = new ConexionBD();
        Categoria_platillo cateplat_porid = new Categoria_platillo();
        sql = "SELECT * FROM categoria_platillo WHERE idCategoria = '" + idcate + "' ORDER BY Idcategoria;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                cateplat_porid.setNombre(rs.getString("Nombre"));
                cateplat_porid.setEstado(rs.getInt("Estado"));
            }

        } catch (SQLException e) {

            System.out.println("Error al listar categoría de platillo por ID: " + e);

        }
        return cateplat_porid;
    }

    public int actualizarCategeoria(Categoria_platillo cat_plat) {
        
        sql = "UPDATE `categoria_platillo` SET `Nombre`=?,`Estado`=? WHERE `Idcategoria`=?;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cat_plat.getNombre());
            ps.setInt(2, cat_plat.getEstado());
            ps.setInt(3, cat_plat.getIdCategoria());
            ps.executeUpdate();

        } catch (SQLException e) {
            
            System.out.println("Error al actualizar categoría " + e);
            
        }
        
        return rto;
    }

    public void BorrarCategoria(int id) {

        sql = "DELETE FROM `categoria_platillo` WHERE `Idcategoria`=" + id;

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al borrar al categoría.");

        }
    }

    public void CambiarEstadoCategoria(Categoria_platillo categoplariavig) {
        
        int variable;
        
        if (categoplariavig.getEstado() == 1) {
            variable = 0;
        } else {
            variable = 1;
        }
        
        sql = "UPDATE `categoria_platillo` SET `Estado`="+variable+" WHERE `Idcategoria`="+categoplariavig.getIdCategoria();
        
        try {
            
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println("Error al borrar al cambiar el estado de la categoría.");
        }
    }

}
