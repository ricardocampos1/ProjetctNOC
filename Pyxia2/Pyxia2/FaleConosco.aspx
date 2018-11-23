<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="FaleConosco.aspx.cs" Inherits="Pyxia.FaleConosco" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                             
                        <asp:TextBox ID="txtemail" placeholder="informe seu Email" runat="server" CssClass="input1" ></asp:TextBox>
                        <asp:TextBox ID="txtassunto" placeholder="informe o assunto " runat="server" CssClass="input2"></asp:TextBox>
                           <textarea rows="10" cols="40" placeholder="Digite aqui" runat="server">
                            </textarea>
                           <asp:Button ID="BtnEnviar"  runat="server" Text="Enviar" CssClass="botão" />
                        </form>
                       </div>
                   </div>
               </div>
        </div>
   
</asp:Content>
