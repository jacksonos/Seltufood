/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import bean.Cliente;
import bean.Empleado;
import bendao.ClienteDAO;
import bendao.EmpleadoDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author miche
 */
public class ServletUsuario extends HttpServlet {

    Empleado empleado;
    EmpleadoDAO empleadoDAO;
    Cliente cliente;
    ClienteDAO clienteDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        System.out.println("PASANDO POR EL SERVLET");
        String msgelogin;

        if (accion.equalsIgnoreCase("Ingresar")) {

            if (request.getParameter("txtcorreoelogin").length() == 0 || request.getParameter("txtpasswordlogin").length() == 0) {

                msgelogin = "Rellene todos los campos";
                request.setAttribute("msgelogin", msgelogin);
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {

                String correoeRecibido = request.getParameter("txtcorreoelogin");
                String passwordRecibido = request.getParameter("txtpasswordlogin");
                empleado = new Empleado();
                empleadoDAO = new EmpleadoDAO();
                cliente = new Cliente();
                clienteDAO = new ClienteDAO();

                try {
                    System.out.println("PASANDO POR EL VALIDADO EN SERVLET");
                    empleado = empleadoDAO.validarEmpleado(correoeRecibido, passwordRecibido);
                    cliente = clienteDAO.ValidarCliente(correoeRecibido, passwordRecibido);

                } catch (SQLException ex) {
                    System.out.println("ERROR EN VALIDAR DENTRO DEL SERVLET");
                    Logger.getLogger(ServletUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (empleado.getIdempleado() != 0) {

                    HttpSession session = request.getSession();
                    session.setAttribute("empleadousuario", empleado);
                    //ServletDashboard
                    request.getRequestDispatcher("ServletDashboard?menu=Dashboard").forward(request, response);

                } else if (cliente.getIdcliente() != 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("clienteusuario", cliente);
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } else {
                    msgelogin = "Correo o contraseña incorrectos";
                    request.setAttribute("msgelogin", msgelogin);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

            }

        } else if (accion.equals("Registrar")) {

            if (!request.getParameter("txtpassrep").equals(request.getParameter("txtpass"))) {

                msgelogin = "Contraseña diferentes";
                request.setAttribute("msgelogin", msgelogin);
                request.getRequestDispatcher("register.jsp").forward(request, response);

            } else {

                String nombre = request.getParameter("txtnombre");
                String apellido = request.getParameter("txtapellido");
                String genero = request.getParameter("txtgenero");
                String direc = request.getParameter("txtdirec");
                String pass = request.getParameter("txtpass");
                String passrep = request.getParameter("txtpassrep");
                String correo = request.getParameter("txtcorreo");
                String Masculino;
                if (Integer.parseInt(request.getParameter("txtgenero")) == 1) {
                    Masculino = "Masculino";
                } else {
                    Masculino = "Femenino";
                }

                Cliente cliente = new Cliente();
                ClienteDAO clidao = new ClienteDAO();

                cliente.setNombres(nombre);
                cliente.setApellidos(apellido);
                cliente.setDireccion(direc);
                cliente.setGenero(Masculino);
                cliente.setCorreo(correo);
                cliente.setPassword(pass);
                cliente.setEstado(1);
                clidao.AgregarCliente(cliente);

                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
