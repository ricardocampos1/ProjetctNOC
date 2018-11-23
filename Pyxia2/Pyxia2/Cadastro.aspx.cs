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
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void BtnCadastra_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection("Server = tcp:pyxia.database.windows.net,1433; Initial Catalog = Pyxia; Persist Security Info = False; User ID =pyxia; Password =Admin@admin; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"))
            {
                conn.Open();

                if (txtnome.Text.Length == 0 || txtnome.Text.Length > 50)
                {
                    Response.Write("<script>alert('Tamanho nome inválido')</script>");
                    txtnome.Focus();
                    return;
                }

                if (txtemail.Text.Length == 0 || txtemail.Text.Length > 100)
                {
                    Response.Write("<script>alert('Tamanho do email inválido')</script>");
                    txtemail.Focus();
                    return;
                }

                if (txtuser.Text.Length == 0 || txtuser.Text.Length > 20)
                {
                    Response.Write("<script>alert('Tamanho do usuário inválido')</script>");
                    txtuser.Focus();
                    return;
                }

                DateTime data;
                if (DateTime.TryParse(txtdatanasc.Text, System.Globalization.CultureInfo.GetCultureInfo("pt-br"), System.Globalization.DateTimeStyles.None, out data) == false)
                {
                    Response.Write("<script>alert('data inválido')</script>");
                    txtdatanasc.Focus();
                    return;
                }

                if (txtsenha.Text.Length == 0 || txtsenha.Text.Length > 20)
                {
                    Response.Write("<script>alert('Tamanho da senha inválido')</script>");
                    txtsenha.Focus();
                    return;
                }

                if (txtsenha.Text != txtsenhac.Text)
                {
                    Response.Write("<script>alert('Senhas não coincidem')</script>");
                    txtsenhac.Focus();
                    return;
                }

                using (SqlCommand cmd = new SqlCommand("INSERT INTO tb_user(name_complete, email, username, birth_date, userpass) VALUES(@name_complete, @email, @username, @birth_date, @userpass)", conn))
                {
                  
                    cmd.Parameters.AddWithValue("@name_complete", txtnome.Text);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@username", txtuser.Text);
                    cmd.Parameters.AddWithValue("@birth_date", DateTime.Parse(txtdatanasc.Text));
                    cmd.Parameters.AddWithValue("@userpass", txtsenha.Text);

                    cmd.ExecuteNonQuery();

                    Response.Redirect("Login.aspx");

                   
                }
            }
        }
    }
}