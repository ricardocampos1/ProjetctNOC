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
    public partial class perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEmail_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexao = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conexao.Open();

                using (SqlCommand comando = new SqlCommand($"UPDATE tb_user SET email = '{novoEmail.Text}' WHERE id_user IN (1);", conexao))
                {
                    using (SqlDataReader leitor = comando.ExecuteReader())
                    {
                        Response.Write("<script>alert('Alteração realizada com sucesso')</script>");
                    }
                }

            }
        }

        protected void btnNome_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexao = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conexao.Open();

                using (SqlCommand comando = new SqlCommand($"UPDATE tb_user SET username = '{novoNome.Text}' WHERE id_user IN (1);", conexao))
                {
                    using (SqlDataReader leitor = comando.ExecuteReader())
                    {
                        Response.Write("<script>alert('Alteração realizada com sucesso')</script>");
                    }
                }

            }
        }

        protected void btnSenha_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexao = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conexao.Open();

                using (SqlCommand comando = new SqlCommand($"select userpass from tb_user where id_user = 1 and userpass = '{senhaAtual.Text}';", conexao))
                {
                    using (SqlDataReader leitor = comando.ExecuteReader())
                    {
                        if (leitor.Read() == true)
                        {
                            conexao.Close();

                            conexao.Open();

                            using (SqlCommand comando2 = new SqlCommand($"UPDATE tb_user SET userpass = '{senhaNova.Text}' WHERE id_user IN (1);", conexao))
                            {
                                using (SqlDataReader leitor2 = comando2.ExecuteReader())
                                {
                                    Response.Write("<script>alert('Alteração realizada com sucesso')</script>");
                                }

                            }
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