<%-- 
    Document   : misdetallecompras
    Created on : 5 dic 2021, 10:57:57
    Author     : miche
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession sessionactual = request.getSession();
    if (session.getAttribute("clienteusuario") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Seltufood | Carrito</title>

        <!-- favicon -->
        <link rel="shortcut icon" type="image/png" href="assestsweb/img/favicon.png">
        <!-- google font -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
        <!-- fontawesome -->
        <link rel="stylesheet" href="assestsweb/css/all.min.css">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assestsweb/bootstrap/css/bootstrap.min.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="assestsweb/css/owl.carousel.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assestsweb/css/magnific-popup.css">
        <!-- animate css -->
        <link rel="stylesheet" href="assestsweb/css/animate.css">
        <!-- mean menu css -->
        <link rel="stylesheet" href="assestsweb/css/meanmenu.min.css">
        <!-- main style -->
        <link rel="stylesheet" href="assestsweb/css/main.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assestsweb/css/responsive.css">

    </head>
    <body>

        <!--PreLoader-->
        <div class="loader">
            <div class="loader-inner">
                <div class="circle"></div>
            </div>
        </div>
        <!--PreLoader Ends-->

        <!-- header -->
        <div class="top-header-area" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 text-center">
                        <div class="main-menu-wrap">
                            <!-- logo -->
                            <div class="site-logo">
                                <a href="index.html">
                                    <img src="assestsweb/img/logo.png" alt="">
                                </a>
                            </div>
                            <!-- logo -->

                            <!-- menu start -->
                            <nav class="main-menu">
                                <ul>
                                    <li class="current-list-item"><a href="#">Inicio</a></li>
                                    <li><a href="about.jsp">Nosotros</a></li>
                                    <li><a href="news.html">Novedades</a></li>
                                    <li><a href="contact.html">Contacto</a></li>
                                    <li><a href="Controlador?accion=Shop">Tienda</a></li>
                                        <%
                                            if (sessionactual.getAttribute("clienteusuario") != null) {
                                        %>
                                    <li><a href="#">${clienteusuario.getNombres()}</a>
                                        <ul class="sub-menu">
                                            <li><a href="#"><i class="fas fa-envelope mr-2"></i>${clienteusuario.getCorreo()}</a></li>
                                            <li><a href="#"><i class="fas fa-shopping-bag mr-2"></i>Mis compras</a></li>
                                            <li><a href="ServletUsuarioLogout"><i class="fas fa-sign-out-alt mr-2"></i>Cerrar sesión</a></li>
                                        </ul>
                                    </li>
                                    <%
                                        }
                                    %>


                                    <li>
                                        <div class="header-icons">

                                            <%
                                                if (sessionactual.getAttribute("clienteusuario") == null) {
                                            %><a class="shopping-cart" href="login.jsp"><i class="fas fa-user"></i></a><%
                                                }
                                                %>

                                            <a class="shopping-cart" href="Controlador?accion=carrito"><i class="fas fa-shopping-cart mr-2"></i>${cont}</a>
                                            <a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                            <div class="mobile-menu"></div>
                            <!-- menu end -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end header -->

        <!-- search area -->
        <div class="search-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <span class="close-btn"><i class="fas fa-window-close"></i></span>
                        <div class="search-bar">
                            <div class="search-bar-tablecell">
                                <h3>Search For:</h3>
                                <input type="text" placeholder="Keywords">
                                <button type="submit">Search <i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end search arewa -->

        <!-- breadcrumb-section -->
        <div class="breadcrumb-section breadcrumb-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="breadcrumb-text">
                            <p>Pedidos y adquisiciones</p>
                            <h1>Detalles de compra</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->


        <!--tabla start-->
        <div class="container mt-100 mb-100">
            <a href="Controlador?accion=MisCompras"><button class="btn btn-primary mb-3"><i class="fas fa-chevron-circle-left mr-1"></i>Regresar</button></a>
            <div class="row align-items-center">

                <div class="col-lg-12 col-md-12">

                    <div class="cart-table-wrap">

                        <div class="table-responsive-sm">

                            <table class="cart-table">

                                <thead class="cart-table-head">
                                    <tr class="table-head-row">
                                        <th class="product-image">Código de la compra</th>
                                        <th class="product-name">Artículo</th>
                                        <th class="product-name">Imagen</th>
                                        <th class="product-price">Cantidad</th>
                                        <th class="product-quantity">Precio compra</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <c:forEach var="mydet" items="${myDetalle}">

                                        <tr class="table-body-row">
                                            <td class="product-name" style="min-width: 150px">C00${mydet.getIdcompra()}</td>
                                            <td class="product-name" style="min-width: 150px">${mydet.platillo.nombre}</td>
                                            <td class="product-price" style="min-width: 25vh"><img class="img-fluid rounded" style="width: 25vh" src="${mydet.platillo.foto}" alt="alt"/></td>         
                                            <td class="product-name" style="min-width: 150px">${mydet.getCantidad()} uni.</td>
                                            <td class="product-name" style="min-width: 150px">$.${mydet.getPrecio()}</td>

                                        </tr>

                                    </c:forEach>

                                </tbody>


                            </table>
                        </div>
                    </div>
                    <div class="card-footer d-flex">
                        <label class="col-sm-9 text-right mt-1">Monto total</label>
                        <input type="text" class=" text-center form-control col-sm-2" readonly="" value="$.${montoPagar}0">
                    </div>
                </div>
            </div>
        </div>
        <!--tabla end-->



        <!-- footer -->
        <div class="footer-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box about-widget">
                            <h2 class="widget-title">Sobre nosotros</h2>
                            <p>Somos un restaurante vegetariano que se enfoca en la salud de sus clientes sin dejar de lado la exquisitez de la comida que consumen.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box get-in-touch">
                            <h2 class="widget-title">Ponerse en contacto</h2>
                            <ul>
                                <li>Jr. Invención 334, Breña 32502, Lima.</li>
                                <li>support@seltufood.com</li>
                                <li>+01 555 333</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box pages">
                            <h2 class="widget-title">Páginas</h2>
                            <ul>
                                <li><a href="index.jsp">Inicio</a></li>
                                <li><a href="about.jsp">Nosotros</a></li>
                                <li><a href="Controlador?accion=Shop">Tienda</a></li>
                                <li><a href="news.html">Noticias</a></li>
                                <li><a href="contact.html">Contacto</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-box subscribe">
                            <h2 class="widget-title">Suscríbete</h2>
                            <p>Suscríbete a nuestra newsletter para recibir nuestras últimas actualizaciones.</p>
                            <form action="index.jsp">
                                <input type="email" placeholder="Email">
                                <button type="submit"><i class="fas fa-paper-plane"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end footer -->

        <!-- copyright -->
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <p>Copyrights &copy; 2021 - <a href="#">Grupo 8 - Seltufood</a>,  Todos los derechos reservados.<br>
                        </p>
                    </div>
                    <div class="col-lg-6 text-right col-md-12">
                        <div class="social-icons">
                            <ul>
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-linkedin"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end copyright -->

        <!-- jquery -->
        <script src="assestsweb/js/jquery-1.11.3.min.js"></script>
        <!-- bootstrap -->
        <script src="assestsweb/bootstrap/js/bootstrap.min.js"></script>
        <!-- count down -->
        <script src="assestsweb/js/jquery.countdown.js"></script>
        <!-- isotope -->
        <script src="assestsweb/js/jquery.isotope-3.0.6.min.js"></script>
        <!-- waypoints -->
        <script src="assestsweb/js/waypoints.js"></script>
        <!-- owl carousel -->
        <script src="assestsweb/js/owl.carousel.min.js"></script>
        <!-- magnific popup -->
        <script src="assestsweb/js/jquery.magnific-popup.min.js"></script>
        <!-- mean menu -->
        <script src="assestsweb/js/jquery.meanmenu.min.js"></script>
        <!-- sticker js -->
        <script src="assestsweb/js/sticker.js"></script>
        <!-- main js -->
        <script src="assestsweb/js/main.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="jsfun/funciones.js" type="text/javascript"></script>
    </body>
</html>