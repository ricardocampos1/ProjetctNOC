<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Pyxia.Cadastro" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" type="text/css" href="css/styleCadastro.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
    </div>

     
         <div class="container">
           <div class="row">
               <div class="col-lg-4 col-lg-offset-4">
                   <div class="form">
                    <h2 class="title">Cadastro</h2>
                       <p class="pergunta">Para  começar nos conte como quer ser chamado por nós</p>

                       <form class="formulario" runat="server">                     
                             
                        <asp:TextBox ID="txtpergunta" runat="server" />
                        <asp:TextBox ID="txtemail" placeholder="digite seu e-mail" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtnome" placeholder="digite seu usuário para login" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtdatanasc" placeholder="digite sua data de nascimento" runat="server"></asp:TextBox>
                        <asp:TextBox type="password" ID="txtsenha" placeholder="escolha sua senha" runat="server"></asp:TextBox>
                        <asp:TextBox type="password"  ID="txtsenhac" placeholder="confirme sua senha" runat="server"></asp:TextBox>
                        <asp:Button ID="btnCadastra" runat="server" Text="Cadastrar" OnClick="#" />

                    </form>
                       </div>
                   </div>
                </div>
           </div>

</asp:Content>

