<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="FaleConosco.aspx.cs" Inherits="Pyxia.FaleConosco" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/styleFale.css">
         <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
    </div>
  
        <div class="container">
           <div class="row">
               <div class="col-lg-4 col-lg-offset-4">
                   <div class="form">
                    <h2 class="title">Fale Conosco</h2>
                       <p class="pergunta">Você tem alguma dúvida ou sugestão? Envie-nos uma mensagem</p>

                       <form class="formulario" runat="server">                     
                             
                        <asp:TextBox ID="txtnome" placeholder="informe seu nome" runat="server" ></asp:TextBox>
                        <asp:TextBox ID="txtemail" placeholder="informe seu e-mail" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtassunto" placeholder="digite o assunto" runat="server"></asp:TextBox>

                        </form>
                       </div>
                   </div>
               </div>
        </div>
    <div id="btnEnviar" style="position: relative; padding-left: 11px; margin-left: 391px;">
         <button >Enviar</button>
   </div>
</asp:Content>
