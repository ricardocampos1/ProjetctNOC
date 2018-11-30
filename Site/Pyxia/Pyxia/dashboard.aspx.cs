using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Pyxia
{
    public partial class dashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //DataTable listMachine = new DataTable();

            //using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            //{

            //    try
            //    {
            //        ListItem listItem = new ListItem();

            //        SqlCommand cmd = new SqlCommand("SELECT id_machine, name_machine FROM tb_machine where id_user = " + Session["id_user"].ToString(), conn);

            //        SqlDataReader reader;

            //        reader = cmd.ExecuteReader();
            //        while (reader.Read())
            //        {
            //            listItem = new ListItem();
            //            listItem.Text = reader["name_machine"].ToString();
            //            listItem.Value = reader["id_machine"].ToString();
            //            ddlMachine.Items.Add(listItem);
            //            ddlMachine.Items.Add("Teste");
            //        }
            //        reader.Close();
            //    }
            //    catch (Exception ex)
            //    {
            //        Response.Write("<script>alert('Erro!')</script>");
            //    }

            //}

            // Add the initial item - you can add this even if the options from the
            // db were not successfully loaded
            //ddlMachine.Items.Insert(0, new ListItem("Computadores", "0"));
        }
    }
}