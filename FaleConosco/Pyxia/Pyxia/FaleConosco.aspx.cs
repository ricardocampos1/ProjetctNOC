using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pyxia
{
    public partial class FaleConosco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {  

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("projetopyxia@gmail.com", "Pyxia", System.Text.Encoding.UTF8);// Remetente do E-mail
                mail.To.Add("projetopyxia@gmail.com");// Destinatario do email
                mail.Subject = txtassunto.Text;// Assunto do E-mail
                mail.Body = TextArea1.Text; // Corpo do email
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.Priority = MailPriority.High; //Prioridade do E-Mail

                SmtpClient client = new SmtpClient();  //Adicionando as credenciais do seu e-mail e senha:
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