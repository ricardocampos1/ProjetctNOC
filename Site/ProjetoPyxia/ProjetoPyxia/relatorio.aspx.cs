using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace ProjetoPyxia
{
    public partial class relatorio : System.Web.UI.Page
    {
        const string connectionString = "Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["id_user"] as string))
            {
                Response.Redirect("home.aspx");
            }
            if (!this.IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT id_machine, name_machine FROM tb_machine where id_user =" + Session["id_user"].ToString()))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = conn;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            sda.Fill(ds);
                            ddlComputer.DataSource = ds.Tables[0];
                            ddlComputer.DataTextField = "name_machine";
                            ddlComputer.DataValueField = "id_machine";
                            ddlComputer.DataBind();
                        }
                    }
                }
                ddlComputer.Items.Insert(0, new ListItem("Computadores", "0"));
            }

            using (var conn = new SqlConnection(connectionString))
            {
                conn.Open();
                var sda = new SqlDataAdapter("select h.processor_usage, h.processor_temperature, h.ram_memory_usage, h.ram_memory_available, h.current_dt, m.name_machine from tb_historical h inner join tb_machine m on h.id_machine = m.id_machine where m.id_user = " + Session["id_user"], conn);
                if (!string.IsNullOrEmpty(Session["dtInicial"] as string) && !string.IsNullOrEmpty(Session["dtFinal"] as string))
                {
                    sda = new SqlDataAdapter("select h.processor_usage, h.processor_temperature, h.ram_memory_usage, h.ram_memory_available, h.current_dt, m.name_machine from tb_historical h inner join tb_machine m on h.id_machine = m.id_machine where m.id_user = " + Session["id_user"] + " and m.id_machine = " + ddlComputer.SelectedValue.ToString() + " and h.current_dt between '" + Session["dtInicial"].ToString() + "' and '" + Session["dtFinal"].ToString() + "'", conn);
                }
                var dt = new DataTable();
                sda.Fill(dt);
                gvResultFilter.DataSource = dt;
                gvResultFilter.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string dtInicial = txtDataInicial.Text.Replace("T", " ");
            Session["dtInicial"] = dtInicial;
            string dtFinal = txtDataFinal.Text.Replace("T", " ");
            Session["dtFinal"] = dtFinal;
        }
    }
}