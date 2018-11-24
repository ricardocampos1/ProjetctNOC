<%@ Page Title="Login Pyxia" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pyxia.Login" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/styleLogin.css">
    </div>


    <div id="id01" class="modalx">
  
  <form class="modal-content animate">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img/img_avatar2.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label for="uname"><b>Usuario</b></label>
      <input type="text" placeholder="Email" name="uname" required>

      <label for="psw"><b>Senha</b></label>
      <input type="password" placeholder="senha" name="psw" required>
        
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Lembre-me
      </label>
        <span class="psw">Esqueceu <a href="#">a sua senha?</a></span>
    </div>

    
  </form>
</div>

    <script>
    var modal = document.getElementById('id01');

<%--When the user clicks anywhere outside of the modal, close it--%>
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

</script>




</asp:Content>

