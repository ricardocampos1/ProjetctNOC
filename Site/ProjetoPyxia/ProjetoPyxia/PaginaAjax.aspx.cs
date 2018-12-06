using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;

namespace Pyxia
{
    public partial class PaginaAjax : System.Web.UI.Page
    {
        [WebMethod]
        public static decimal getUltimoProcessador()
        {
            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 processor_usage FROM TB_REAL_TIME_MACHINE WHERE ID_MACHINE = 2", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    //return decimal.Parse(rd[0].ToString());//ative esta linha/ Como estava

                }
            }

            //return 0;
            return new Random().Next(0, 100);
        }

        [WebMethod]
        public static long getMemoriaTotal()
        {
            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 ram_memory_total FROM tb_machine WHERE ID_MACHINE = 2", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {

                    long valor1 = long.Parse(rd[0].ToString());
                    return Convert.ToInt64(valor1);


                }

                return 0;
            }

        }

        [WebMethod]
        public static long getMemoriaUsada()
        {
            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 ram_memory_usage FROM TB_REAL_TIME_MACHINE WHERE ID_MACHINE = 2", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    long valor2 = long.Parse(rd[0].ToString());
                    return Convert.ToInt64(valor2);

                }
            }
            return 0;
        }

        [WebMethod]
        public static long getPorcentagemUsada()
        {
            return long.Parse(((getMemoriaUsada() * 100) / getMemoriaTotal()).ToString());
        }
    }
}