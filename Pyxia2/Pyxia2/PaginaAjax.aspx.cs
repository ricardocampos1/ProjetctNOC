using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;

namespace Pyxia2
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        [WebMethod]
        public static decimal getUltimoProcessador()
        {
            using (SqlConnection con = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 1 processor_usage FROM TB_REAL_TIME_MACHINE WHERE ID_MACHINE = 1", con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    return decimal.Parse(rd[0].ToString());
                }
            }
            return 0;
        }
    }
}