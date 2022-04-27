<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Coaspharma_Pedidos.Aplication.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    </style>
    <div class="page-header">
        <h3>!Bienvenido <%= Session["Name"]%>!</h3>
    </div>
    <br />
    <%-- <div class="container my-4">--%>
    <div class="panel panel-info" runat="server">
        <div class="panel-heading">
            <span class="" aria-hidden="true"></span>PEDIDO      
        </div>
        <div class="panel-body">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <div class="row">
                <div class="col-md-12">

                    <div class="form-group col-md-3">
                        <label for="nombre">Deposito</label>
                        <asp:DropDownList ID="ddlDeposit" runat="server" class="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-md-3">
                        <div class="form-group">
                            <label for="nombre">Fecha</label>
                            <input type='text' class="form-control" placeholder="DD/MM/AAAA" id="datetimepicker1" />

                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <label for="apellido">Drogueria:</label>
                        <asp:TextBox ID="NombreDrogueria" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <%--  <div class="form-group col-md-3">
                        <label for="apellido">Apellido:</label>
                        <asp:TextBox ID="ApellidoModal" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="apellido">Departamento:</label>
                        <asp:DropDownList ID="ddlDepaModal" runat="server" class="form-control"></asp:DropDownList>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="apellido">Municipio:</label>
                        <asp:DropDownList ID="ddlMuniModal" runat="server" class="form-control"></asp:DropDownList>
                    </div>--%>
                </div>


            </div>
        </div>
    </div>


    <div class="panel panel-info" runat="server">
        <div class="panel-heading">
            <span class="" aria-hidden="true"></span>
        </div>


        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">

                    <div class="form-group col-md-2">

                        <asp:LinkButton ID="Insertar" runat="server" CssClass="btn btn-warning btn-block"><span class="glyphicon glyphicon-car" aria-hidden="true"></span>Ver pedido</asp:LinkButton>

                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <asp:HiddenField ID="HiddenField2" runat="server" />
                <table id="dtBasicExample" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="th-sm">Codigo
                            </th>
                            <th class="th-sm">Producto
                            </th>
                            <th class="th-sm">Valor
                            </th>
                            <th class="th-sm">Cantidad
                            </th>
                            <th class="th-sm">Acciones
                            </th>
                            <th class="th-sm">Total
                            </th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Tiger Nixon</td>
                            <td>System Architect</td>
                            <td>Edinburgh</td>
                            <td>
                                <div class="input-group">
                                    <input type="number" runat="server" value="1" class="input-qty form-control text-center" style="display: block;">
                                </div>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>

                    </tbody>
                </table>

            </div>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        $(document).ready(function () {
            $('#dtBasicExample').DataTable();
            $('.dataTables_length').addClass('bs-select');
        });

        $(function () {
            $('#datetimepicker1').datetimepicker(
                {
                    format: 'DD/MM/YYYY'
                });
        });
    </script>
</asp:Content>
