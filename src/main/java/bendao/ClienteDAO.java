/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bendao;

import bean.Categoria_platillo;
import bean.Cliente;
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
public class ClienteDAO {

    //Llamado de la clase conexión
    ConexionBD conexionbd = new ConexionBD();
    //Variables sql
    Connection cn = null;
    PreparedStatement ps = null;
    Statement st = null;
    ResultSet rs = null;
    String sql;
    int rto;

    public Cliente ValidarCliente(String correo, String password) {
        Cliente cli = new Cliente();
        sql = "SELECT * FROM `cliente` WHERE Correo = ? and Password = ? and Estado = 1;";

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();

            while (rs.next()) {
                cli.setIdcliente(rs.getInt(1));
                cli.setNombres(rs.getString(2));
                cli.setApellidos(rs.getString(3));
                cli.setGenero(rs.getString(4));
                cli.setDireccion(rs.getString(5));
                cli.setCorreo(rs.getString(6));
                cli.setPassword(rs.getString(7));
                cli.setEstado(rs.getInt(8));
            }

        } catch (Exception e) {
            System.out.println("Error al validar el cliente " + e);
        }
        return cli;
    }

    public List<Cliente> ListarClientes() {

        List<Cliente> listaclientes = new ArrayList<>();
        Cliente cli;

        sql = "SELECT * FROM `cliente` ORDER BY Idcliente;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                cli = new Cliente();
                cli.setIdcliente(rs.getInt(1));
                cli.setNombres(rs.getString(2));
                cli.setApellidos(rs.getString(3));
                cli.setGenero(rs.getString(4));
                cli.setDireccion(rs.getString(5));
                cli.setCorreo(rs.getString(6));
                cli.setPassword(rs.getString(7));
                cli.setEstado(rs.getInt(8));
                listaclientes.add(cli);
            }

        } catch (SQLException e) {

            System.out.println("Error al listar los clientes -> " + e);

        }

        return listaclientes;
    }

    public int AgregarCliente(Cliente cli) {

        sql = "INSERT INTO `cliente`(`Nombres`, `Apellidos`, `Genero`, `Direccion`, `Correo`, `Password`, `Estado`) VALUES (?,?,?,?,?,?,?);";

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cli.getNombres());
            ps.setString(2, cli.getApellidos());
            ps.setString(3, cli.getGenero());
            ps.setString(4, cli.getDireccion());
            ps.setString(5, cli.getCorreo());
            ps.setString(6, cli.getPassword());
            ps.setInt(7, cli.getEstado());
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al agregar un cliente --> " + e);

        }

        return rto;
    }

    public Cliente ListarporId(int idcate) {

        conexionbd = new ConexionBD();
        Cliente cli = new Cliente();
        sql = "SELECT * FROM `cliente` WHERE Idcliente = '" + idcate + "' ORDER BY Idcliente;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                cli.setNombres(rs.getString("Nombres"));
                cli.setApellidos(rs.getString("Apellidos"));
                cli.setGenero(rs.getString("Genero"));
                cli.setDireccion(rs.getString("Direccion"));
                cli.setCorreo(rs.getString("Correo"));
                cli.setPassword(rs.getString("Password"));
                cli.setEstado(rs.getInt("Estado"));
            }

        } catch (SQLException e) {

            System.out.println("Error al listar clientes por ID: " + e);

        }
        return cli;
    }

    public int actualizarCliente(Cliente cli) {

        sql = "UPDATE `cliente` SET `Nombres`=?,`Apellidos`=?,`Genero`=?,`Direccion`=?,`Correo`=?,`Password`=?,`Estado`=? WHERE Idcliente = ?;";

        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, cli.getNombres());
            ps.setString(2, cli.getApellidos());
            ps.setString(3, cli.getGenero());
            ps.setString(4, cli.getDireccion());
            ps.setString(5, cli.getCorreo());
            ps.setString(6, cli.getPassword());
            ps.setInt(7, cli.getEstado());
            ps.setInt(8, cli.getIdcliente());
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al actualizar cliente " + e);

        }

        return rto;
    }

    public void BorrarCliente(int id) {

        sql = "DELETE FROM `cliente` WHERE Idcliente=" + id;

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error al borrar al cliente -> " + e);

        }
    }

    public void CambiarEstadoCliente(Cliente clienestado) {

        int variable;

        if (clienestado.getEstado() == 1) {
            variable = 0;
        } else {
            variable = 1;
        }

        sql = "UPDATE `cliente` SET `Estado`=" + variable + " WHERE `Idcliente`=" + clienestado.getIdcliente();

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al cambiar el estado del cliente -> " + e);
        }
    }

    //Métodos para el dashboard
    public int CantidadEmpleados() {
        int cantidad = 0;

        sql = "SELECT count(Idcliente) FROM cliente WHERE Estado = 1;";

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                cantidad = rs.getInt(1);

            }

        } catch (SQLException e) {

            System.out.println("Error al borrar al cliente -> " + e);

        }

        return cantidad;
    }

    public List<Cliente> ClientesPorGenero() {

        Cliente cli;
        List<Cliente> listpergen = new ArrayList<>();
        sql = "SELECT  Genero,COUNT(Genero) AS Genero FROM  cliente GROUP BY Genero;";

        try {

            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                cli = new Cliente();
                cli.setGenero(rs.getString(1));
                cli.setEstado(rs.getInt(2));
                System.out.println("ESTE ES EL GENERO " + cli.getGenero());
                System.out.println("ESTE ES EL NUMERO " + cli.getEstado());
                listpergen.add(cli);
            }

        } catch (SQLException e) {
            System.out.println("Error al contar clientes por género " + e);
        }
        return listpergen;
    }

    public Cliente buscarUsuario(String id) {
        Cliente emp = new Cliente();
        String sql = "select * from Cliente where nombres LIKE " + "'%" + id + "%'";
        try {
            cn = conexionbd.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setIdcliente(rs.getInt(1));
                emp.setNombres(rs.getString(2));
                emp.setApellidos(rs.getString(3));
                emp.setGenero(rs.getString(4));
                emp.setDireccion(rs.getString(5));
                emp.setCorreo(rs.getString(6));
                emp.setPassword(rs.getString(7));
                emp.setEstado(rs.getInt(8));
            }
        } catch (SQLException e) {
            System.out.println("ERROR AL BUSCAR USUARIO: " + e);
        }
        return emp;
    }

}
