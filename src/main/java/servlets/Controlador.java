package servlets;

import bean.Carrito;
import bean.Cliente;
import bean.Compra;
import bean.Detalle_compra;
import bean.Pago;
import bean.Platillo;
import bendao.Categoria_platilloDAO;
import bendao.ClienteDAO;
import bendao.CompraDAO;
import bendao.PlatilloDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import util.Fecha;

public class Controlador extends HttpServlet {

    //Intanciando otras clases
    Pago pago = new Pago();

    Cliente objCliente = new Cliente();
    ClienteDAO objClienteDAO = new ClienteDAO();

    CompraDAO cdao = new CompraDAO();

    PlatilloDAO objPlatilloDAO = new PlatilloDAO();
    Platillo objPlatillo = new Platillo();

    Categoria_platilloDAO objCategoria_platilloDAO = new Categoria_platilloDAO();

    Carrito car = new Carrito();

    //Listas
    List<Carrito> listaProductos = new ArrayList<>();
    List productos = new ArrayList();
    List categorias = new ArrayList();

    //Variables para el carrito
    int item = 0;
    int cantidad = 1;
    double subtotal = 0.0;
    double totalPagar = 0.0;

    //Variables globales para el servlet
    int idcompra;
    int idpago;
    double montopagar;
    int idProducto = 0;

