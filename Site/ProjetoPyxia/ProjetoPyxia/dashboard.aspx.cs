using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace Pyxia
{
    public partial class dashboard1 : System.Web.UI.Page
    {
        private const decimal convertGiga = 1073741824;
        private readonly string conexao2 = "Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

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

                HttpContext.Current.Session["id_machine"] = 0;
                HttpContext.Current.Session["id_hd"] = 0;
            }

            SetLabelProcessador();
            SetLabelNomeSO();
            SetLabelMemoriaTotal();
        }

        private void SetLabelProcessador()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("select name_processor, physical_core, logical_core from tb_machine where id_machine = " + HttpContext.Current.Session["id_machine"].ToString() + "", conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read() == true)
                        {
                            lblNameProcessor.Text = reader.GetString(0);
                            lblPhysicalCore.Text = reader.GetInt32(1).ToString();
                            lblLogicalCore.Text = reader.GetInt32(2).ToString();
                        }
                    }
                }

            }

        }

        private void SetLabelMemoriaTotal()
        {

            using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("select ram_memory_total from tb_machine where id_machine = " + HttpContext.Current.Session["id_machine"].ToString() + "", conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read() == true)
                        {
                            decimal valorTotal = reader.GetInt64(0);
                            valorTotal = valorTotal / convertGiga;
                            valorTotal = Math.Round(valorTotal, 2);
                            lblMemoriaTotal.Text = valorTotal.ToString();

                        }
                        else
                        {
                            lblMemoriaTotal.Text = "não disponivel";
                        }
                    }
                }
            }

        }

        private void SetLabelHardDisk()
        {

            using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("select total_space_hd, total_free_space_hd, total_usable_space_hd from tb_hard_disk where id_machine = " + HttpContext.Current.Session["id_machine"].ToString() + " and id_hd = " + HttpContext.Current.Session["id_hd"].ToString() + "", conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read() == true)
                        {
                            lblTotalSpace.Text = Math.Round((reader.GetInt64(0) / convertGiga), 2).ToString();
                            lblFreeSpace.Text = Math.Round((reader.GetInt64(1) / convertGiga), 2).ToString();
                            lblUsageSpace.Text = Math.Round((reader.GetInt64(2) / convertGiga), 2).ToString();
                        }
                        else
                        {
                            lblTotalSpace.Text = "não disponivel";
                            lblFreeSpace.Text = "não disponivel";
                            lblUsageSpace.Text = "não disponivel";
                        }
                    }
                }
            }

        }

        private void SetLabelNomeSO()
        {

            using (SqlConnection conn = new SqlConnection(conexao2))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("select name_operation_system from tb_machine where id_machine = " + HttpContext.Current.Session["id_machine"].ToString(), conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read() == true)
                        {
                            lblNameSO.Text = reader.GetString(0);
                        }
                    }
                }

            }

        }

        public void ddlMachine_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpContext.Current.Session["id_machine"] = ddlMachine.SelectedValue.ToString();
            SetLabelProcessador();
            SetLabelNomeSO();
            SetLabelMemoriaTotal();
            using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT id_hd, absolut_path FROM tb_hard_disk where id_machine = " + HttpContext.Current.Session["id_machine"].ToString()))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds);
                        ddlHardDisk.DataSource = ds.Tables[0];
                        ddlHardDisk.DataTextField = "absolut_path";
                        ddlHardDisk.DataValueField = "id_hd";
                        ddlHardDisk.DataBind();
                    }
                }
            }
            ddlHardDisk.Items.Insert(0, new ListItem("Lista de HDs", "0"));
        }

        protected void ddlHardDisk_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpContext.Current.Session["id_hd"] = ddlHardDisk.SelectedValue.ToString();
            SetLabelHardDisk();
        }
    }
}

