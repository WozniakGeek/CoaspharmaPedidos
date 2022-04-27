using Coaspharma_Pedidos.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Coaspharma_Pedidos.Aplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginUsuario(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(user.Text) && !string.IsNullOrEmpty(password.Text))
                {
                    var conexion = new RequestSQL();
                    var userLogin = conexion.QueryLogin(user.Text, password.Text);
                    if (!string.IsNullOrEmpty(userLogin))
                    {
                        Session["Name"] = userLogin;
                        Response.Redirect("~/Aplication/Customer.aspx", false);

                    }
                    else
                    {
                        string mensaje = "swal.fire('Alerta','Usuario no se encuentra registrado','warning');";
                        ClientScript.RegisterStartupScript(GetType(), "Message", mensaje, true);
                    }
                }
                else
                {

                    if (string.IsNullOrEmpty(user.Text))
                    {
                        string mensaje = "swal.fire('Alerta','Debe de escribir un nombre de Usuario.','warning');";
                        ClientScript.RegisterStartupScript(GetType(), "Message", mensaje, true);
                    }
                    if (string.IsNullOrEmpty(password.Text))
                    {
                        string mensaje = "swal.fire('Alerta','Debe de escribir una Contraseña.','warning');";
                        ClientScript.RegisterStartupScript(GetType(), "Message", mensaje, true);
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}