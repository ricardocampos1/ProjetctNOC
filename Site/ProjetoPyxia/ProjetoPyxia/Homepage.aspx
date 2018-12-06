<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Pyxia.Homepage" %>

<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">

    <div>
        <link rel="stylesheet" type="text/css" href="styleHome.css">
        <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </div>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">

        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner">
            <div class="item active">
                <img src="img/2.jpg" alt="imagem inicial " style="width: 100%;">
            </div>
            <div class="item">
                <img src="img/3.jpg" alt=" imagem mediana" style="width: 100%;">
            </div>

            <div class="item">
                <img src="img/4.jpg" alt="imagem final" style="width: 100%;">
            </div>

            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</asp:Content>

