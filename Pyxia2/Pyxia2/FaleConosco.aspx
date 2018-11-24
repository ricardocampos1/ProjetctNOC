<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="FaleConosco.aspx.cs" Inherits="Pyxia.FaleConosco" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/styleFale.css">
         <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
    </div>
    <div>
    <p><input placeholder="Nome Completo" oninput="this.className = ''" name="name"></p>
    <p><input placeholder="Email" oninput="this.className = ''" name="email"></p>

        <textarea rows="4" cols="50">
        </textarea>
        </div>
    <div id="btnEnviar" style="position: relative; padding-left: 11px; margin-left: 391px;">
         <button >Enviar</button>
   </div>
</asp:Content>
