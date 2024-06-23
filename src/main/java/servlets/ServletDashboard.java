/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import bean.Categoria_platillo;
import bean.Cliente;
import bean.Empleado;
import bean.GenerarSerie;
import bean.Platillo;
import bean.Tipo_empleado;
import bean.Venta;
import bendao.Categoria_platilloDAO;
import bendao.ClienteDAO;
import bendao.CompraDAO;
import bendao.EmpleadoDAO;
import bendao.PlatilloDAO;
import bendao.Tipo_empleadoDAO;
import bendao.VentaDAO;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.servlet.http.Part;

public class ServletDashboard extends HttpServlet {

    //Categorías
    Categoria_platillo objCategoria_plat = new Categoria_platillo();
    Categoria_platilloDAO objCategoria_platDAO = new Categoria_platilloDAO();
    //Platillos
    Platillo objPlatillo = new Platillo();
    PlatilloDAO objPlatilloDAO = new PlatilloDAO();
    //Clientes
    Cliente objCliente = new Cliente();
    ClienteDAO objClienteDAO = new ClienteDAO();
    //Compra
    CompraDAO objCompraDAO = new CompraDAO();

    Empleado empdao = new Empleado();
    EmpleadoDAO objEmpleadoDAO = new EmpleadoDAO();

    Tipo_empleadoDAO objTipo_empleadoDAO = new Tipo_empleadoDAO();

    int idforeveryone;

    int codiguito = 0;

    Venta v = new Venta();

    List<Venta> lista = new ArrayList<>();

    int item;
    int cod1;
    String descripcion;
    double precio;
    int cant;
    double subtotal;
    double totalpagar;

    String numeroserie;
    VentaDAO vdao = new VentaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.getAttribute("empleadousuario");

        String accionmenu = request.getParameter("accionmenu");
        String menu = request.getParameter("menu");

        if (menu.equals("Dashboard")) {
            int cantidadClientes = objClienteDAO.CantidadEmpleados();
            request.setAttribute("cantclientes", cantidadClientes);
            int cantidadOrdenes = objCompraDAO.CantidadOrdenes();
            request.setAttribute("cantordenes", cantidadOrdenes);
            double montOrdenes = objCompraDAO.MontoCompras();
            request.setAttribute("montordenes", montOrdenes);
            int cantidadprodcomprados = objCompraDAO.CantidadProductosVendidos();
            request.setAttribute("cantprodvendidos", cantidadprodcomprados);
            //CHART JS METHOD
            List<Platillo> PostresList = objPlatilloDAO.ListarPlatillos();
            Gson gson = new Gson();
            String json = gson.toJson(PostresList);
            response.setContentType("application/json");
            response.getWriter().write(json);

            request.getRequestDispatcher("dashboardindex.jsp").forward(request, response);
        }

        if (menu.equals("Platillos")) {

            switch (accionmenu) {

                case "Listar":

                    List<Platillo> platilloslistado = objPlatilloDAO.ListarPlatillos();
                    request.setAttribute("listaplatillo", platilloslistado);

                    List<Categoria_platillo> listacatplattoform = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplattoform);

                    break;

                case "Agregar":
                    int platcategoriaag = Integer.parseInt(request.getParameter("selectcategoriaag"));
                    String platnombreag = request.getParameter("txtnombreplatag");
                    String platdescripag = request.getParameter("descripcionplatag");
                    double platprecioag = Double.parseDouble(request.getParameter("precioplatag"));
                    int platstockag = Integer.parseInt(request.getParameter("stockplatag"));
                    int platestadoag = Integer.parseInt(request.getParameter("selectactivplatag"));
                    String platimagenag = request.getParameter("txtimagenurlplatag");

                    objPlatillo.setCategoria_platillo(new Categoria_platillo());
                    objPlatillo.getCategoria_platillo().setIdCategoria(platcategoriaag);
                    objPlatillo.setNombre(platnombreag);
                    objPlatillo.setDescripcion(platdescripag);
                    objPlatillo.setPrecio(platprecioag);
                    objPlatillo.setStock(platstockag);
                    objPlatillo.setEstado(platestadoag);
                    objPlatillo.setFoto(platimagenag);
                    objPlatilloDAO.AgregarPlatillo(objPlatillo);

                    List<Platillo> platilloslistadoag = objPlatilloDAO.ListarPlatillos();
                    request.setAttribute("listaplatillo", platilloslistadoag);

                    List<Categoria_platillo> listacatplattoformag = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplattoformag);

