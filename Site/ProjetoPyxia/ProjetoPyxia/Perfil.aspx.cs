﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ProjetoPyxia
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["id_user"] as string))
            {
                Response.Redirect("home.aspx");
            }

        }


        protected void btnEmail_Click(object sender, EventArgs e)
        {
            string usuario = (string)Session["id_user"];
            using (SqlConnection conexao = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conexao.Open();

                using (SqlCommand comando = new SqlCommand($"UPDATE tb_user SET email = '{novoEmail.Text}' WHERE id_user IN ('{usuario}');", conexao))
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
            string usuario = (string)Session["id_user"];
            using (SqlConnection conexao = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conexao.Open();

                using (SqlCommand comando = new SqlCommand($"UPDATE tb_user SET name_complete = '{novoNome.Text}' WHERE id_user IN ('{usuario}');", conexao))
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
            string usuario = (string)Session["id_user"];
            using (SqlConnection conexao = new SqlConnection("Server=tcp:pyxia.database.windows.net,1433;Initial Catalog=Pyxia;Persist Security Info=False;User ID=pyxia;Password=Admin@admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conexao.Open();

                using (SqlCommand comando = new SqlCommand($"select userpass from tb_user where id_user = '{usuario}' and userpass = '{senhaAtual.Text}';", conexao))
                {
                    using (SqlDataReader leitor = comando.ExecuteReader())
                    {
                        if (leitor.Read() == true)
                        {
                            conexao.Close();

                            conexao.Open();

                            using (SqlCommand comando2 = new SqlCommand($"UPDATE tb_user SET userpass = '{senhaNova.Text}' WHERE id_user IN ('{usuario}');", conexao))
                            {
                                using (SqlDataReader leitor2 = comando2.ExecuteReader())
                                {
                                    Response.Write("<script>alert('Alteração realizada com sucesso')</script>");
                                }

                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Senha Atual inválida')</script>");
                        }
                    }
                }

            }
        }

    }
}