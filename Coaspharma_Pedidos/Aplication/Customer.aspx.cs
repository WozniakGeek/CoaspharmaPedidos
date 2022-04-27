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
               var deposit = conexion.Querydeposit();

                if (deposit.Count > 0)
                {
                    foreach (var item in deposit)
                    {
                        ddlDeposit.Items.Add(new ListItem(item.nomprove.ToString(),item.codprove ));
                    }
                    
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}