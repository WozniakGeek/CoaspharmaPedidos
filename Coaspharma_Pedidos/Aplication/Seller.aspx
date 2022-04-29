<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Seller.aspx.cs" Inherits="Coaspharma_Pedidos.Aplication.Seller" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="page-header">
        <h3>!Bienvenido <%= Session["Name"]%>!</h3>
    </div>
    <br />
     <div class="panel panel-info" runat="server">
        <div class="panel-heading">
            <span class="" aria-hidden="true"></span>PEDIDO      
        </div>
        <div class="panel-body">
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <div class="row">
                <div class="col-md-12">

                   <div class="col-md-2">
                                <asp:LinkButton ID="btn_consultar" CssClass="btn btn-success form-control" runat="server" OnClick="DrugstoreShow">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    Ver Droguerias
                                </asp:LinkButton>
                            </div>
                                       
                </div>


            </div>
        </div>
    </div>


    <!--show panel drugstore-->
    <div class="panel panel-info" id="showDrugstore" runat="server" visible="false">
        <div class="panel-heading">
            <span class="" aria-hidden="true">DROGUERIAS</span>
        </div>


        <div class="panel-body">


            <div class="table-responsive">
                <asp:HiddenField ID="HiddenField2" runat="server" />
                <table id="dtBasicExample" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th class="th-sm">Codigo
                            </th>
                            <th class="th-sm">NIT
                            </th>
                            <th class="th-sm">Nombre
                            </th>
                            <th class="th-sm">Direccion
                            </th>
                            <%--<th class="th-sm">Telefono
                            </th>--%>
                            <th class="th-sm">Departamento
                            </th>
                            <th class="th-sm">Municipio
                            </th>
                            <th class="th-sm">Barrio
                            </th>
                            <%--<th class="th-sm">Ruta
                            </th>--%>
                            <th class="th-sm">Revista
                            </th>
                            <%--<th class="th-sm">Dia Revista
                            </th>--%>
                            <th class="th-sm">Zona
                            </th>
                            <th class="th-sm">Dia Revista
                            </th>
                            <th class="th-sm">Acciones
                            </th>



                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="tableValueSeller" runat="server">
                            <ItemTemplate>
                                <tr>                                
     
                                    <td><%#Eval("coddrog")%></td>
                                    <td><%#Eval("nitdrog")%></td>
                                    <td><%#Eval("nomdrog")%></td>
                                    <td><%#Eval("dirdrog")%></td>
                                    <%--<td><%#Eval("coddpto")%></td>--%>
                                    <td><%#Eval("dep_nomb")%></td>
                                    <%--<td><%#Eval("codmun")%></td>--%>
                                    <td><%#Eval("mun_nomb")%></td>
                                    <td><%#Eval("barrio")%></td>
                                    <td><%#Eval("revisita")%></td>
                                    <td><%#Eval("zona")%></td>
                                    <td><%#Eval("diarevis")%></td>
                                    <%--<td><%#Eval("tranfer")%></td>--%>
                                    <td>
                                        <asp:LinkButton ID="btntake_order" SkinID="add" runat="server" OnClick="takeorder" CssClass="btn btn-outline-secondary" CommandArgument='<%#Eval("coddrog")+","+ Eval("nomdrog")+","+ Eval("zona")%>'><i class="glyphicon glyphicon-eye-open"></i></asp:LinkButton>
                                    </td>


                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>
        </div>
    </div>

     <div class="panel panel-info" runat="server" id="pnl_Order" visible="false">
        <div class="panel-heading">
            <span class="" aria-hidden="true"></span>PEDIDO      
        </div>
        <div class="panel-body">
            <asp:HiddenField ID="HiddenField3" runat="server" />
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
                        <asp:TextBox ID="txt_NameDrugstore" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="apellido">Zona:</label>
                        <asp:TextBox ID="txt_zone" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                   
                </div>


            </div>
        </div>
    </div>


    <div class="panel panel-info" id="pnl_products" runat="server" visible="false">
         <div class="panel-heading">
            <span class="" aria-hidden="true"></span>PRODUCTOS      
        </div>


        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">

                    <div class="form-group col-md-3" aria-label="Button group with nested dropdown">
                        <label for="nombre">Linea</label>
                        <asp:DropDownList ID="ddl_Productline" runat="server" class="form-control"></asp:DropDownList>
                    </div>
                    <br />



                    <div class="form-group col-sm-2">
                        <asp:LinkButton ID="lbtnSearchP" SkinID="search" runat="server" OnClick="ProductsFilter" CssClass="btn btn-outline-secondary"><i class="glyphicon glyphicon-search"></i></asp:LinkButton>
                       
                    </div>
                </div>



            </div>


            <div class="table-responsive">
                <asp:HiddenField ID="HiddenField4" runat="server" />
                <table id="dtproducts" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
                        <asp:Repeater ID="tableValue" runat="server">
                            <ItemTemplate>
                                <tr>
                                     <td><%#Eval("codprod")%></td>
                                     <td><%#Eval("nomprod")%></td>
                                     <td><%#Eval("valprod")%></td>                                    
                                    <td>
                                        <div class="input-group">
                                            <input type="number" runat="server" min="1" value="1" class="input-qty form-control text-center" style="display: block;">
                                        </div>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btn_editar" SkinID="add" runat="server" CssClass="btn btn-outline-secondary"><i class="glyphicon glyphicon-shopping-cart"></i></asp:LinkButton>
                                    </td>
                                    <td></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        $(document).ready(function () {
            $('#dtBasicExample').DataTable();
            $('.dataTables_length').addClass('bs-select');
        });

        $(document).ready(function () {
            $('#dtproducts').DataTable();
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

