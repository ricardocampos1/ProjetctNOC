<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pyxia.Login" %>

<%--<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/logincss.css" />
                 <link rel="stylesheet" type="text/css" href="css/styleCadastro.css">

        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4">
                <div class="cadastro">
                    <div class="form">
                        <p class="p">Login</p>
                        <form id="form1" class="login-form" runat="server">
                            <asp:TextBox runat="server" type="text" placeholder="digite seu nome de usuário" ID="TxtUsuario" CssClass="input1" />
                            <asp:TextBox runat="server" type="password" placeholder="digite sua senha" ID="TxtSenha" CssClass="input2" />
                            <asp:Button Text="Entrar" runat="server" ID="BtnCadastrar" OnClick="BtnCadastrar_Click" CssClass="botão" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>--%>


<%--<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pyxia.Login" %>--%>

<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styleCadastro.css">
        <link rel="stylesheet" type="text/css" href="css/logincss.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
    </div>


    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4">
                <div class="cadastro">
                    <div class="form">
                        <h2 class="p">Login</h2>
                        <form class="formulario" runat="server">
                            <asp:TextBox  runat ="server" type="text" placeholder="digite seu nome de usuário" ID="TxtUsuario" CssClass="input-login" />
                            <asp:TextBox runat="server" type="password" placeholder="digite sua senha" ID="TxtSenha" CssClass="input2" />
                            <asp:Button Text="Entrar" runat="server" ID="BtnCadastrar" OnClick="BtnCadastrar_Click" CssClass="botão" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

