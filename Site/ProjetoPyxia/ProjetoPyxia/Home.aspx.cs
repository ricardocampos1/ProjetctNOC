using System;
using System.Data.SqlClient;

namespace ProjetoPyxia
{
    public partial class Home : System.Web.UI.Page
    {
        private const string ConnectionString =
            "Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnUserRegister_OnClick(object sender, EventArgs e)
        {
            if (txtEmailRegister.Text.Length == 0 || txtEmailRegister.Text.Length > 100)
            {
                Response.Write("<script>alert('Tamanho do email inválido (Maximo de 100 digitos)')</script>");
                txtEmailRegister.Focus();
                return;
            }
            if (txtUserRegister.Text.Length < 5 || txtUserRegister.Text.Length > 20)
            {
                Response.Write("<script>alert('Tamanho de usuário inválido (Minimo de 5 digitos e Maximo de 20)')</script>");
                txtUserRegister.Focus();
                return;
            }
            if (txtPasswordRegister.Text.Length < 5 || txtPasswordRegister.Text.Length > 20)
            {
                Response.Write("<script>alert('Tamanho da senha inválido (Minimo de 5 digitos e Maximo de 20)')</script>");
                txtPasswordRegister.Focus();
                return;
            }
            if (txtPasswordRegister.Text != txtPasswordConfirmRegister.Text)
            {
                Response.Write("<script>alert('Senhas não coincidem')</script>");
                txtPasswordConfirmRegister.Focus();
                return;
            }
            DateTime data;
            if (DateTime.TryParse(txtDateRegister.Text, System.Globalization.CultureInfo.GetCultureInfo("pt-br"), System.Globalization.DateTimeStyles.None, out data) == false)
            {
                Response.Write("<script>alert('data inválido')</script>");
                txtDateRegister.Focus();
                return;
            }


            using (var conn = new SqlConnection(ConnectionString))
            {
                conn.Open();

                using (var cmd = new SqlCommand("INSERT INTO tb_user(email, username, birth_date, userpass) VALUES(@email, @username, @birth_date, @userpass)", conn))
                {
                    cmd.Parameters.AddWithValue("@email", txtEmailRegister.Text);
                    cmd.Parameters.AddWithValue("@username", txtUserRegister.Text);
                    cmd.Parameters.AddWithValue("@birth_date", DateTime.Parse(txtDateRegister.Text));
                    cmd.Parameters.AddWithValue("@userpass", txtPasswordRegister.Text);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Usuário cadastrado com sucesso')</script>");
                }
            }
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