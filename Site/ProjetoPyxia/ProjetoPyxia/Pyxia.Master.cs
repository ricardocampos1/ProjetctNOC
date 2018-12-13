using System;
using System.Data.SqlClient;

namespace ProjetoPyxia
{
    public partial class Pyxia : System.Web.UI.MasterPage
    {
        private const string ConnectionString =
            "Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_OnClick(object sender, EventArgs e)
        {
            if (txtUserLogin.Text.Length == 0)
            {
                Response.Write("<script>alert('Digite seu usuário')</script>");
                txtUserLogin.Focus();
                return;
            }

            if (txtPasswordLogin.Text.Length == 0)
            {
                Response.Write("<script>alert('Digite sua senha')</script>");
                txtPasswordLogin.Focus();
                return;
            }

            using (var conn = new SqlConnection(ConnectionString))
            {

                conn.Open();

                using (var cmd = new SqlCommand("select id_user, username, userpass from tb_user where username = @username and userpass = @userpass", conn))
                {
                    cmd.Parameters.AddWithValue("@username", txtUserLogin.Text);
                    cmd.Parameters.AddWithValue("@userpass", txtPasswordLogin.Text);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["name_user"] = reader.GetString(1);
                            Session.Timeout = 10;
                            Session["id_user"] = reader.GetValue(0).ToString();
                            Response.Redirect("dashboard.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Usuário ou senha incorretos')</script>");
                        }
                    }
                }
            }
        }
    }
}