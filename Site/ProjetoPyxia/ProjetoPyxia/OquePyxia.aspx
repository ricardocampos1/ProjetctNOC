<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="OquePyxia.aspx.cs" Inherits="ProjetoPyxia.OquePyxia" %>

<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link rel="stylesheet" href="css/styleOqPyxia.css">
    </div>
    <div class="container-pyxia">
        <div>
            <h1 class="pyxia-title">O Que é Pyxia?</h1>
        </div>
        <div class="description-row">
            <p>
                Inpirada na constelação Pyxie,  que significa bússola, a Pyxia
							é  uma   plataforma   para  acompanhar   online  o funcionamento
							de  computadores   de  forma  simples  e  acessível  que   busca
							orientar e facilitar o dia a dia de quem usa computador.
            </p>
            <p>
                Composta por um programa e uma aplicação web com
							Dasboard, a Pyxia captura as informações do seu
							computador e exibe elas para você numa tela simples e
							intuitiva.
            </p>
        </div>
        <div class="pyxia-wrapper">
            <img src="img/Pyx.png" class="img-pyx" />
            <p class="frist-paragraph">Além disso, temos o Pyx!</p>
            <div class="pyxia-desc">
                <p>
                    Pyx será seu guia e estará sempre pronto para te ajudar a navegar
									pelo site e tirar suas dúvidas.
                </p>
                <p>
                    Conversar com ele é muito simples, basta um clique na foto dele que
							fica no canto inferior direito do site.
                </p>
            </div>
        </div>
    </div>



</asp:Content>

