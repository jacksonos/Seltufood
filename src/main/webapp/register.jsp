
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


        <!-- Favicon icon -->
        <link rel="icon" href="assets/images/favicon.svg" type="image/x-icon">

        <!-- font css -->
        <link rel="stylesheet" href="assets/fonts/feather.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome.css">
        <link rel="stylesheet" href="assets/fonts/material.css">

        <!-- vendor css -->
        <link rel="stylesheet" href="assets/css/style.css" id="main-style-link">


    </head>

    <!-- [ auth-signup ] start -->
    <div class="auth-wrapper" style="background-color: #F28123">

        <div class="auth-content">
            <a href="index.jsp"><button class="btn btn-primary btn-block mb-3" style="background-color: #fff; border-color: #fff; color: #F28123"><i class="mr-2" data-feather="arrow-left"></i>Regresar</button></a>
            <div class="card">
                <div class="row align-items-center text-center">
                    <div class="col-md-12">
                        <div class="card-body">
                            <img src="assets/images/logo.png" style="width: 85%" alt="" class="img-fluid mb-4">
                            <h4 class="mb-3 f-w-400">Sign up</h4>
                            <form action="ServletUsuario" method="POST">
                                <div class="input-group mb-3">
                                    <span class="input-group-text"><i data-feather="user"></i></span>
                                    <input type="text" name="txtnombre" class="form-control" placeholder="Nombres" required>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text"><i data-feather="user"></i></span>
                                    <input type="text" name="txtapellido" class="form-control" placeholder="Apellido" required>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text"><i data-feather="mail" required></i></span>
                                    <select class="form-select" name="txtgenero">
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                                <div class="input-group mb-4">
                                    <span class="input-group-text"><i data-feather="lock"></i></span>
                                    <input type="text" class="form-control" placeholder="Direccion" name="txtdirec" required>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text"><i data-feather="mail"></i></span>
                                    <input type="email" class="form-control" placeholder="Correo electrónico" name="txtcorreo" required>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text"><i data-feather="lock"></i></span>
                                    <input type="password" class="form-control" placeholder="Contraseña" name="txtpass" required>
                                </div>
                                <div class="input-group mb-4">
                                    <span class="input-group-text"><i data-feather="lock"></i></span>
                                    <input type="password" class="form-control" placeholder="Repetir contraseña" name="txtpassrep" required>
                                </div>
                                <%
                                        if (request.getAttribute("msgelogin") != null) {
                                    %>
                                    <div class="alert alert-primary" role="alert">
                                        ${msgelogin}
                                    </div>
                                    <%
                                        }
                                    %>
                                <input type="submit" name="accion" value="Registrar" class="btn btn-primary">
                            </form>
                            <p class="mb-2">Already have an account? <a href="login.jsp" class="f-w-400">Signin</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [ auth-signup ] end -->

    <!-- Required Js -->
    <script src="assets/js/vendor-all.min.js"></script>
    <script src="assets/js/plugins/bootstrap.min.js"></script>
    <script src="assets/js/plugins/feather.min.js"></script>
    <script src="assets/js/pcoded.min.js"></script>

</body>

</html>

