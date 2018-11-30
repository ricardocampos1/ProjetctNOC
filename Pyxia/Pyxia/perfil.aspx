
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="Pyxia.perfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Teste</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/png" href="/assets/images/icon/favicon.ico"/>
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/assets/css/themify-icons.css"/>
    <link rel="stylesheet" href="/assets/css/metisMenu.css"/>
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css"/>
    <link rel="stylesheet" href="/assets/css/slicknav.min.css"/>
   <!-- others css -->
    <link rel="stylesheet" href="/assets/css/typography.css"/>
    <link rel="stylesheet" href="/assets/css/default-css.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/css/styles.css"/>
    <link rel="stylesheet" href="/assets/css/responsive.css"/>
    <link rel="stylesheet" href="css/stylePerfil.css" />
    <!-- modernizr css -->
    <script src="/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body class="">
     <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="index.html">
    <img src="assets/images/Imagem1.png" alt="imagem" /></a>
                </div>
            </div>

            <!-- Classe ti-(um atributo) refere-se a icones contidos no css themify-icons.css -->
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li>
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-desktop"></i><span>Computadores</span></a>
                                <ul class="collapse">
                                    <li><a href="accordion.html">Vazio</a></li>
                                    <li><a href="alert.html">Vazio</a></li>
                                    <li><a href="badge.html">Vazio</a></li>
                                    <li><a href="button.html">Vazio</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="invoice.html" aria-expanded="true"><i class="ti-back-left"></i>
                                    <span>Sair</span></a>
                            </li>                   
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- Titulo da pagina  -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">Home</a></li>
                                <a href="">Dashboard</a>
                            </ul>
                        </div>
                    </div>
                    <!--Configuração da conta, perfil -->
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Olá, Nome do Usuário </h4>
                        </div>
                    </div>
                </div>
            </div>
         
                        
               <!-- Classes responsaveis para resposividade do site e inicialização do processo de formação do grafico-->
                <form id="alterarPerfil" runat="server">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 clearfix">
                                <div class="alterarNome">
                                  <h1>Alterar nome</h1>
                                  <asp:TextBox runat="server" ID="novoNome" placeholder="digite o novo nome" />
                                  <asp:Button runat="server" ID="btnNome" OnClick="btnNome_Click" Text="Enviar" />
                                </div>
                            </div>
                                <div class="col-md-4 col-sm-4 clearfix">
                                     <div class="alterarEmail">
                                         <h1>Alterar e-mail</h1>
                                         <asp:TextBox runat="server" ID="novoEmail" placeholder="digite o novo e-mail" TextMode="Email" />
                                         <asp:Button runat="server" ID="btnEmail" OnClick="btnEmail_Click" Text="Enviar" />
                                     </div>
                                </div>
                           
                               <div class="col-md-4 col-sm-4 clearfix">
                                    <div class="alterarSenha">
                                        <h1>Alterar senha</h1>
                                        <asp:TextBox runat="server" ID="senhaAtual" placeholder="digite sua senha atual" TextMode="Password" />
                                        <asp:TextBox runat="server" ID="senhaNova" placeholder="digite a nova senha" TextMode="Password" />
                                        <asp:Button runat="server" ID="btnSenha" OnClick="btnSenha_Click" Text="Enviar" />
                                    </div>
                              </div>
                        </div>
                    </div>
                </form>
         </div>
    </div>

    <script src="/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="/assets/js/popper.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/owl.carousel.min.js"></script>
    <script src="/assets/js/metisMenu.min.js"></script>
    <script src="/assets/js/jquery.slimscroll.min.js"></script>
    <script src="/assets/js/jquery.slicknav.min.js"></script>

   
    <!-- others plugins -->
    <script src="/assets/js/plugins.js"></script>
    <script src="/assets/js/scripts.js"></script>
</body>
</html>
