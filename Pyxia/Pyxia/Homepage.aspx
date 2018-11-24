<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Pyxia.Homepage" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">

    <div>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" type="text/css" href="css/Homestyle.css">
        <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
    </div>

    <%-- Slide Show--%>
    <section>
      <img class="mySlides" src="img/2.1.jpeg"
      style="width:100%">
     <img class="mySlides" src="img/3.jpg"
     style="width:100%">
    <img class="mySlides" src="img/4.jpg"
    style="width:100%">
   </section>

    <script>
<%--Automatic Slideshow - change image every 3 seconds--%>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000);
}
</script>



</asp:Content>

