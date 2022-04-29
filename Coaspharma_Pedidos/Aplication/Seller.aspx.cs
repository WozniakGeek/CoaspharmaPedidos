using Coaspharma_Pedidos.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coaspharma_Pedidos.Aplication
{
    public partial class Seller : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDrugstore();

            }

        }

        protected void loadDrugstore()
        {
            var conexion = new RequestSQL();
            try
            {
                var ListDrugStore = conexion.GetDrugStore();
                if (ListDrugStore.Count > 0)
                {
                    tableValueSeller.DataSource = ListDrugStore.ToList();
                }
                tableValueSeller.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void DrugstoreShow(object sender, EventArgs e)
        {
            try
            {
                showDrugstore.Visible = true;
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        protected void loaddeposit()
        {
            var conexion = new RequestSQL();
            try
            {
                var Deposit = conexion.Querydeposit();
                var ProductLine = conexion.QueryProductLine();

                if (Deposit.Count > 0)
                {
                    foreach (var item in Deposit)
                    {
                        ddlDeposit.Items.Add(new ListItem(item.nomprove.ToString(), item.codprove));
                    }

                }
                if (ProductLine.Count > 0)
                {
                    foreach (var item in ProductLine)
                    {
                        ddl_Productline.Items.Add(new ListItem(item.nomlinea.ToString(), item.codlinea));
                    }

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ProductsFilter(object sender, EventArgs e)
        {


            var conexion = new RequestSQL();
            var selectLine = ddl_Productline.SelectedValue;
            try
            {
                var ListProducts = conexion.QueryProduct(selectLine);
                if (ListProducts.Count > 0)
                {
                    tableValue.DataSource = ListProducts.ToList();
                }
                tableValue.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }

        }



        protected void takeorder(object sender, EventArgs e)
        {

            try
            {
                string idDrugstore = "";
                string NameDrugstore = "";
                string Zone = "";
                string[] parametros = ((LinkButton)sender).CommandArgument.Split(',');
                if (!String.IsNullOrEmpty(parametros[0]))
                {
                    idDrugstore = parametros[0];
                    NameDrugstore = parametros[1];
                    Zone = parametros[2];
                }
                showDrugstore.Visible = false;
                pnl_Order.Visible = true;
                loaddeposit();
                txt_NameDrugstore.Text = idDrugstore + " - " + NameDrugstore;
                txt_zone.Text = Zone;
                pnl_products.Visible = true;
            }
            catch (Exception ex)
            {
                throw;
            }

        }


    }
}