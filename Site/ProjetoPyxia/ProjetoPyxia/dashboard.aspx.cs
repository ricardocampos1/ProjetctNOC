using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Pyxia
{
    public partial class dashboard1 : System.Web.UI.Page
    {
        private const decimal convertGiga = 1073741824;
        private readonly SqlConnection conexao2 = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

        protected void Page_Load(object sender, EventArgs e)
        {
            SetLabelProcessador();
            SetLabelNomeSO();
            SetLabelMemoriaTotal();

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

        private void SetLabelProcessador()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("select name_processor, physical_core, logical_core from tb_machine where id_machine = 1", conn))
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
                using (SqlCommand cmd = new SqlCommand("select ram_memory_total from tb_machine where id_machine = 1", conn))
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

        private void SetLabelNomeSO()
        {

            using (conexao2)
            {
                conexao2.Open();

                using (SqlCommand cmd = new SqlCommand("select name_operation_system from tb_machine where id_machine = 1", conexao2))
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
    }
}