    Fecha fechaSistem = new Fecha();
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        if(session.getAttribute("clienteusuario")== null){
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        
        objCliente = (Cliente) session.getAttribute("clienteusuario");
        System.out.println("ID DE LA SESIÓN INICIADA "+objCliente.getIdcliente());
        
        productos = objPlatilloDAO.ListarPlatillos();
        categorias = objCategoria_platilloDAO.ListarCatPlatillos();
        

        String accion = request.getParameter("accion");

        switch (accion) {
            case "carrito":
                request.setAttribute("cont", listaProductos.size());
                totalPagar = 0.0;
                item = 0;
                request.setAttribute("Carrito", listaProductos);
                for (int i = 0; i < listaProductos.size(); i++) {
                    totalPagar = totalPagar + listaProductos.get(i).getSubTotal();
                    listaProductos.get(i).setItem(item + i + 1);
                }
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
                break;

            case "Comprar":
                agregarCarrito(request);
                request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                break;

            case "AgregarCarrito":
                agregarCarrito(request);
                request.setAttribute("cont", listaProductos.size());
                request.getRequestDispatcher("Controlador?accion=Shop").forward(request, response);
                break;

            case "deleteProducto":
                idProducto = Integer.parseInt(request.getParameter("id"));
                System.out.println("delete producto id " + idProducto);
                if (listaProductos != null) {
                    for (int j = 0; j < listaProductos.size(); j++) {
                        if (listaProductos.get(j).getIdProducto() == idProducto) {
                            listaProductos.remove(j);
                        }
                    }
                }
                break;
            case "Nuevo":
                listaProductos = new ArrayList();
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;

            case "RealizarPago":
                montopagar = totalPagar;
                if (objCliente.getIdcliente() != 0 && montopagar > 0) {
                    cdao.Pagar(montopagar);
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                } else {
                    montopagar = 0;
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                }
                break;

            case "GenerarCompra":
                idpago = cdao.IdPago();

                if (objCliente.getIdcliente() != 0 && listaProductos.size() != 0 && montopagar > 0) {
                    if (totalPagar > 0.0) {
                        Compra co = new Compra();
                        co.setIdcliente(objCliente.getIdcliente());
                        co.setFechacompra(fechaSistem.FechaBD());
                        co.setMonto(totalPagar);
                        co.setIdpago(idpago);
                        co.setEstado("Cancelado - En Proceso de Envio");
                        cdao.guardarCompra(co);
                        montopagar = 0;

                        idcompra = cdao.IdCompra();
                        for (int i = 0; i < listaProductos.size(); i++) {
                            Detalle_compra dc = new Detalle_compra();
                            dc.setIdcompra(idcompra);
                            dc.setIdproducto(listaProductos.get(i).getIdProducto());
                            dc.setCantidad(listaProductos.get(i).getCantidad());
                            dc.setPrecio(listaProductos.get(i).getPrecioCompra());
                            cdao.guardarDetalleCompra(dc);
                        }
                        listaProductos = new ArrayList<>();
                        List compra = cdao.misCompras(objCliente.getIdcliente());
                        request.setAttribute("myCompras", compra);
                        request.getRequestDispatcher("miscompras.jsp").forward(request, response);

                    } else {
                        request.getRequestDispatcher("Controlador?accion=Shop").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                }
                break;

            case "MisCompras":
                if (objCliente.getIdcliente() != 0) {
                    List compra = cdao.misCompras(objCliente.getIdcliente());
                    request.setAttribute("myCompras", compra);
                    request.getRequestDispatcher("miscompras.jsp").forward(request, response);
                } else if (listaProductos.size() > 0) {
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                } else {
                    request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                }
                break;

            case "verDetalle":
                totalPagar = 0.0;
                int idcompras = Integer.parseInt(request.getParameter("idcompra"));
                List<Detalle_compra> detalle = cdao.Detalle(idcompras);
                request.setAttribute("myDetalle", detalle);
                for (int i = 0; i < detalle.size(); i++) {
                    totalPagar = totalPagar + (detalle.get(i).getPrecio() * detalle.get(i).getCantidad());
                }
                request.setAttribute("montoPagar", totalPagar);
                request.getRequestDispatcher("misdetallecompras.jsp").forward(request, response);
                break;

            case "Registrar":
                String nom = request.getParameter("txtnom");
                String dni = request.getParameter("txtdni");
                String em = request.getParameter("txtemail");
                String pas = request.getParameter("txtpass");
                String dir = request.getParameter("txtdire");
                objCliente.setNombres(nom);
                objCliente.setApellidos(dni);
                objCliente.setCorreo(em);
                objCliente.setPassword(pas);
                objCliente.setDireccion(dir);
                objClienteDAO.AgregarCliente(objCliente);
                request.getRequestDispatcher("Controlador?accion=carrito").forward(request, response);
                break;

            case "updateCantidad":
                idProducto = Integer.parseInt(request.getParameter("id"));
                int cant = Integer.parseInt(request.getParameter("cantidad"));
                for (int j = 0; j < listaProductos.size(); j++) {
                    if (listaProductos.get(j).getIdProducto() == idProducto) {
                        listaProductos.get(j).setCantidad(cant);
                        listaProductos.get(j).setSubTotal(listaProductos.get(j).getPrecioCompra() * cant);
                    }

                }

                break;

            case "Shop":
                request.setAttribute("cont", listaProductos.size());
                request.setAttribute("productosforshop", productos);
                request.setAttribute("categoriasforshop", categorias);
                request.getRequestDispatcher("shop.jsp").forward(request, response);


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
    }

    public void agregarCarrito(HttpServletRequest request) {
        cantidad = 1;
        int pos = 0;
        int idpp = Integer.parseInt(request.getParameter("id"));
        if (listaProductos.size() > 0) {
            for (int i = 0; i < listaProductos.size(); i++) {
                if (listaProductos.get(i).getIdProducto() == idpp) {
                    pos = i;
                }
            }
            if (idpp == listaProductos.get(pos).getIdProducto()) {
                cantidad = listaProductos.get(pos).getCantidad() + cantidad;
                subtotal = listaProductos.get(pos).getPrecioCompra() * cantidad;
                listaProductos.get(pos).setCantidad(cantidad);
                listaProductos.get(pos).setSubTotal(subtotal);
            } else {
                car = new Carrito();
                objPlatillo = objPlatilloDAO.ListarporId(idpp);
                car.setIdProducto(objPlatillo.getIdPlatillo());
                car.setNombres(objPlatillo.getNombre());
                car.setImagen(objPlatillo.getFoto());
                car.setDescripcion(objPlatillo.getDescripcion());
                car.setPrecioCompra(objPlatillo.getPrecio());
                car.setCantidad(cantidad);
                subtotal = cantidad * objPlatillo.getPrecio();
                car.setSubTotal(subtotal);
                listaProductos.add(car);
            }
        } else {
            car = new Carrito();
            objPlatillo = objPlatilloDAO.ListarporId(idpp);
            car.setIdProducto(objPlatillo.getIdPlatillo());
            car.setNombres(objPlatillo.getNombre());
            car.setImagen(objPlatillo.getFoto());
            car.setDescripcion(objPlatillo.getDescripcion());
            car.setPrecioCompra(objPlatillo.getPrecio());
            car.setCantidad(cantidad);
            subtotal = cantidad * objPlatillo.getPrecio();
            car.setSubTotal(subtotal);
            listaProductos.add(car);
        }
    }

}
