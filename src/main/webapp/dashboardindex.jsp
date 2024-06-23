<%-- 
    Document   : dashboardindex
    Created on : 29 nov 2021, 13:46:46
    Author     : miche
--%>
<%@page import="bendao.ClienteDAO"%>
<%@page import="bean.Cliente"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="bendao.CompraDAO"%>
<%@page import="bean.Compra"%>
<%@page import="bendao.PlatilloDAO"%>
<%@page import="bean.Platillo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="bean.Empleado"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    Empleado empleadologueado = (Empleado) session.getAttribute("empleadousuario");
    if (empleadologueado == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
    CompraDAO objCompraDAO = new CompraDAO();
    PlatilloDAO objPlatilloDAO = new PlatilloDAO();
    ClienteDAO objClienteDAO = new ClienteDAO();

    //Primer gráfico
    Gson gsonObj = new Gson();

    Map<Object, Object> map = null;

    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    List<Platillo> plats = new ArrayList<Platillo>();
    plats = objPlatilloDAO.ListarPlatillos();

    for (int i = 0; i < plats.size(); i++) {
        map = new HashMap<Object, Object>();
        map.put("label", plats.get(i).getNombre());
        map.put("y", plats.get(i).getStock());
        list.add(map);
    }

    String dataPoints = gsonObj.toJson(list);

    //Segundo gráfico
    Gson gsongrafico2 = new Gson();
    Map<Object, Object> mapgrafico2 = null;
    List<Map<Object, Object>> listgrafico2 = new ArrayList<Map<Object, Object>>();

    List<Compra> comprs = new ArrayList<Compra>();
    comprs = objCompraDAO.TotalCompraPorCliente();

    for (int i = 0; i < comprs.size(); i++) {
        mapgrafico2 = new HashMap<Object, Object>();
        mapgrafico2.put("label", comprs.get(i).getNombreCli());
        mapgrafico2.put("y", comprs.get(i).getMonto());
        listgrafico2.add(mapgrafico2);
    }

    String dataPointsgrafico2 = gsongrafico2.toJson(listgrafico2);

    //Tercer gráfico
    Gson gsongrafico3 = new Gson();
    Map<Object, Object> mapgrafico3 = null;
    List<Map<Object, Object>> listgrafico3 = new ArrayList<Map<Object, Object>>();
    List<Platillo> platsgrafico3 = new ArrayList<Platillo>();
    platsgrafico3 = objPlatilloDAO.PlatillosMasVentidos();

    for (int i = 0; i < platsgrafico3.size(); i++) {
        mapgrafico3 = new HashMap<Object, Object>();
        mapgrafico3.put("label", platsgrafico3.get(i).getNombre());
        mapgrafico3.put("y", platsgrafico3.get(i).getStock());
        listgrafico3.add(mapgrafico3);
    }
    String dataPointsgrafico3 = gsongrafico3.toJson(listgrafico3);

    //Cuarto gráfico
    Gson gsonObjgrafico4 = new Gson();
    Map<Object, Object> mapgrafico4 = null;
    List<Map<Object, Object>> listgrafico4 = new ArrayList<Map<Object, Object>>();

    List<Cliente> clientsgraf4 = new ArrayList<Cliente>();
    clientsgraf4 = objClienteDAO.ClientesPorGenero();
    
    for (int i = 0; i < clientsgraf4.size(); i++) {
        mapgrafico4 = new HashMap<Object, Object>();
        
        mapgrafico4.put("label", clientsgraf4.get(i).getGenero());
        mapgrafico4.put("y", clientsgraf4.get(i).getEstado());
        listgrafico4.add(mapgrafico4);
    }

    String dataPointsgrafico4 = gsonObjgrafico4.toJson(listgrafico4);

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Seltufood | Dashboard</title>
        <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 11]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
        <!-- Meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="Content-Type" content="IE=edge" />
        <meta name="description" content="DashboardKit is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
        <meta name="keywords" content="DashboardKit, Dashboard Kit, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Free Bootstrap Admin Template">
        <meta name="author" content="DashboardKit ">

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
        <link href="assets/css/extracsspopup.css" rel="stylesheet" type="text/css"/>

        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "dark1", // "light1", "dark1", "dark2"
                    exportEnabled: true,
                    animationEnabled: true,
                    title: {
                        text: "Stock de productos"
                    },
                    data: [{
                            type: "pie",
                            toolTipContent: "<b>{label}</b>: {y} uni.",
                            indexLabelFontSize: 16,
                            indexLabel: "{label} - {y}",
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();

                var chartgrafico2 = new CanvasJS.Chart("chartContainergrafico2", {
                    animationEnabled: true,
                    title: {
                        text: "Top 3 clientes"
                    },
                    axisY: {
                        suffix: "$",
                        includeZero: true
                    },
                    axisX: {
                        title: "Cantidad en compras"
                    },
                    data: [{
                            type: "column",
                            yValueFormatString: "##,##0.##\"$\"",
                            dataPoints: <%out.print(dataPointsgrafico2);%>
                        }]
                });
                chartgrafico2.render();

                var chartgrafico3 = new CanvasJS.Chart("chartContainergrafico3", {
                    animationEnabled: true,
                    theme: "light2",
                    title: {
                        text: "Top 5 productos más vendidos"
                    },
                    subtitles: [{
                            text: "en unidades"
                        }],
                    data: [{
                            type: "doughnut",
                            yValueFormatString: "#,##0",
                            indexLabel: "{label}: {y} uni.",
                            toolTipContent: "{y} uni. vend.",
                            dataPoints: <%out.print(dataPointsgrafico3);%>
                        }]
                });
                chartgrafico3.render();

                var chartgraf4 = new CanvasJS.Chart("chartContainergrafico4", {
                    animationEnabled: true,
                    theme: "light2",
                    title: {
                        text: "Cantidad de clientes por género"
                    },
                    subtitles: [{
                            text: "en usuarios"
                        }],
                    data: [{
                            type: "doughnut",
                            yValueFormatString: "#,##0",
                            indexLabel: "{label}: {y}",
                            toolTipContent: "{y} usuarios",
                            dataPoints: <%out.print(dataPointsgrafico4);%>
                        }]
                });
                chartgraf4.render();

            };

        </script>

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
                <img src="assets/images/logo.png" alt="" class="logo logo-lg">
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
                        <img src="assets/images/logo.png" alt="" style="width: 100%" class="logo logo-lg">
                        <img src="assets/images/logo-sm.svg" alt="" class="logo logo-sm">
                    </a>
                </div>
                <div class="navbar-content">

                    <ul class="pc-navbar">
                        <li class="pc-item pc-caption">
                            <label>Inicio</label>
                            <span>Gráficas estadísticas</span>
                        </li>
                        <li class="pc-item active">
                            <a href="index.html" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">home</i></span><span class="pc-mtext">Dashboard</span></a>
                        </li>

                        <li class="pc-item pc-caption">
                            <label>Mantenimiento</label>
                            <span>Agregar - Actualizar - Eliminar - Vigencia</span>
                        </li>
                        <li class="pc-item">
                            <a href="ServletDashboard?menu=CategoriaPlatillos&accionmenu=Listar" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="tag"></i></span><span class="pc-mtext">Categorías</span></a>
                        </li>
                        <li class="pc-item">
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

        <!-- [ Main Content ] start -->
        <div class="pc-container">
            <div class="pcoded-content">
                <!-- [ breadcrumb ] start -->
                <div class="page-header">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="page-header-title">
                                    <h5 class="m-b-10">Dashboard sale</h5>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item">Dashboard sale</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- [ breadcrumb ] end -->

                <!-- prueba JS  prueba JS prueba JS prueba JS prueba JS prueba JS prueba JS prueba JS prueba JS prueba JS prueba JS prueba JS-->
                <div class="row" style="margin-bottom: 25px">
                    <div id="chartContainer"  style="height: 370px; width: 100%;"></div>

                </div>

                <div class="row" style="margin-bottom: 25px">
                    <div id="chartContainergrafico2"  style="height: 370px; width: 100%;"></div>
                </div>

                <div class="row" style="margin-bottom: 25px">
                    <div id="chartContainergrafico3"  style="height: 370px; width: 100%;"></div>
                </div>

                <div class="row" style="margin-bottom: 25px">
                    <div id="chartContainergrafico4"  style="height: 370px; width: 100%;"></div>
                </div>

                <!-- [ Main Content ] start -->
                <div class="row">   

                    <!-- customer-section start -->

                    <div class="col-xl-6 col-md-12">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="card prod-p-card background-pattern">
                                    <div class="card-body">
                                        <div class="row align-items-center m-b-0">
                                            <div class="col">
                                                <h6 class="m-b-5">Clientes totales</h6>
                                                <h3 class="m-b-0">${cantclientes}</h3>
                                            </div>
                                            <div class="col-auto">
                                                <i class="material-icons-two-tone text-primary">card_giftcard</i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="card prod-p-card bg-primary background-pattern-white">
                                    <div class="card-body">
                                        <div class="row align-items-center m-b-0">
                                            <div class="col">
                                                <h6 class="m-b-5 text-white">Órdenes totales</h6>
                                                <h3 class="m-b-0 text-white">${cantordenes}</h3>
                                            </div>
                                            <div class="col-auto">
                                                <i class="material-icons-two-tone text-white">local_mall</i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="card prod-p-card bg-primary background-pattern-white">
                                    <div class="card-body">
                                        <div class="row align-items-center m-b-0">
                                            <div class="col">
                                                <h6 class="m-b-5 text-white">Monto de órdenes</h6>
                                                <h3 class="m-b-0 text-white">$.${montordenes}</h3>
                                            </div>
                                            <div class="col-auto">
                                                <i class="material-icons-two-tone text-white">monetization_on</i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="card prod-p-card background-pattern">
                                    <div class="card-body">
                                        <div class="row align-items-center m-b-0">
                                            <div class="col">
                                                <h6 class="m-b-5">Platillos vendidos</h6>
                                                <h3 class="m-b-0">${cantprodvendidos}</h3>
                                            </div>
                                            <div class="col-auto">
                                                <i class="material-icons-two-tone text-primary">local_offer</i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- customer-section end -->
                </div>
                <!-- [ Main Content ] end -->
            </div>
        </div>
        <!-- [ Main Content ] end -->

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

        <!-- Apex Chart -->
        <script src="assets/js/plugins/apexcharts.min.js"></script>

        <!-- custom-chart js -->
        <script src="assets/js/pages/dashboard-sale.js"></script>




        <!-- Extra scripts -->
        <script crossorigin="anonymous" integrity="sha384-xBuQ/xzmlsLoJpyjoggmTEz8OWUFM0/RC5BsqQBDX2v5cMvDHcMakNTNrHIW2I5f" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>    

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js" integrity="sha256-JG6hsuMjFnQ2spWq0UiaDRJBaarzhFbUxiUTxQDA9Lk=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js" integrity="sha256-XF29CBwU1MWLaGEnsELogU6Y6rcc5nCkhhx89nFMIDQ=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js" integrity="sha256-J2sc79NPV/osLcIpzL3K8uJyAD7T5gaEFKlLDM18oxY=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" integrity="sha256-CfcERD4Ov4+lKbWbYqXD6aFM9M51gN4GUEtDhkWABMo=" crossorigin="anonymous"></script>   
        <script src="jsfun/dashboardgraphics.js" type="text/javascript"></script>

        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>


    </body>

</html>
