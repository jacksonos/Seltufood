<%-- 
    Document   : dashboardeditproductos
    Created on : 29 nov 2021, 15:17:10
    Author     : miche
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
                        <li class="pc-item active">
                            <a href="ServletDashboard?menu=Platillos&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="book"></i></span><span class="pc-mtext">Platillos</span></a>
                        </li>
                        <li class="pc-item">
                            <a href="ServletDashboard?menu=Clientes&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="users"></i></span><span class="pc-mtext">Clientes</span></a>
                        </li>
                        <li class="pc-item">
                            <a href="ServletDashboard?menu=Empleados&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="monitor"></i></span><span class="pc-mtext">Empleados</span></a>
                        </li>
                        <li class="pc-item">
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
                        <div class="row align-items-center">
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
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header">
                                <h5>Registrar categoría</h5>
                            </div>
                            <div class="card-body">

                                <!-- Button trigger modal (start)-->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <i class="material-icons-two-tone align-middle" data-feather="plus-circle"></i><label class="ml-2 align-middle">Nueva categoría</label>
                                </button>
                                <!-- Button trigger modal (end)-->

                                <!-- Modal (stard)-->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Agregar categoría</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">

                                                <% List<Categoria_platillo> listacat = new ArrayList<>();
                                                    listacat = (List) request.getAttribute("categ_platillo");
                                                %>

                                                <form action="ServletDashboard?menu=Platillos" method="post">
                                                    <div class="mb-3">

                                                        <label class="form-label">Categoría</label>
                                                        <select class="form-select" name="selectcategoriaag">
                                                            <%
                                                                for (int i = 0; i < listacat.size(); i++) {
                                                            %><option value="<%=listacat.get(i).getIdCategoria()%>"><%=listacat.get(i).getNombre()%><%
                                                                }
                                                                %>

                                                        </select>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Nombre</label>
                                                        <input name="txtnombreplatag" type="text" class="form-control" value="${platillosporid.getNombre()}">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="exampleInputEmail1" class="form-label">Descripción</label>
                                                        <textarea class="form-control" rows="3" name="descripcionplatag">
                                                        </textarea>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Precio</label><br>
                                                        <input name="precioplatag" type="text" min="1" class="form-control" value="${platillosporid.getPrecio()}">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Stock</label><br>
                                                        <input name="stockplatag" type="text" min="1" class="form-control" value="${platillosporid.getStock()}">
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Estado</label>
                                                        <select class="form-select" name="selectactivplatag">
                                                            <option value="1">Activo</option>
                                                            <option value="0">Inactivo</option>
                                                        </select>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label class="form-label">Imagen (preferible aspect ratio 16:9)</label><br>
                                                        <input name="txtimagenurlplatag" type="text" class="form-control" value="${platillosporid.getFoto()}">
                                                    </div>
                                                    <input type="submit" class="btn btn-primary" name="accionmenu" value="Agregar">
                                                    <input type="submit" class="btn btn-primary" name="accionmenu" value="Actualizar">
                                                </form>

                                            </div>
                                            <div class="modal-footer">

                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal (end)-->

                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h5>Lista de platillos</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Categoría</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Foto</th>
                                            <th>Descripción</th>
                                            <th scope="col">Precio</th>
                                            <th scope="col">Stock</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <%
                                            List<Platillo> listaplat = new ArrayList<>();
                                            listaplat = (List) request.getAttribute("listaplatillo");

                                            for (int i = 0; i < listaplat.size(); i++) {
                                        %>
                                        <tr>

                                            <th scope="row"><%=listaplat.get(i).getIdPlatillo()%></th>
                                            <td><%=listaplat.get(i).getCategoria_platillo().getNombre()%></td>
                                            <td><%=listaplat.get(i).getNombre()%></td>
                                            <td>
                                                <img src="<%=listaplat.get(i).getFoto()%>" style="height: 15vh" alt="alt"/>
                                            </td>
                                            <td><%=listaplat.get(i).getDescripcion()%></td>
                                            <td>$.<%=listaplat.get(i).getPrecio()%></td>
                                            <td><%=listaplat.get(i).getStock()%></td>
                                            <td>
                                                <%if (listaplat.get(i).getEstado() == 1) {

                                                %><button style="min-width: 100px" class="btn btn-success">Activo</button><%} else {
                                                %><button style="min-width: 100px" class="btn btn-danger">Inactivo</button><%
                                                    }%>

                                            </td>
                                            <td>
                                                <a title="Editar" href="ServletDashboard?menu=Platillos&accionmenu=Editar&id=<%=listaplat.get(i).getIdPlatillo()%>"><i data-feather="edit" class="mr-3" data-bs-toggle="modal" data-bs-target="#exampleModal2"></i></a>

                                                <% if (listaplat.get(i).getEstado() == 1) {

                                                %>
                                                <a title="Desactivar" href="ServletDashboard?menu=Platillos&accionmenu=CambiarEstado&id=<%=listaplat.get(i).getIdPlatillo()%>"><i data-feather="eye-off"  class="mr-3"></i></a>
                                                    <%

                                                    } else {
                                                    %>
                                                <a title="Activar" href="ServletDashboard?menu=Platillos&accionmenu=CambiarEstado&id=<%=listaplat.get(i).getIdPlatillo()%>"><i data-feather="eye" class="mr-3"></i></a>
                                                    <%
                                                        }
                                                    %>

                                                <a title="Eliminar" href="ServletDashboard?menu=Platillos&accionmenu=Delete&id=<%=listaplat.get(i).getIdPlatillo()%>"><i data-feather="trash"></i></a>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>   
                        </div>

                    </div>
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
