<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Pyxia.dashboard" %>

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
                    <a href="index.html"><p>PYXIA</p></a>
                </div>
            </div>

            <!-- Classe ti-(um atributo) refere-se a icones contidos no css themify-icons.css -->
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li class="active">
                                <a href="javascript:void(0)" aria-expanded="true"><span>Comunidade</span></a>
                               
                            </li>
                            <li>
                                <a href="invoice.html" aria-expanded="true"><i class="ti-receipt"></i>
                                    <span>Relatórios</span></a>
                            </li>
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
            <!-- header area start -->
            <div class="header-area">
                <div class="row align-items-center">
                    <!-- Nav dos menus-->
                    <div class="col-md-6 col-sm-8 clearfix">
                        <div class="nav-btn pull-left">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                     </div>
                    <!-- Para mudar formato da tela para fullsc -->
                    <div class="col-md-6 col-sm-4 clearfix">
                        <ul class="notification-area pull-right">
                            <li id="full-view"><i class="ti-fullscreen"></i></li>
                            <li id="full-view-exit"><i class="ti-zoom-out"></i></li>     
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Titulo da pagina  -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
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
                            <img class="avatar user-thumb" src="/assets/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Nome do Usuário <i class="fa fa-angle-down"></i></h4>
                            <!--Lista para configurações do perfil e suporte -->
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Suporte</a>
                                <a class="dropdown-item" href="#">Configurações</a>
                                <a class="dropdown-item" href="#">Sair</a>
                            </div>
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
                                                <div class="d-sm-flex justify-content-between align-items-center">
                                                    <h4 class="header-title">Graficos</h4>
                                                    <div class="trd-history-tabs">
                                                        <ul class="nav" role="tablist">
                                                            <li>
                                                                <a class="active" data-toggle="tab" href="#processador" role="tab">Processador</a>
                                                            </li>
                                                            <li>
                                                                <a data-toggle="tab" href="#memoria_ram" role="tab">Memória RAM</a>
                                                            </li>
                                                            <li>
                                                                    <a data-toggle="tab" href="#hard_disk" role="tab">Disco Rigido</a>   
                                                             </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                
                                <div class="trad-history mt-4">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="processador" role="tabpanel">
                                                <div id="verview-shart">
                                                    <!--Tag que sera manipulada por todo script para apresentação do grafico-->
                                                    <canvas class="line-chart" width="400" height="300"></canvas>
                                                    <!--Biblioteca do Chart.js para apresentação do grafico -->
                                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
                                                    <script>
                                                        //Variavel javascript que faz referencia com a tag line-chart( para apresentação do grafico)
                                                        var ctx = document.getElementsByClassName("line-chart");
                                                        // Variavel necessaria para criação do grafico
                                                        var LinhaGrafico = new Chart(ctx,{
                                                            // Colocar o tipo do grafico
                                                            type: 'line',
                                                            // Conteudos apresentados nestes graficos
                                                            data: {
                                                            //legenda linha horizontal
                                                            labels: ["10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"],
                                                            datasets: [{
                                                                //Legenda referente ao dado
                                                                label: "Teste Grafico Dashboard",
                                                                //Dados em relação ao conteudo acima
                                                                data:[1,5,6,9,0,0,0,0,0,1,9],
                                                                borderWidht: 3,
                                                                borderColor: "rgba(15,259,989)",
                                                                background:"transparent",
                                                                }]
                                                            }
                                                        });
                                                    </script>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="memoria_ram" role="tabpanel">
                                            <div id="verview-chart2">
                                                 <canvas id="pizza" width="800" height="450"></canvas>
                                                    <script>
                                                    new Chart(document.getElementById("pizza"), {
                                                       type: 'pie',
                                                        data: {
                                                        
                                                         labels: ["Memoria Disponivel", "Memoria em Uso"],
                                                         datasets: [{
                                                           label: "Informações Memoria",
                                                           backgroundColor: ["#3e95cd", "#8e5ea2"],
                                                           data: [20,80]
                                                         }]
                                                        },                                                                                                              
                                                    });
                                                    
                                                    </script>
                                                </div>
                                        </div>
                                        <div class="tab-pane fade" id="hard_disk" role="tabpanel">
                                            <div id="verview-chart">
                                                
                                                  <canvas id="teste" width="400" height="300"></canvas>
                                                    <script>
                                                    var ctx = document.getElementById("teste").getContext('2d');
                                                    var teste = new Chart(ctx, {
                                                        type: 'bar',
                                                        data: {
                                                            labels: ["Vermelho", "Azul", "Amarelo"],
                                                            datasets: [{
                                                                label: ["Total"],
                                                                data: [12, 19, 3],
                                                                backgroundColor: [
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                ],
                                                                borderColor: [
                                                                    'rgba(255,99,132,1)',
                                                                    'rgba(54, 162, 235, 1)',
                                                                    'rgba(255, 206, 86, 1)',
 
                                                                ],
                                                                borderWidth: 1
                                                            }]
                                                        },
                                                        options: {
                                                            title: {
                                                                display: true,
                                                                text: "Referente a algo", 
                                                            },
                                                            scales: {
                                                                yAxes: [{
                                                                    ticks: {
                                                                        beginAtZero:true
                                                                    }
                                                                }]
                                                            }
                                                        }
                                                    });
                                                    </script>
                                                                                                                
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
                <div class="row">
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
                                <div class="trad-history mt-4">
                                    <div class="tab-content" id="MyTabContentt">
                                        <div class="tab-pane fade show active" id="ger_tarefas" role="tabpanel">
                                            <div class="table-responsive">
                                                <table class="dbkit-table">
                                                    <tr class="heading-td">
                                                            <td>Tarefa</td>
                                                            <td>Processador</td>
                                                            <td>Memoria RAM</td>
                                                            <td>Disco Rigido</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Chrome</td>
                                                            <td>Velocidade de Processamento</td>
                                                            <td>Espaço Ocupado</td>
                                                            <td>Espaço Ocupado</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Cortana</td>
                                                            <td>Velocidade de Processamento</td>
                                                            <td>Espaço Ocupado</td>
                                                            <td>Espaço Ocupado</td>
                                                        </tr>
                                                       
                                                </table>
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
            <!-- Inicio do footer-->
                <div class="row mt-5">
                   
        <footer>
            <div class="footer-area">
                <p> Alguma coisa que eu esqueci o nome sobre PowerBy.</p>
            </div>
        </footer>
        <!-- Termino do footer-->
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
