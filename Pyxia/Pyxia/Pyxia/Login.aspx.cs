using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Pyxia
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {

                conn.Open();

                //if (TxtName.Text.Length == 0)
                //{
                //    Response.Write("<script>alert('Digite seu usuário corretamente')</script>");
                //    TxtName.Focus();
                //    return;
                //}

                if (TxtSenha.Text.Length < 5)
                {
                    Response.Write("<script>alert('Digite ')</script>");
                    TxtSenha.Focus();
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tb_user WHERE username = @username and userpass = @userpass", conn))
                {
                   // cmd.Parameters.AddWithValue("@username", TxtName.Text);
                    cmd.Parameters.AddWithValue("@userpass", TxtSenha.Text);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        //Obtém os registros, um por vez
                        if (reader.Read() == true)
                        {

                           // TxtName.Text = reader["username"].ToString();
                            TxtSenha.Text = reader["userpass"].ToString();

                            Response.Redirect("Teste.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Login Inválido')</script>");
                        }
                    }
                }
            }
        }
    }
}