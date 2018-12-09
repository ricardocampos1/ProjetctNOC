<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Pyxia.dashboard1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Teste</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/assets/css/themify-icons.css" />
    <link rel="stylesheet" href="/assets/css/metisMenu.css" />
    <link rel="stylesheet" href="/assets/css/slicknav.min.css" />
    <!-- others css -->
    <link rel="stylesheet" href="/assets/css/typography.css" />
    <link rel="stylesheet" href="/assets/css/default-css.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/styles.css" />
    <link rel="stylesheet" href="/assets/css/responsive.css" />
    <!-- modernizr css -->
    <script src="/assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <script src="Scripts/labelMemoriaRam.js"> </script>
    <script src="Scripts/labelMemoryRamLivre.js"></script>
    <script src="Scripts/labelTemperature.js"></script>
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
                                        <span style="margin-left: 2.6rem">Perfil</span></a>
                                </li>
                                <li class="ddl-li">
                                    <div style="padding: 2vh; margin-left: 1rem"><i class="ti-desktop"></i></div>
                                    <asp:DropDownList ID="ddlMachine" AutoPostBack="true" runat="server" AppendDataBoundItems="true" CssClass="ddl-menu" OnSelectedIndexChanged="ddlMachine_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </li>
                                <li style="margin-top: 23rem">
                                    <a href="Homepage.aspx" aria-expanded="true"><i class="ti-back-left"></i>
                                        <span style="margin-left: 2.6rem">Sair</span></a>
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
                                        Response.Write("Olá, " + usuario); %>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Classes responsaveis para resposividade do site e inicialização do processo de formação do grafico-->
                <div class="row">
                    <div class="col-xl-9 col-lg-8 mt-sm-30 mt-xs-30">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-sm-flex justify-content-center align-items-center">
                                    <div class="trd-history-tabs ">
                                        <h5 style="padding-bottom: 5px; text-align: center">
                                            <asp:Label Text="" ID="lblNameSO" runat="server" /></h5>
                                        <ul class="nav justify-content-center" role="tablist">
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
                                                        <script src="Scripts/graficoProcessador.js">                                                                            
                                                                        </script>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <div class="col-xl-9 col-lg-8">
                                                        <h4>Processador</h4>
                                                        <ul>
                                                            <li style="margin-top: 5px">Nome:
                                                                <asp:Label Text="" ID="lblNameProcessor" runat="server" />
                                                            </li>
                                                            <li style="margin-top: 5px">Nucleos Fisico:
                                                                <asp:Label Text="" ID="lblPhysicalCore" runat="server" />
                                                            </li>
                                                            <li style="margin-top: 5px">Nucleos Lógicos:
                                                                <asp:Label Text="" ID="lblLogicalCore" runat="server" /></li>
                                                            <li style="margin-top: 5px">Temperatura : 
                                                                <asp:Label Text="" ID="lblTemperatura" runat="server" /></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="hard_disk" role="tabpanel">
                                            <div class="d-sm-flex justify-content-between ">
                                                <div class="col-lg-7 col-xs-12">
                                                    <!-- col-xs-(1-12) col-sm col-md col-lg -->
                                                    <div id="verview-chart2">
                                                        <canvas class="grafico" id="pie-chart" width="900" height="450"></canvas>
                                                        <script src="Scripts/graficoDisco.js"></script>

                                                    </div>
                                                </div>

                                                <div class="card">
                                                    <div class="col-xl-9 col-lg-8">
                                                        <h4>Disco Rigido</h4>
                                                        <ul>
                                                            <li style="margin-top: 5px">Nome:
                                                                <asp:DropDownList runat="server" ID="ddlHardDisk" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlHardDisk_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </li>
                                                            <!-- dropdownlist -->
                                                            <li style="margin-top: 5px">Total:
                                                                <asp:Label Text="" ID="lblTotalSpace" runat="server" />GB</li>
                                                            <li style="margin-top: 5px">Espaço usado:
                                                                <asp:Label Text="" ID="lblUsageSpace" runat="server" />GB</li>
                                                            <li style="margin-top: 5px">Espaço livre:
                                                                <asp:Label Text="" ID="lblFreeSpace" runat="server" />GB</li>
                                                        </ul>
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

                                                <div class="card">
                                                    <div class="col-xl-9 col-lg-8">
                                                        <h4>Memória RAM</h4>
                                                        <ul>
                                                            <li style="margin-top: 5px">Total de memoria:
                                                                    <asp:Label Text="" ID="lblMemoriaTotal" runat="server" />
                                                            </li>
                                                            <li style="margin-top: 5px">Ram usada:
                                                                    <asp:Label Text="" ID="RamUsada" runat="server" />
                                                            </li>
                                                            <li style="margin-top: 5px">Ram livre:
                                                                    <asp:Label Text="" ID="RamLivre" runat="server" /></li>
                                                            <li style="margin-top: 5px"></li>
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
