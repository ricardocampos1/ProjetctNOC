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

        private readonly SqlConnection conexao = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
        private readonly SqlConnection conexao2 = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

        protected void Page_Load(object sender, EventArgs e)
        {
            SetLabelProcessador();
            //SetLabelMemoria();
            SetLabelNomeSO();

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

            using (conexao)
            {
                conexao.Open();

                using (SqlCommand cmd = new SqlCommand("select name_processor, physical_core, logical_core from tb_machine where id_machine = 1", conexao))
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
                conexao.Close();

                //private void SetLabelMemoria()
                //{

                //    using (conexao)
                //    {
                //        conexao.Open();

                //        using (SqlCommand cmd = new SqlCommand("select ram_memory_total from tb_machine where id_machine = 1", conexao))
                //        {
                //            using (SqlDataReader reader = cmd.ExecuteReader())
                //            {
                //                if (reader.Read() == true)
                //                {
                //                  lblMemoriaTotal.Text = reader.GetInt32(1).ToString();
                //
                //                }
                //            }
                //        }
                //    }

                //}

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
    
