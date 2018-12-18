<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="ComoFunciona.aspx.cs" Inherits="PyxiaTwo.ComoFunciona" %>
<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
  <div>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link rel="stylesheet" href="css/styleComo.css">
  </div>

  <div class="como-container">
    <h1 class="como-title">Como Funciona?</h1>
    <div class="description-wrapper">
      <div class="card-wrapper">
        <p class="paragraph"> A Pyxia conta com uma Dashboard intuitiva que irá te ajudar a<br/>
            acompanhar o funcionamento do seu computador prática e<br/>
            rápida, facilitando o seu dia a dia.</p>
        <img class="first-img" src="img/dashboard.png"/>
      </div>
  
      <div class="secondcard-wrapper">
        <p class="paragraph">Os gráficos exibem em tempo real o consumo dos recursos de
        memória RAM, processador e unidades de disco.</p>  
        <img class="first-img" src="img/graficos.png"/>
        <p class="paragraph"> É possível visualizar em um único gráfico o consumo de todas
          as suas unidades de armazenamento.</p>
        <p class="paragraph">Você ainda pode cadastrar quantos computadores quiser numa
        única conta.Isso garante flexibilidade e praticidade, poid você
        pode acompanhar o funcionamento de seus computadores de
        qualquer lugar, inclusive pelo seu celular!</p>
      </div>
    </div>
  </div>



</asp:Content>

