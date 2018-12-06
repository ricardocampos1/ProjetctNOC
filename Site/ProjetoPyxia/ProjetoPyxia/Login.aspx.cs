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

        protected void BtnCadastrar_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
                {

                conn.Open();
                
                if (TxtUsuario.Text.Length == 0)
                {
                    Response.Write("<script>alert('Tamanho Nome Usuario')</script>");
                    TxtUsuario.Focus();
                    return;
                }

                if (TxtSenha.Text.Length < 3)
                {
                    Response.Write("<script>alert('Tamanho Senha')</script>");
                    TxtSenha.Focus();
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("select id_user, username, userpass from tb_user where username = @username and userpass = @userpass", conn))
                {
                    cmd.Parameters.AddWithValue("@username", TxtUsuario.Text);
                    cmd.Parameters.AddWithValue("@userpass", TxtSenha.Text);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read() == true)
                        {
                            Session["name_user"] = reader.GetString(1);
                            Session.Timeout = 10;
                            Session["id_user"] = reader.GetValue(0).ToString();
                            Response.Redirect("dashboard.aspx");
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