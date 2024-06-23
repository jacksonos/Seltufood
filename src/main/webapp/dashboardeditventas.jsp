<%-- 
    Document   : dashboarddeditventas
    Created on : 6 dic. 2021, 17:59:36
    Author     : cesa1
--%>

<%@page import="bean.Categoria_platillo"%>
<%@page import="bean.Platillo"%>
<%@page import="bean.Empleado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    Empleado empleadologueado = (Empleado) session.getAttribute("empleadousuario");
    if (empleadologueado == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <title>DashboardKit Bootstrap 5 Admin Template</title>
        <style>
            @media print{
                .parte01, .btn, .accion{
                   display: none;    
                }
                
                
            }
        </style>

        <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 11]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="DashboardKit is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
        <meta name="keywords" content="DashboardKit, Dashboard Kit, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Free Bootstrap Admin Template">
        <meta name="author" content="DashboardKit ">

        <!--Bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <!-- Favicon icon -->
        <link rel="icon" href="assets/images/favicon.svg" type="image/x-icon">

        <!-- font css -->
        <link rel="stylesheet" href="assets/fonts/feather.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome.css">
        <link rel="stylesheet" href="assets/fonts/material.css">

        <!-- vendor css -->
        <link rel="stylesheet" href="assets/css/style.css" id="main-style-link">
    </head>

    <body class="">
        <!-- [ Pre-loader ] start -->
        <div class="loader-bg">
            <div class="loader-track">
                <div class="loader-fill"></div>
            </div>
        </div>
        <!-- [ Pre-loader ] End -->
        <!-- [ Mobile header ] start -->
        <div class="pc-mob-header pc-header">
            <div class="pcm-logo">
                <img src="assets/images/logo.svg" alt="" class="logo logo-lg">
            </div>
            <div class="pcm-toolbar">
                <a href="#!" class="pc-head-link" id="mobile-collapse">
                    <div class="hamburger hamburger--arrowturn">
                        <div class="hamburger-box">
                            <div class="hamburger-inner"></div>
                        </div>
                    </div>
                </a>
                <a href="#!" class="pc-head-link" id="headerdrp-collapse">
                    <i data-feather="align-right"></i>
                </a>
                <a href="#!" class="pc-head-link" id="header-collapse">
                    <i data-feather="more-vertical"></i>
                </a>
            </div>
        </div>
        <!-- [ Mobile header ] End -->

        <!-- [ navigation menu ] start -->
        <nav class="pc-sidebar ">
            <div class="navbar-wrapper">
                <div class="m-header">
                    <a href="index.html" class="b-brand">
                        <!-- ========   change your logo hear   ============ -->
                        <img src="assets/images/logo.svg" alt="" class="logo logo-lg">
                        <img src="assets/images/logo-sm.svg" alt="" class="logo logo-sm">
                    </a>
                </div>
                <div class="navbar-content">
                    <ul class="pc-navbar">
                        <li class="pc-item pc-caption">
                            <label>Inicio</label>
                            <span>Gráficas estadísticas</span>
                        </li>
                        <li class="pc-item">
                            <a href="ServletDashboard?menu=Dashboard" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">home</i></span><span class="pc-mtext">Dashboard</span></a>
                        </li>

                        <li class="pc-item pc-caption">
                            <label>Mantenimiento</label>
                            <span>Agregar - Actualizar - Eliminar - Vigencia</span>
                        </li>
                        <li class="pc-item ">
                            <a href="ServletDashboard?menu=CategoriaPlatillos&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="tag"></i></span><span class="pc-mtext ">Categorías</span></a>
                        </li>
                        <li class="pc-item ">
                            <a href="ServletDashboard?menu=Platillos&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="book"></i></span><span class="pc-mtext">Platillos</span></a>
                        </li>
                        <li class="pc-item">
                            <a href="ServletDashboard?menu=Clientes&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="users"></i></span><span class="pc-mtext">Clientes</span></a>
                        </li>
                        <li class="pc-item">
                            <a href="ServletDashboard?menu=Empleados&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="monitor"></i></span><span class="pc-mtext">Empleados</span></a>
                        </li>
                        <li class="pc-item active">
                            <a href="ServletDashboard?menu=NuevaVenta&accionmenu=default" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="shopping-bag"></i></span><span class="pc-mtext">Ventas</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- [ navigation menu ] end -->

        <!-- [ Header ] start -->
        <header class="pc-header ">
            <div class="header-wrapper">
                <div class="mr-auto pc-mob-drp">
                    <ul class="list-unstyled">
                        <li class="dropdown pc-h-item">

                            <div class="dropdown-menu pc-h-dropdown">
                                <a href="#!" class="dropdown-item">
                                    <i class="material-icons-two-tone">account_circle</i>
                                    <span>My Account</span>
                                </a>
                                <div class="pc-level-menu">
                                    <a href="#!" class="dropdown-item">
                                        <i class="material-icons-two-tone">list_alt</i>
                                        <span class="float-right"><i data-feather="chevron-right" class="mr-0"></i></span>
                                        <span>Level2.1</span>
                                    </a>
                                    <div class="dropdown-menu pc-h-dropdown">
                                        <a href="#!" class="dropdown-item">
                                            <i class="fas fa-circle"></i>
                                            <span>My Account</span>
                                        </a>
                                        <a href="#!" class="dropdown-item">
                                            <i class="fas fa-circle"></i>
                                            <span>Settings</span>
                                        </a>
                                        <a href="#!" class="dropdown-item">
                                            <i class="fas fa-circle"></i>
                                            <span>Support</span>
                                        </a>
                                        <a href="#!" class="dropdown-item">
                                            <i class="fas fa-circle"></i>
                                            <span>Lock Screen</span>
                                        </a>
                                        <a href="#!" class="dropdown-item">
                                            <i class="fas fa-circle"></i>
                                            <span>Logout</span>
                                        </a>
                                    </div>
                                </div>
                                <a href="#!" class="dropdown-item">
                                    <i class="material-icons-two-tone">settings</i>
                                    <span>Settings</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="material-icons-two-tone">support</i>
                                    <span>Support</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="material-icons-two-tone">https</i>
                                    <span>Lock Screen</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="material-icons-two-tone">chrome_reader_mode</i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="ml-auto">
                    <ul class="list-unstyled">
                        <li class="dropdown pc-h-item">
                            <a class="pc-head-link dropdown-toggle arrow-none mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="material-icons-two-tone">search</i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right pc-h-dropdown drp-search">
                                <form class="px-3">
                                    <div class="form-group mb-0 d-flex align-items-center">
                                        <i data-feather="search"></i>
                                        <input type="search" class="form-control border-0 shadow-none" placeholder="Search here. . .">
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li class="dropdown pc-h-item mt-1 mb-1">
                            <a class="pc-head-link dropdown-toggle arrow-none mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <img src="assets/images/user/avatar-2.jpg" alt="user-image" class="user-avtar">
                                <span>
                                    <span class="user-name"><%=empleadologueado.getNombre()%> <%=empleadologueado.getApellido()%></span>
                                    <span class="user-desc mb-1"><%=empleadologueado.getTipo_empleado().getNombre()%></span>
                                    <span class="user-desc"><%=empleadologueado.getCorreo()%></span>
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right pc-h-dropdown">

                                <a href="ServletUsuarioLogout" class="dropdown-item">
                                    <i class="material-icons-two-tone">chrome_reader_mode</i>
                                    <span>Cerrar sesión</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </header>
        <!-- [ Header ] end -->


        <div class="pc-container">
            <div class="pcoded-content">
                <!-- [ breadcrumb ] start -->
                <div class="page-header">
                    <div class="page-block">
                        <div class="row align-items-center parte01">
                            <div class="col-md-12">
                                <div class="page-header-title">
                                    <h5 class="m-b-10">Categorías</h5>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="dashboardindex.jsp">Dashboard</a></li>
                                    <li class="breadcrumb-item">Mantenimiento</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- [ breadcrumb ] end -->

                <!-- [ Main Content ] start -->
                <div class="row">
                    <!-- [ sample-page ] start -->
                     <div class="d-flex parte01">
            <div class="col-sm-5 parte01">
                <div class="card">
                    <form action="ServletDashboard?menu=NuevaVenta" method="post">
                        <div class="card-body">
                            <div class="form-group">
                                <label>Datos del Cliente</label>
                            </div>
                            <br>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="codigoCliente" value="${c.getNombres()}" class="form-control" placeholder="Nombre">
                                    <input type="submit" name="accionmenu" value="BuscarCliente" class="btn btn-outline-info">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="nombreCliente" readonly value="${c.getNombres()}" placeholder="Datos Cliente" class="form-control">
                                </div>

                            </div>
                            <br>
                            <div class="form-group d-flex">
                                <label>Datos Productos</label>
                            </div>
                            <br>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="codproducto" value="${producto.getNombre()}"   class="form-control" placeholder="Nombre">
                                    <button type="submit" name="accionmenu" value="BuscarProducto" class="btn btn-outline-info">Buscar</button>
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="nombreproducto" readonly value="${producto.getNombre()}"  placeholder="Datos Producto" class="form-control">
                                </div>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="precio" readonly value="${producto.getPrecio()}" class="form-control" placeholder="S/.0.00">
                                </div>
                                <div class="col-sm-3">
                                    <input type="number" value="1" name="cant" placeholder="" class="form-control">
                                </div>
                                <div class="col-sm-3">
                                    <input type="text" name="stock" readonly value="${producto.getStock()}"  placeholder="Stock" class="form-control">
                                </div>
                            </div>
                            <br>
                            <div class="form-group d-flex">
                                <button type="submit" value="Agregar" name="accionmenu" class="btn btn-outline-info">Agregar Producto</button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex col-sm-3 mr-auto">
                            <label>NúmeroSerie: </label>
                            <input type="text" name="NroSerie" readonly value="${nserie}" class="form-control col-md-1 offset-md-1">
                        </div>
                        <br>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Nro</th>
                                    <th class="parte01">Código</th>
                                    <th>Descripción</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>SubTotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${lista}">
                                    <tr>                                  
                                        <td>${list.getItem()}</td>
                                        <td class="parte01">${list.getIdproducto()}</td>
                                        <td>${list.getDescripcionP()}</td>
                                        <td>${list.getPrecio()}</td>
                                        <td>${list.getCantidad()}</td>
                                        <td>${list.getSubtotal()}</td> 
                                        <td class="d-flex">

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex">
                        <div class="col-sm-6 parte01">
                            <a href="ServletDashboard?menu=NuevaVenta&accionmenu=GenerarVenta" onclick="print()" class="btn btn-success" >Generar Venta</a>                           
                            <a href="ServletDashboard?menu=NuevaVenta&accionmenu=default" type="submit" name="accionmenu"class="btn btn-danger">Cancelar</a>
                            <a href="ServletDashboard?menu=NuevaVenta&accionmenu=Reporte" type="submit" name="accionmenu"class="btn btn-danger">Generar reporte</a>
                        </div>
                        <div class="col-sm-6 ml-auto d-flex">
                            <label class="col-sm-6 text-right mt-2">Total a Pagar: &nbsp;&nbsp;</label>
                            <input type="text" name="txtTotal" readonly value="S/. ${totalpagar}" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <script type="text/javascript">
                function deleteRow(btn) {
                    var row = btn.parentNode.parentNode;
                    row.parentNode.removeChild(row);
                }
            </script>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
                </div>
                <!-- [ sample-page ] end -->
            </div>
            <!-- [ Main Content ] end -->
        </div>



        <!-- Warning Section start -->
        <!-- Older IE warning message -->
        <!--[if lt IE 11]>
            <div class="ie-warning">
                <h1>Warning!!</h1>
                <p>You are using an outdated version of Internet Explorer, please upgrade
                   <br/>to any of the following web browsers to access this website.
                </p>
                <div class="iew-container">
                    <ul class="iew-download">
                        <li>
                            <a href="http://www.google.com/chrome/">
                                <img src="assets/images/browser/chrome.png" alt="Chrome">
                                <div>Chrome</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.mozilla.org/en-US/firefox/new/">
                                <img src="assets/images/browser/firefox.png" alt="Firefox">
                                <div>Firefox</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://www.opera.com">
                                <img src="assets/images/browser/opera.png" alt="Opera">
                                <div>Opera</div>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.apple.com/safari/">
                                <img src="assets/images/browser/safari.png" alt="Safari">
                                <div>Safari</div>
                            </a>
                        </li>
                        <li>
                            <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                                <img src="assets/images/browser/ie.png" alt="">
                                <div>IE (11 & above)</div>
                            </a>
                        </li>
                    </ul>
                </div>
                <p>Sorry for the inconvenience!</p>
            </div>
        <![endif]-->
        <!-- Warning Section Ends -->
        <!-- Required Js -->
        <script src="assets/js/vendor-all.min.js"></script>
        <script src="assets/js/plugins/bootstrap.min.js"></script>
        <script src="assets/js/plugins/feather.min.js"></script>
        <script src="assets/js/pcoded.min.js"></script>
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script> -->
        <!-- <script src="assets/js/plugins/clipboard.min.js"></script> -->
        <!-- <script src="assets/js/uikit.min.js"></script> -->

    </body>

</html>

