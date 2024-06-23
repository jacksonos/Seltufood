<%-- 
    Document   : about
    Created on : 29 nov 2021, 13:59:52
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
        <title>Seltufood | Nosotros</title>

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
                                    <li><a href="index.jsp">Inicio</a></li>
                                    <li class="current-list-item"><a href="about.jsp">Nosotros</a></li>
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

                                            <a class="shopping-cart" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
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
                            <p>Ofrecemos comida saludable y exquisita</p>
                            <h1>Sobre nosotros</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end breadcrumb section -->

        <!-- featured section -->
        <div class="feature-bg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="featured-text">
                            <h2 class="pb-3">¿Por qué <span class="orange-text">Seltufood?</span></h2>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 mb-4 mb-md-5">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-shipping-fast"></i>
                                        </div>
                                        <div class="content">
                                            <h3>Especializado en delivery</h3>
                                            <p>Todo lo hacemos por delivery, así que puedes estar relajado y pedir desde la tranquilidad de tu hogar.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 mb-5 mb-md-5">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-money-bill-alt"></i>
                                        </div>
                                        <div class="content">
                                            <h3>El mejor precio</h3>
                                            <p>Comer sano no debe ser equivalente a gastar colosalmente. Tenemos precios accesibles a tu disposición.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 mb-5 mb-md-5">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-seedling"></i>
                                        </div>
                                        <div class="content">
                                            <h3>Vegetariano</h3>
                                            <p>Todos los platos de comida son vegetarianos, y cada uno de ellos son ricos en nutrientes y proteínas.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="list-box d-flex">
                                        <div class="list-icon">
                                            <i class="fas fa-sync-alt"></i>
                                        </div>
                                        <div class="content">
                                            <h3>Reembolso rápido</h3>
                                            <p>Hacemos lo mejor para nuestro clientes, pero aún cuando no te parezca así, estaremos allí para ayudarte.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end featured section -->

        <!-- shop banner -->
        <section class="shop-banner">
            <div class="container">

                <h3>¡Comienza diciembre<br> con grandes <span class="orange-text">descuentos!</span></h3>
                <div class="sale-percent"><span>Ofertas <br> de hasta</span>50% <span>de descuento</span></div>
                <a href="shop.html" class="cart-btn btn-lg">Compra ahora</a>
            </div>
        </section>
        <!-- end shop banner -->

        <!-- team section -->
        <div class="mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 text-center">
                        <div class="section-title">
                            <h3>Nuestro <span class="orange-text">Equipo</span></h3>
                            <p>Sí, somos una empresa, pero eso no significa que olvidemos nuestros orígenes. Estos son los creadores y mentes maestras detrás de Seltufood.</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-1"></div>
                            <h4>César Palomino Urrunaga<span>Ing. Sistemas e informatica</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-3"></div>
                            <h4>Roger Luis Tupac Orellana <span>Ing. Sistemas e informatica</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-3"></div>
                            <h4>Michel Franklin Poma<span>Ing. Sistemas e informatica</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-1"></div>
                            <h4>Piero Manuel Ascona Salluca<span>Ing. Sistemas e informatica</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-team-item">
                            <div class="team-bg team-bg-2"></div>
                            <h4>Marry Doe <span>Farmer</span></h4>
                            <ul class="social-link-team">
                                <li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- end team section -->



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
                                <li><a href="shop.jsp">Tienda</a></li>
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
