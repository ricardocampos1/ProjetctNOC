<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Pyxia.dashboard1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Teste</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/png" href="/assets/images/icon/favicon.ico" />
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/assets/css/themify-icons.css" />
    <link rel="stylesheet" href="/assets/css/metisMenu.css" />
    <link rel="stylesheet" href="/assets/css/slicknav.min.css" />
    <!-- others css -->
    <link rel="stylesheet" href="/assets/css/typography.css" />
    <link rel="stylesheet" href="/assets/css/default-css.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/styles.css"/>
    <link rel="stylesheet" href="/assets/css/responsive.css" />
    <!-- modernizr css -->
    <script src="/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body class="">
    <form runat="server">
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
                                    <a href="invoice.html" aria-expanded="true"><i class="ti-user"></i>
                                        <span>Perfil</span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" aria-expanded="true"><i class="ti-desktop"></i><span>Computadores</span></a>
                                    <asp:DropDownList ID="ddlMachine" runat="server" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                             
                                </li>
                                <li>
                                    <a href="Homepage.aspx" aria-expanded="true"><i class="ti-back-left"></i>
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
                                <div class="nav-btn pull-left">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                                <h4 class="page-title pull-left">Dashboard</h4>
                                <ul class="breadcrumbs pull-left">
                                    <li><a href="index.html">Home</a></li>
                                    <li><span>Dashboard</span></li>
                                </ul>
                            </div>
                        </div>
                        <!--Configuração da conta, perfil -->
                        <div class="col-sm-6 clearfix">
                            <div class="user-profile pull-right">
                                <h4 class="user-name dropdown-toggle" data-toggle="dropdown">
                                    <% string usuario = (string)Session["name_user"];
                                        Response.Write("Bem Vindo: " + usuario); %>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Classes responsaveis para resposividade do site e inicialização do processo de formação do grafico-->
                <div class="row">
                    <div class="col-xl-9 col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="col-lg-8 mt-sm-30 mt-xs-30">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-sm-flex justify-content-center align-items-center">
                                                    <div class="trd-history-tabs">
                                                        <h5 style="padding-bottom: 5px; text-align: center">Windows X51 64 Bits</h5>
                                                        <ul class="nav" role="tablist">
                                                            <li>
                                                                <a class="active" data-toggle="tab" href="#processador" role="tab">Processador</a>
                                                            </li>
                                                            <li>
                                                                <a data-toggle="tab" href="#hard_disk" role="tab">Disco Rigido</a>
                                                            </li>
                                                            <li>
                                                                <a data-toggle="tab" href="#memoria_ram" role="tab">Memória RAM</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="trad-history mt-lg-3">
                                                    <div class="tab-content" id="myTabContent">
                                                        <div class="tab-pane fade show active" id="processador" role="tabpanel">
                                                            <div class="d-sm-flex justify-content-between ">
                                                                <div class="col-lg-7 col-xs-12">
                                                                    <div id="verview-shart">
                                                                        <!--Tag que sera manipulada por todo script para apresentação do grafico-->
                                                                        <canvas class="line-chart" width="900" height="450"></canvas>
                                                                        <!--Biblioteca do Chart.js para apresentação do grafico -->
                                                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
                                                                        <script src ="Scripts/graficoProcessador.js">                                                                            
                                                                        </script>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xl-9 col-lg-8">
                                                                        <div class="card">
                                                                            <div class="col-12">
                                                                                <div class="col-lg-12">
                                                                                    <h4>Processador</h4>
                                                                                    <ul>
                                                                                        <li style="margin-top: 5px">Nome:Aaaaaaaaaaaaaaaaaa </li>
                                                                                        <li style="margin-top: 5px">Nucleos Fisico: 2 </li>
                                                                                        <li style="margin-top: 5px">Nucleos Lógicos: 4</li>
                                                                                        <li style="margin-top: 5px">Temperatura: 43 Cº </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="hard_disk" role="tabpanel">
                                                            <div class="d-sm-flex justify-content-between ">
                                                                <div class="col-lg-7 col-xs-12">
                                                                    <!-- col-xs-(1-12) col-sm col-md col-lg -->
                                                                    <div id="verview-chart2">
                                                                        <canvas class="grafico" id="bar-chart" width="900" height="450"></canvas>
                                                                        <script src ="Scripts/graficoDisco.js">
                                                                        </script>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xl-9 col-lg-8">
                                                                        <div class="card">
                                                                            <div class="col-12">
                                                                                <div class="col-lg-12">
                                                                                    <h4>Disco Rigido</h4>
                                                                                    <ul>
                                                                                        <li style="margin-top: 5px">Nome:Aaaaaaaaaaaaaaaaaa </li>
                                                                                        <li style="margin-top: 5px">Nucleos Fisico: 2 </li>
                                                                                        <li style="margin-top: 5px">Nucleos Lógicos: 4</li>
                                                                                        <li style="margin-top: 5px">Temperatura: 43 Cº </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="memoria_ram" role="tabpanel">
                                                            <div class="d-sm-flex justify-content-between ">
                                                                <div class="col-lg-7 col-xs-12">
                                                                    <div id="verview-xhart">
                                                                        <!--Tag que sera manipulada por todo script para apresentação do grafico-->
                                                                        <canvas class="line" width="900" height="450"></canvas>
                                                                        <!--Biblioteca do Chart.js para apresentação do grafico -->
                                                                        <script src="Scripts/graficoMemoria.js">
                                                                        </script>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xl-9 col-lg-8">
                                                                        <div class="card">
                                                                            <div class="col-12">
                                                                                <div class="col-lg-12">
                                                                                    <h4>Memória RAM</h4>
                                                                                    <ul>
                                                                                        <li style="margin-top: 5px">Nome:Aaaaaaaaaaaaaaaaaa </li>
                                                                                        <li style="margin-top: 5px">Nucleos Fisico: 2 </li>
                                                                                        <li style="margin-top: 5px">Nucleos Lógicos: 4</li>
                                                                                        <li style="margin-top: 5px">Temperatura: 43 Cº </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Gerenciador de Tarefas -->
                    <!--     <div class="row">
                    <div class="col-lg-8 mt-sm-30 mt-xs-30">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-center">
                                    <h4 class="header-title">Lista</h4>
                                    <div class="trd-history-tabs">
                                        <ul class="nav" role="tablist">
                                            <li>
                                                <a class="active" data-toggle="tab" href="#ger_tarefas" role="tab">Gerenciador de Tarefas</a>
                                            </li>
                                        </ul>
                                    </div>
                                   
                                </div>
                                <!--Conteudo que a dentro desta tabela -->
                    <!--     <div class="trad-history mt-4">
                                    <div class="tab-content" id="MyTabContentt">
                                        <div class="tab-pane fade show active" id="ger_tarefas" role="tabpanel">
                                            <div class="table-responsive">
                                                <table class="dbkit-table">
                                                    <tr class="heading-td">
                                                            <td>PID</td>
                                                            <td>Tarefa</td>
                                                            <td>Consumo Processador</td>
                                                            <td>Memória Consumida</td>
                                                        </tr>
                                                        <tr>
                                                            <td>51000</td>
                                                            <td>Chrome</td>
                                                            <td>59%</td>
                                                            <td>47%</td>
                                                        </tr>
                                                        <tr>
                                                            <td>51001</td>
                                                            <td>Visual Studio</td>
                                                            <td>21%</td>
                                                            <td>23%</td>
                                                        </tr>
                                                       <tr>
                                                            <td>51002</td>
                                                            <td>NodeJs</td>
                                                            <td>17%</td>
                                                            <td>21%</td>
                                                        </tr>
                                                       <tr>
                                                            <td>51003</td>
                                                            <td>NotePad</td>
                                                            <td>3%</td>
                                                            <td>9%</td>
                                                        </tr>
                                                       
                                                </table>
                                            </div>
                                        </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
                </div>
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
    </form>
</body>
</html>
