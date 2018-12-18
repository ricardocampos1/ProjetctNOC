using System;
using System.Data.SqlClient;
using System.Net.Mail;

namespace ProjetoPyxia
{
    public partial class Fale : System.Web.UI.Page
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

        protected void BtnSend_OnClick(object sender, EventArgs e)
        {
            var mail = new MailMessage();
            mail.From = new MailAddress("projetopyxia@gmail.com", "Pyxia", System.Text.Encoding.UTF8);// Remetente do E-mail
            mail.To.Add("projetopyxia@gmail.com");// Destinatario do email
            mail.Subject = ddlMatter.SelectedItem.Text;// Assunto do E-mail
            mail.Body = txtBodyEmail.Text; // Corpo do email
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.Priority = MailPriority.High; //Prioridade do E-Mail

            var client = new SmtpClient();  //Adicionando as credenciais do seu e-mail e senha:
            client.Credentials = new System.Net.NetworkCredential("projetopyxia@gmail.com", "pyxia2018");

            client.Port = 587; // Esta porta é a utilizada pelo Gmail para envio
            client.Host = "smtp.gmail.com"; //Definindo o provedor que irá disparar o e-mail
            client.EnableSsl = true; //Gmail trabalha com Server Secured Layer
            try
            {
                client.Send(mail);
                Response.Write("<script>alert('Sua mensagem foi enviada com sucesso!')</script>");

            }
            catch { Response.Write("<script>alert('Mensagem não foi enviada')</script>"); }
        }
    }
}