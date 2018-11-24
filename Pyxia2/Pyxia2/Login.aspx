<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pyxia.Login" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div >
         <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet"/>
         <link rel="stylesheet" type="text/css" href="css/logincss.css"/>
    </div>
    <div class="login"> 
			<div class="form">
           <p class="p">Login</p>
    <form id="form1" class="login-form" runat="server">       
            <asp:TextBox runat="server" type="text" placeholder="digite seu nome de usuário" ID="TxtUsuario" CssClass="input1" />  
            <asp:TextBox runat="server" type="password" placeholder="digite sua senha" ID="TxtSenha" CssClass="input2"/>  
            <asp:Button Text="Entrar" runat="server" ID="BtnCadastrar" OnClick="BtnCadastrar_Click" CssClass="botão"/>     
    </form>
            </div>
    </div>

</asp:Content>

