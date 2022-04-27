using coaspharma.Dal.Model;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Coaspharma_Pedidos.BLL
{
    public class RequestSQL
    {
        NpgsqlConnection con = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["BDLocal"].ToString());
        public void conectar()
        {
            con.Open();
        }

        public void Desconectar()
        {
            con.Close();
        }

        public string QueryLogin(string user, string pss)
        {
            try
            {
                conectar();
                var query = "select * from simaeusu where usuario = '" + user + "' and clave = '" + pss + "'";
                NpgsqlCommand conexion = new NpgsqlCommand(query, con);
                NpgsqlDataReader data = conexion.ExecuteReader();
                var Name = "";
                //data.Fill(table);
                while (data.Read())
                {
                    Name = data[1].ToString();

                }
                Desconectar();
                return Name;

            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public List<vimaepro> Querydeposit()
        {
            var vimaeproData = new List<vimaepro>();
            try
            {
                conectar();
                var query = "select * from vimaepro";
                var conexion = new NpgsqlCommand(query, con);
                var data = conexion.ExecuteReader();
                while (data.Read())
                {
                

                    vimaeproData.Add(new vimaepro
                    {
                        codprove = data[0].ToString(),
                        nomprove = data[1].ToString(),

                    });

                }
                Desconectar();
                return vimaeproData;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}