                    break;

                case "Editar":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    Platillo platied = objPlatilloDAO.ListarporId(idforeveryone);
                    request.setAttribute("platillosporid", platied);

                    List<Platillo> platilloslistadoed = objPlatilloDAO.ListarPlatillos();
                    request.setAttribute("listaplatillo", platilloslistadoed);

                    List<Categoria_platillo> listacatplattoformed = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplattoformed);
                    break;

                case "Actualizar":
                    int platcategoriaac = Integer.parseInt(request.getParameter("selectcategoriaag"));
                    String platnombreac = request.getParameter("txtnombreplatag");
                    String platdescripac = request.getParameter("descripcionplatag");
                    double platprecioac = Double.parseDouble(request.getParameter("precioplatag"));
                    int platstockac = Integer.parseInt(request.getParameter("stockplatag"));
                    int platestadoac = Integer.parseInt(request.getParameter("selectactivplatag"));
                    String platimagenac = request.getParameter("txtimagenurlplatag");
                    objPlatillo.setCategoria_platillo(new Categoria_platillo());
                    objPlatillo.getCategoria_platillo().setIdCategoria(platcategoriaac);
                    objPlatillo.setNombre(platnombreac);
                    objPlatillo.setDescripcion(platdescripac);
                    objPlatillo.setPrecio(platprecioac);
                    objPlatillo.setStock(platstockac);
                    objPlatillo.setEstado(platestadoac);
                    objPlatillo.setFoto(platimagenac);
                    objPlatillo.setIdPlatillo(idforeveryone);
                    objPlatilloDAO.actualizarPlatillo(objPlatillo);

                    List<Platillo> platilloslistadoac = objPlatilloDAO.ListarPlatillos();
                    request.setAttribute("listaplatillo", platilloslistadoac);

                    List<Categoria_platillo> listacatplattoformac = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplattoformac);

                    break;

                case "Delete":

                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    objPlatilloDAO.BorrarProducto(idforeveryone);

                    List<Platillo> platilloslistadodel = objPlatilloDAO.ListarPlatillos();
                    request.setAttribute("listaplatillo", platilloslistadodel);

                    List<Categoria_platillo> listacatplattoformdel = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplattoformdel);

                    break;

                case "CambiarEstado":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    Platillo platilloestado = objPlatilloDAO.ListarporId(idforeveryone);
                    platilloestado.setIdPlatillo(idforeveryone);
                    objPlatilloDAO.CambiarEstadoPlatillo(platilloestado);

                    List<Platillo> platilloslistadoest = objPlatilloDAO.ListarPlatillos();
                    request.setAttribute("listaplatillo", platilloslistadoest);

                    List<Categoria_platillo> listacatplattoformest = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplattoformest);

                    break;

                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("dashboardeditplatillos.jsp").forward(request, response);
        }

        if (menu.equals("CategoriaPlatillos")) {

            switch (accionmenu) {

                case "Listar":

                    List<Categoria_platillo> listacatplat = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplat);
                    break;

                case "Agregar":
                    String nombrecatplatag = request.getParameter("txtnombrecat");
                    int estadocatplatag = Integer.parseInt(request.getParameter("selectactiv"));
                    objCategoria_plat.setNombre(nombrecatplatag);
                    objCategoria_plat.setEstado(estadocatplatag);
                    objCategoria_platDAO.AgregarCategoria(objCategoria_plat);

                    List listacatplatag = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplatag);

                    break;

                case "Editar":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    Categoria_platillo cate_platedit = objCategoria_platDAO.ListarporId(idforeveryone);
                    request.setAttribute("cate_platedtoit", cate_platedit);

                    List listacatplatedit = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplatedit);
                    break;

                case "Actualizar":
                    String nombrecatplatac = request.getParameter("txtnombrecat");
                    int estadocatplatac = Integer.parseInt(request.getParameter("selectactiv"));
                    objCategoria_plat.setNombre(nombrecatplatac);
                    objCategoria_plat.setEstado(estadocatplatac);
                    objCategoria_plat.setIdCategoria(idforeveryone);
                    objCategoria_platDAO.actualizarCategeoria(objCategoria_plat);

                    List<Categoria_platillo> listacatplatac = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplatac);
                    break;

                case "Delete":

                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    objCategoria_platDAO.BorrarCategoria(idforeveryone);

                    List listacatplatdel = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplatdel);

                    break;

                case "CambiarEstado":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    System.out.println("ESTE ES EL ID DEL PLATILLO " + idforeveryone);
                    Categoria_platillo cate_platesta = objCategoria_platDAO.ListarporId(idforeveryone);
                    cate_platesta.setIdCategoria(idforeveryone);
                    objCategoria_platDAO.CambiarEstadoCategoria(cate_platesta);

                    List listacatplatestad = objCategoria_platDAO.ListarCatPlatillos();
                    request.setAttribute("categ_platillo", listacatplatestad);

                    break;

                default:
                    throw new AssertionError();

            }

            request.getRequestDispatcher("dashboardeditcategorias.jsp").forward(request, response);

        }

        if (menu.equals("Clientes")) {

            switch (accionmenu) {

                case "Listar":

                    List<Cliente> listaclientes = objClienteDAO.ListarClientes();
                    request.setAttribute("clientes", listaclientes);
                    break;

                case "Agregar":

                    String nombresclienteag = request.getParameter("txtnombrecli");
                    String apellidosclienteag = request.getParameter("txtapellidocli");
                    String Masculino;
                    String generoclienteag = request.getParameter("selectgenerocli");
                    String direccionclienteag = request.getParameter("txtdireccioncli");
                    String correoclienteag = request.getParameter("txtemailcli");
                    String passwordclienteag = request.getParameter("txtpasswordcli");
                    int estadoclienteag = Integer.parseInt(request.getParameter("selectestadocli"));

                    if (Integer.parseInt(request.getParameter("selectgenerocli")) == 1) {
                        Masculino = "Masculino";
                    } else {
                        Masculino = "Femenino";
                    }

                    objCliente.setNombres(nombresclienteag);
                    objCliente.setApellidos(apellidosclienteag);
                    objCliente.setGenero(Masculino);
                    objCliente.setDireccion(direccionclienteag);
                    objCliente.setCorreo(correoclienteag);
                    objCliente.setPassword(passwordclienteag);
                    objCliente.setEstado(estadoclienteag);
                    objClienteDAO.AgregarCliente(objCliente);

                    List<Cliente> listaclientesag = objClienteDAO.ListarClientes();
                    request.setAttribute("clientes", listaclientesag);

                    break;

                case "Editar":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    Cliente clienteinedit = objClienteDAO.ListarporId(idforeveryone);
                    request.setAttribute("clientetoedit", clienteinedit);

                    List<Cliente> listaclientesed = objClienteDAO.ListarClientes();
                    request.setAttribute("clientes", listaclientesed);
                    break;

                case "Actualizar":
                    String nombresclienteac = request.getParameter("txtnombrecli");
                    String apellidosclienteac = request.getParameter("txtapellidocli");
                    String genero;
                    if (Integer.parseInt(request.getParameter("selectgenerocli")) == 1) {
                        genero = "Masculino";
                    } else {
                        genero = "Femenino";
                    }
                    String generoclienteac = genero;
                    String direccionclienteac = request.getParameter("txtdireccioncli");
                    String correoclienteac = request.getParameter("txtemailcli");
                    String passwordclienteac = request.getParameter("txtpasswordcli");
                    int estadoclienteac = Integer.parseInt(request.getParameter("selectestadocli"));

                    objCliente.setNombres(nombresclienteac);
                    objCliente.setApellidos(apellidosclienteac);
                    objCliente.setGenero(generoclienteac);
                    objCliente.setDireccion(direccionclienteac);
                    objCliente.setCorreo(correoclienteac);
                    objCliente.setPassword(passwordclienteac);
                    objCliente.setEstado(estadoclienteac);
                    objCliente.setIdcliente(idforeveryone);
                    objClienteDAO.actualizarCliente(objCliente);

                    List<Cliente> listaclientesac = objClienteDAO.ListarClientes();
                    request.setAttribute("clientes", listaclientesac);
                    break;

                case "Delete":

                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    objClienteDAO.BorrarCliente(idforeveryone);

                    List<Cliente> listaclientesde = objClienteDAO.ListarClientes();
                    request.setAttribute("clientes", listaclientesde);

                    break;

                case "CambiarEstado":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));

                    Cliente clientecamesta = objClienteDAO.ListarporId(idforeveryone);
                    clientecamesta.setIdcliente(idforeveryone);
                    objClienteDAO.CambiarEstadoCliente(clientecamesta);

                    List<Cliente> listaclientesce = objClienteDAO.ListarClientes();
                    request.setAttribute("clientes", listaclientesce);

                    break;

                default:
                    throw new AssertionError();

            }
            request.getRequestDispatcher("dashboardeditclientes.jsp").forward(request, response);
        }

        if (menu.equals("NuevaVenta")) {
            switch (accionmenu) {
                case "BuscarCliente":
                    String codigo = request.getParameter("codigoCliente");
                    objCliente.setNombres(codigo);
                    objCliente = objClienteDAO.buscarUsuario(codigo);
                    request.setAttribute("c", objCliente);
                    request.setAttribute("nserie", numeroserie);
                    break;

                case "BuscarProducto":
                    String codigoproducto = request.getParameter("codproducto");
                    objPlatillo = objPlatilloDAO.BuscarProducto(codigoproducto);
                    request.setAttribute("c", objCliente);
                    request.setAttribute("producto", objPlatillo);
                    request.setAttribute("lista", lista);
                    request.setAttribute("totalpagar", totalpagar);
                    request.setAttribute("nserie", numeroserie);
                    break;

                case "Agregar":
                    request.setAttribute("c", objCliente);
                    totalpagar = 0.0;
                    item = item + 1;
                    cod1 = objPlatillo.getIdPlatillo();
                    descripcion = request.getParameter("nombreproducto");
                    precio = Double.parseDouble(request.getParameter("precio"));
                    cant = Integer.parseInt(request.getParameter("cant"));
                    subtotal = precio * cant;
                    v = new Venta();
                    v.setItem(item);
                    v.setIdproducto(cod1);
                    v.setDescripcionP(descripcion);
                    v.setPrecio(precio);
                    v.setCantidad(cant);
                    v.setSubtotal(subtotal);
                    lista.add(v);
                    for (int i = 0; i < lista.size(); i++) {
                        totalpagar = totalpagar + lista.get(i).getSubtotal();
                    }
                    request.setAttribute("totalpagar", totalpagar);
                    request.setAttribute("lista", lista);
                    request.setAttribute("nserie", numeroserie);
                    break;

                case "Reporte":
                    response.setContentType("application/vnd.ms-excel");
                    response.setHeader("Content-disposition", "filename=reporte.xls");
                    
                    PrintWriter out = response.getWriter();
                    
                    try{
                         for (int i = 0; i < lista.size(); i++) {
                        out.println(v.getIdproducto()+"  "+v.getDescripcionP()+"  "+v.getPrecio());
                    }
                        
                    }finally{
                        out.close();
                    }
                    
                    break;

                case "GenerarVenta":
                    List listita = objClienteDAO.ListarClientes();
                    Iterator iter = listita.iterator();
                    while (iter.hasNext()) {
                        objCliente = (Cliente) iter.next();
                        codiguito = objCliente.getIdcliente();
                    }
                    v.setIdcliente(codiguito);
                    v.setIdempleado(1);
                    v.setNumSerie(numeroserie);
                    v.setMonto(totalpagar);
                    v.setEstado("1");
                    vdao.guardarVenta(v);

                    System.out.println(v.getNumSerie());
                    System.out.println(codiguito);
                    System.out.println(v.getIdempleado());
                    System.out.println(v.getMonto());

                    //GUARDAR DETALLE VENTAS
                    int idventas = vdao.IdVentas();
                    for (int i = 0; i < lista.size(); i++) {
                        v = new Venta();
                        v.setId(idventas);
                        v.setIdproducto(lista.get(i).getIdproducto());
                        v.setCantidad(lista.get(i).getCantidad());
                        v.setPrecio(lista.get(i).getPrecio());
                        vdao.guardarDetalleventas(v);
                    }
                    //System.out.println(v.getId());
                    //System.out.println(v.getIdproducto());
                    //System.out.println(v.getCantidad());
                    //System.out.println(v.getPrecio());
                    break;
                default:
                    v = new Venta();
                    lista = new ArrayList<>();
                    item = 0;
                    totalpagar = 0.0;
                    numeroserie = vdao.GenerarSerie();
                    if (numeroserie == null) {
                        numeroserie = "00000001";
                        request.setAttribute("nserie", numeroserie);
                    } else {
                        int incrementar = Integer.parseInt(numeroserie);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserie = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserie);
                    }
                //request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);

            }
            request.getRequestDispatcher("dashboardeditventas.jsp").forward(request, response);
        }

        if (menu.equals("Empleados")) {

            switch (accionmenu) {

                case "Listar":

                    List<Empleado> listaEmpleados = objEmpleadoDAO.ListarEmpleados();
                    request.setAttribute("empleados", listaEmpleados);

                    List<Tipo_empleado> listatipoemple = objTipo_empleadoDAO.ListarTipoEmpleado();
                    request.setAttribute("tipoempleados", listatipoemple);

                    break;

                case "Agregar":

                    String nombresclienteag = request.getParameter("txtnombrempleado");
                    String apellidosclienteag = request.getParameter("txtapellidoempleado");
                    String Masculino;
                    String generoclienteag = request.getParameter("selectgenerocli");
                    int telefonoempag = Integer.parseInt(request.getParameter("txtelefonoempleado"));
                    String correoclienteag = request.getParameter("txtemailempleado");
                    String passwordclienteag = request.getParameter("txtpasswordempleado");
                    int tipoempac = Integer.parseInt(request.getParameter("selecttipoemp"));
                    int estadoclienteag = Integer.parseInt(request.getParameter("selectestadocli"));

                    if (Integer.parseInt(request.getParameter("selectgenerocli")) == 1) {
                        Masculino = "Masculino";
                    } else {
                        Masculino = "Femenino";
                    }
                    empdao.setTipo_empleado(new Tipo_empleado());
                    empdao.setNombre(nombresclienteag);
                    empdao.setApellido(apellidosclienteag);
                    empdao.setTelefono(telefonoempag);
                    empdao.setGenero(generoclienteag);
                    empdao.setCorreo(correoclienteag);
                    empdao.setPassword(passwordclienteag);
                    empdao.setEstado(estadoclienteag);
                    empdao.getTipo_empleado().setIdtipo_empleado(tipoempac);
                    objEmpleadoDAO.AgregarCliente(empdao);

                    List<Empleado> listaEmpleadosAG = objEmpleadoDAO.ListarEmpleados();
                    request.setAttribute("empleados", listaEmpleadosAG);

                    List<Tipo_empleado> listatipoempleAG = objTipo_empleadoDAO.ListarTipoEmpleado();
                    request.setAttribute("tipoempleados", listatipoempleAG);

                    break;

                case "Editar":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    Empleado empleadoforedit = objEmpleadoDAO.ListarEmpleadoporId(idforeveryone);
                    request.setAttribute("empleadotoedit", empleadoforedit);

                    List<Empleado> listaEmpleadosedit = objEmpleadoDAO.ListarEmpleados();
                    request.setAttribute("empleados", listaEmpleadosedit);

                    List<Tipo_empleado> listatipoempleedit = objTipo_empleadoDAO.ListarTipoEmpleado();
                    request.setAttribute("tipoempleados", listatipoempleedit);
                    break;

                case "Actualizar":
                    String nombresclienteac = request.getParameter("txtnombrempleado");
                    String apellidosclienteac = request.getParameter("txtapellidoempleado");
                    String generoclienteac = request.getParameter("selectgenerocli");
                    int telefonoempac = Integer.parseInt(request.getParameter("txtelefonoempleado"));
                    String correoclienteac = request.getParameter("txtemailempleado");
                    String passwordclienteac = request.getParameter("txtpasswordempleado");
                    int tipoempag = Integer.parseInt(request.getParameter("selecttipoemp"));
                    int estadoclienteac = Integer.parseInt(request.getParameter("selectestadocli"));

                    String genero;
                    if (Integer.parseInt(request.getParameter("selectgenerocli")) == 1) {
                        genero = "Masculino";
                    } else {
                        genero = "Femenino";
                    }
                    empdao.setTipo_empleado(new Tipo_empleado());
                    empdao.setNombre(nombresclienteac);
                    empdao.setApellido(apellidosclienteac);
                    empdao.setTelefono(telefonoempac);
                    empdao.setGenero(genero);
                    empdao.setCorreo(correoclienteac);
                    empdao.setPassword(passwordclienteac);
                    empdao.setEstado(estadoclienteac);
                    empdao.setIdempleado(idforeveryone);
                    empdao.getTipo_empleado().setIdtipo_empleado(tipoempag);
                    objEmpleadoDAO.actualizarEmpleado(empdao);

                    List<Empleado> listaEmpleadosact = objEmpleadoDAO.ListarEmpleados();
                    request.setAttribute("empleados", listaEmpleadosact);

                    List<Tipo_empleado> listatipoempleactu = objTipo_empleadoDAO.ListarTipoEmpleado();
                    request.setAttribute("tipoempleados", listatipoempleactu);
                    break;

                case "Delete":

                    idforeveryone = Integer.parseInt(request.getParameter("id"));
                    objEmpleadoDAO.BorrarEmpleado(idforeveryone);

                    List<Empleado> listaEmpleadosdel = objEmpleadoDAO.ListarEmpleados();
                    request.setAttribute("empleados", listaEmpleadosdel);

                    List<Tipo_empleado> listatipoempledel = objTipo_empleadoDAO.ListarTipoEmpleado();
                    request.setAttribute("tipoempleados", listatipoempledel);

                    break;

                case "CambiarEstado":
                    idforeveryone = Integer.parseInt(request.getParameter("id"));

                    Empleado empleadocambesta = objEmpleadoDAO.ListarEmpleadoporId(idforeveryone);
                    empleadocambesta.setIdempleado(idforeveryone);
                    objEmpleadoDAO.CambiarEstadoCliente(empleadocambesta);

                    List<Empleado> listaEmpleadoscamest = objEmpleadoDAO.ListarEmpleados();
                    request.setAttribute("empleados", listaEmpleadoscamest);

                    List<Tipo_empleado> listatipoemplecamest = objTipo_empleadoDAO.ListarTipoEmpleado();
                    request.setAttribute("tipoempleados", listatipoemplecamest);

                    break;

                default:
                    throw new AssertionError();

            }
            request.getRequestDispatcher("dashboardeditempleados.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
