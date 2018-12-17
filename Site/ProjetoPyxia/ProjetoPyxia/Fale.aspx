<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fale.aspx.cs" Inherits="ProjetoPyxia.Fale" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/stylefale.css" />
    <%--<link rel="stylesheet" href="/css/bootstrap.min.css" />--%>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <title>Pyxia</title>
</head>
<body>

    <form runat="server" id="frmFaleConosco">
        <header>
            <div class="container">
                <div class="header_action">
                    <nav>
                        <a href="Home.aspx">
                            <img src="/img/logo_pyxia.png" alt="Logo Pyxia" /></a>
                        <ul class="menu">
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="OquePyxia.aspx">O que é Pyxia?</a></li>
                            <li><a href="Fale.aspx">Fale Conosco</a></li>
                            <li><a href="ComoFunciona.aspx">Como Funciona?</a></li>
                        </ul>
                    </nav>
                    <div class="login_action">
                        <asp:TextBox runat="server" type="text" placeholder="Usuário" ID="txtUserLogin" CssClass="field_login" />
                        <asp:TextBox runat="server" type="password" placeholder="Senha" ID="txtPasswordLogin" CssClass="field_login" />
                        <asp:Button Text="Entrar" runat="server" ID="BtnLogin" OnClick="BtnLogin_OnClick" CssClass="button_login" />
                    </div>
                </div>
            </div>
        </header>
        <main>
            <div class="contact">
                <h4 style="color: #fff">Fale Conosco</h4>
            </div>
            <p class="pergunta">Viu quanta coisa boa te esperando?</p>
            <p class="resposta">Mas se mesmo assim você tiver alguma dúvida ou quiser nos dar alguma sugestão, entre em contato agora mesmo!</p>

            <div class="form">
                <asp:TextBox ID="txtName" placeholder="Seu nome" runat="server" CssClass="input1" />
                <asp:TextBox ID="txtEmail" placeholder="E-mail" TextMode="Email" runat="server" CssClass="input1" />
                <asp:DropDownList runat="server" CssClass="ddl-contact" ID="ddlMatter">
                    <asp:ListItem Text="Selecione o Assunto"></asp:ListItem>
                    <asp:ListItem Text="Sugestão" />
                    <asp:ListItem Text="Problema de Login" />
                    <asp:ListItem Text="Problemas com a DashBoard" />
                    <asp:ListItem Text="Dúvidas com o Pyx" />
                    <asp:ListItem Text="Outros" />
                </asp:DropDownList>
                <asp:TextBox ID="txtBodyEmail" TextMode="multiline" Columns="50" Rows="5" runat="server" placeholder="Digite sua mensagem..." CssClass="text-area" />
                <asp:Button ID="BtnSend" runat="server" Text="Enviar" CssClass="botão" OnClick="BtnSend_OnClick" />
            </div>
        </main>
        <footer>
        </footer>
    </form>
</body>
</html>


