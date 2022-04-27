<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Coaspharma_Pedidos.Aplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="ruben gaona" />
    <title>coaspharma</title>
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet" />
    <script src="/Scripts/SweetAlert.js"></script>
</head>
<body class="bg-gradient-primary">

    <div class="container">
        <form runat="server" class="user">
            <asp:ScriptManager runat="server" EnablePageMethods="True">
            </asp:ScriptManager>
            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image">
                                    <img class="w-100" src="../../../img/Login.PNG" />

                                </div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <img class="w-75" src="" />
                                            <h1 class="h4 text-gray-900 mb-4 mt-3">¡Bienvenido a coaspharma pedidos!</h1>
                                            <h6 class="text-gray-900 mb-4">Recuerda tener tus datos actualizados</h6>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox type="text" class="form-control form-control-user" ID="user" placeholder="usuario" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox type="password" class="form-control form-control-user" ID="password" aria-describedby="emailHelp" placeholder="contraseña " runat="server"></asp:TextBox>
                                        </div>
                                        <%--<div class="form-group">
                            <asp:TextBox type="password" class="form-control form-control-user" ID="tb_Pass" placeholder="Contraseña" runat="server"></asp:TextBox>
                        </div>--%>
                                        <asp:LinkButton class="btn btn-primary btn-user btn-block" ID="btn_login" runat="server" OnClick="LoginUsuario">Ingresar</asp:LinkButton>
                                        <hr />
                                        <div class="text-center small">
                                            Un producto creado por el área de Desarrollo para <a href="https://coaspharma.com.co/" target="_blank">Coaspharma </a><i class="fa fa-heart"></i>&nbsp;&nbsp;&nbsp;
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </form>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <%--<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

    <!-- Core plugin JavaScript-->
    <%--<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>--%>

    <!-- Custom scripts for all pages-->
    <%--<script src="/js/sb-admin-2.min.js"></script>--%>


</body>
</html>
