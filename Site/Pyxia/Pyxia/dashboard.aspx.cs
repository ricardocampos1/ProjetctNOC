using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Pyxia
{
    public partial class dashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT id_machine, name_machine FROM tb_machine where id_user =" + Session["id_user"]))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = conn;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            ddlMachine.DataSource = ds.Tables[0];
                            ddlMachine.DataTextField = "name_machine";
                            ddlMachine.DataValueField = "id_machine";
                            ddlMachine.DataBind();
                        }
                    }
                }
                ddlMachine.Items.Insert(0, new ListItem("Computadores", "0"));
            }
        }
    }
}
    
