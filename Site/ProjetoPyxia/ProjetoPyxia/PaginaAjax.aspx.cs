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
        private const decimal convertGiga = 1073741824;
        [WebMethod]
        public static decimal getUltimoProcessador()
        {
            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 processor_usage FROM TB_REAL_TIME_MACHINE WHERE ID_MACHINE = " + HttpContext.Current.Session["id_machine"].ToString(), con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    return decimal.Parse(rd[0].ToString());//ative esta linha/ Como estava

                }
            }
            return 0;
        }

        [WebMethod]
        public static decimal getHardDiskLivre()
        {

            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT total_free_space_hd FROM tb_hard_disk WHERE ID_MACHINE = " + HttpContext.Current.Session["id_machine"].ToString() + " and id_hd = " + HttpContext.Current.Session["id_hd"].ToString(), con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    var result = decimal.Parse(rd[0].ToString());
                    result = result / convertGiga;
                    return result;

                }
            }
            return 0;
        }

        [WebMethod]
        public static decimal getHardDiskUsado()
        {

            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 total_usable_space_hd FROM tb_hard_disk WHERE ID_MACHINE = " + HttpContext.Current.Session["id_machine"].ToString() + " and id_hd = " + HttpContext.Current.Session["id_hd"].ToString(), con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    var result = decimal.Parse(rd[0].ToString());
                    result = result / convertGiga;
                    return result;

                }
            }
            return 0;
        }

        [WebMethod]
        public static long getMemoriaTotal()
        {
            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 ram_memory_total FROM tb_machine WHERE ID_MACHINE = " + HttpContext.Current.Session["id_machine"].ToString(), con);
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
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 ram_memory_usage FROM TB_REAL_TIME_MACHINE WHERE ID_MACHINE = " + HttpContext.Current.Session["id_machine"].ToString(), con);
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
        public static decimal getMemoriaUsadaLabel()
        {

            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 ram_memory_usage FROM TB_REAL_TIME_MACHINE WHERE ID_MACHINE = " + HttpContext.Current.Session["id_machine"].ToString(), con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    var result = decimal.Parse(rd[0].ToString());
                    result = result / convertGiga;
                    return result;

                }
            }
            return 0;
        }

        [WebMethod]
        public static decimal getMemoriaLivreLabel()
        {

            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select top 1 ram_memory_available from tb_real_time_machine where id_machine = " + HttpContext.Current.Session["id_machine"].ToString(), con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    var result = decimal.Parse(rd[0].ToString());
                    result = result / convertGiga;
                    return result;

                }
            }
            return 0;
        }

        [WebMethod]
        public static decimal getTemperatura()
        {

            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select top 1 processor_temperature from tb_real_time_machine where id_machine = " + HttpContext.Current.Session["id_machine"].ToString(), con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    var result = decimal.Parse(rd[0].ToString());
                    return result;

                }
            }
            return 0;
        }

        [WebMethod]
        public static long getPorcentagemUsada()
        {
            if (getMemoriaUsada() != 0)
            {
                return long.Parse(((getMemoriaUsada() * 100) / getMemoriaTotal()).ToString());
            }
            return 0;
        }

        [WebMethod]
        public static string getTotalRamUsada()
        {
            return Math.Round(getMemoriaUsadaLabel(), 2).ToString();
        }

        [WebMethod]
        public static string getHardDiskLivreGrafico()
        {
            return Math.Round(getHardDiskLivre(), 2).ToString();
        }

        [WebMethod]
        public static string getHardDiskUsadoGrafico()
        {
            return Math.Round(getHardDiskUsado(), 2).ToString();
        }

        [WebMethod]
        public static string getTotalRamLivre()
        {
            return Math.Round(getMemoriaLivreLabel(), 2).ToString();
        }
    }
}