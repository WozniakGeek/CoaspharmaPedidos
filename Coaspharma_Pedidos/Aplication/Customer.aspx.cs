using Coaspharma_Pedidos.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coaspharma_Pedidos.Aplication
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddeposit();
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
    }
}