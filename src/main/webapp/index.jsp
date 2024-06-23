<%-- 
    Document   : index
    Created on : 29 nov 2021, 13:51:26
    Author     : miche
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    HttpSession sessionactual = request.getSession();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

        <!-- title -->
        <title>Seltufood</title>

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
                                <a href="index.jsp">
                                    <img src="assestsweb/img/logo.png" alt="">
                                </a>
                            </div>
                            <!-- logo -->

                            <!-- menu start -->
                            <nav class="main-menu">
                                <ul>
                                    <li class="current-list-item"><a href="#">Inicio</a></li>
                                    <li><a href="about.jsp">Nosotros</a></li>
                                    <li><a href="#">Novedades</a></li>
                                    <li><a href="#">Contacto</a></li>
                                    <li><a href="Controlador?accion=Shop">Tienda</a></li>
                                        <%
                                            if (sessionactual.getAttribute("clienteusuario") != null) {
                                        %>
                                    <li><a href="#">${clienteusuario.getNombres()}</a>
                                        <ul class="sub-menu">
                                            <li><a href="#"><i class="fas fa-envelope mr-2"></i>${clienteusuario.getCorreo()}</a></li>
                                            <li><a href="Controlador?accion=MisCompras  "><i class="fas fa-shopping-bag mr-2"></i>Mis compras</a></li>
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
        <!-- end search area -->

        <!-- hero area -->
        <div class="hero-area hero-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 offset-lg-2 text-center">
                        <div class="hero-text">
                            <div class="hero-text-tablecell">
                                <p class="subtitle">VEGETARIANO Y EXQUISITO</p>
                                <h1>La comida que te hará sentir bien</h1>
                                <div class="hero-btns">
                                    <a href="Controlador?accion=Shop" class="boxed-btn">Platos del menu</a>
                                    <a href="#" class="bordered-btn">Contáctanos</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end hero area -->

        <!-- features list section -->
        <div class="list-section pt-80 pb-80">
            <div class="container">

                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-shipping-fast"></i>
                            </div>
                            <div class="content">
                                <h3>Envio gratis</h3>
                                <p>En compras superiores a $75</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                        <div class="list-box d-flex align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-phone-volume"></i>
                            </div>
                            <div class="content">
                                <h3>Soporte 24/7</h3>
                                <p>Obtén soporte todo el día</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="list-box d-flex justify-content-start align-items-center">
                            <div class="list-icon">
                                <i class="fas fa-sync"></i>
                            </div>
                            <div class="content">
                                <h3>Reembolso</h3>
                                <p>Si no te gusta lo que recibiste, lo devuelves</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- end features list section -->

        <!-- advertisement section -->
        <div class="abt-section mb-150 mt-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="abt-bg">
                            <a href="https://www.youtube.com/watch?v=DBLlFWYcIGQ" class="video-play-btn popup-youtube"><i class="fas fa-play"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="abt-text">
                            <p class="top-sub">Desde este 2021</p>
                            <h2>Nosotros somos <span class="orange-text">Seltufood</span></h2>
                            <p>Somos un restaurante vegetariano enfocado en la salud de nuestros clientes y cómo ello se relaciona con lo que comen.</p>
                            <p>Sin embargo, tal actitud no significa de que nuestros platillos carecen de sabor y exquisitez, es todo lo contrario.</p>
                            <p>Creémos que puedes comer saludable sin dejar de lado el sabor de lo que consumes.</p>
                            <a href="about.jsp" class="boxed-btn mt-4">Conoce más</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end advertisement section -->

        <!-- shop banner -->
        <section class="shop-banner mb-100">
            <div class="container">
                <h3>¡Comienza diciembre<br> con grandes <span class="orange-text">descuentos!</span></h3>
                <div class="sale-percent"><span>Ofertas <br> de hasta </span>50% <span>de descuento</span></div>
                <a href="shop.html" class="cart-btn btn-lg">Comprar ahora</a>
            </div>
        </section>
        <!-- end shop banner -->


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

    </body>
</html>
