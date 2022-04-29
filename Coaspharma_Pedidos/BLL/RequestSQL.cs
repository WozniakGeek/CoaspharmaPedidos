using coaspharma.Dal.Model;
using Newtonsoft.Json;
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

        public List<vimaeproModel> Querydeposit()
        {
            var vimaeproData = new List<vimaeproModel>();
            try
            {
                conectar();
                var query = "select * from vimaepro";
                var conexion = new NpgsqlCommand(query, con);
                var data = conexion.ExecuteReader();
                while (data.Read())
                {


                    vimaeproData.Add(new vimaeproModel
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


        public List<vemaelinModel> QueryProductLine()
        {
            var vemaelinData = new List<vemaelinModel>();
            try
            {
                conectar();
                var query = "select codlinea,nomlinea from vemaelin where codlinea in(1, 3, 7, 11, 12, 13)";
                var conexion = new NpgsqlCommand(query, con);
                var data = conexion.ExecuteReader();
                while (data.Read())
                {


                    vemaelinData.Add(new vemaelinModel
                    {
                        codlinea = data[0].ToString(),
                        nomlinea = data[1].ToString(),

                    });

                }
                Desconectar();
                return vemaelinData;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<ProductsModel> QueryProduct(string productLine)
        {
            try
            {

                var ProductsData = new List<ProductsModel>();

                conectar();

                var query = "select i.codprod,nomprod,v.valprod from  inmaepro i inner JOIN vimaepre v on i.codprod = v.codprod where i.codlinea = '" + productLine + "' and v.usuario='admsiste'and v.estado='1' ";
                NpgsqlCommand conexion = new NpgsqlCommand(query, con);
                NpgsqlDataReader data = conexion.ExecuteReader();
                while (data.Read())
                {
                    //byte[] bytes = (byte[])data[1];
                    //var test=Encoding.UTF8.GetBytes(data[1].ToString());

                    //string convertedUtf8 = Encoding.UTF8.GetString(bytes);
                    //string convertedUtf16 = Encoding.Unicode.GetString(bytes);
                    ProductsData.Add(new ProductsModel
                    {
                        codprod = data[0].ToString(),
                        nomprod = data[1].ToString(),
                        valprod = data[2].ToString()

                    });
                }
                data.Close();


                Desconectar();

                return ProductsData;
                
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        //Seller Request

        public List<drugstoresModel> GetDrugStore()
        {
            var drugstoresData = new List<drugstoresModel>();
            try
            {
                conectar();
                var query = "select vimaedrg.codcia,vimaedrg.coddrog,vimaedrg.nitdrog,nomdrog,dirdrog,dep_nomb,mun_nomb,barrio,revisita,vimaedxz.codzona,diarevis from vimaedxz,vimaedrg,gnmaedep,gnmaemun where vimaedxz.estado = 0 and gnmaedep.dep_codi = coddpto and gnmaedep.dep_codi = gnmaemun.dep_codi and codmun = gnmaemun.mun_codi and vimaedxz.codcia = vimaedrg.codcia and vimaedxz.coddrog = vimaedrg.coddrog and codzona = 'A139'";
                var conexion = new NpgsqlCommand(query, con);
                var data = conexion.ExecuteReader();
                while (data.Read())
                {


                    drugstoresData.Add(new drugstoresModel
                    {
                        coddrog = data[1].ToString(),
                        nitdrog = data[2].ToString(),
                        nomdrog = data[3].ToString(),
                        dirdrog = data[4].ToString(),
                        dep_nomb = data[5].ToString(),
                        mun_nomb = data[6].ToString(),
                        barrio = data[7].ToString(),
                        revisita = data[8].ToString(),
                        zona = data[9].ToString(),
                        diarevis = data[10].ToString(),
                        //diarevis = data[11].ToString(),
                        //diarevis = data[12].ToString(),
                        //tranfer = data[13].ToString(),

                    });

                }
                Desconectar();
                return drugstoresData;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }
}