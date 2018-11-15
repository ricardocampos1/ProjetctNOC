<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="login.css"/>
    <title>Pyxia - Login</title>
</head>
<body>
    <div class="login"> 
			<div class="form">
           <p class="p">Login</p>
    <form id="form1" class="login-form" runat="server">       
            <asp:TextBox runat="server" type="text" placeholder="digite seu nome de usuário" ID="TxtUsuario" CssClass="input1" />  
            <asp:TextBox runat="server" type="password" placeholder="digite sua senha" ID="TxtSenha" CssClass="input2"/>  
            <asp:Button Text="Cadastrar" runat="server" ID="BtnCadastrar" OnClick="BtnCadastrar_Click" />     
    </form>
            </div>
    </div>
</body>
</html>
