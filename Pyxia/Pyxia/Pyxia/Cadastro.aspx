<%@ Page Title="" Language="C#" MasterPageFile="~/Pyxia.Master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Pyxia.Cadastro" %>

<asp:Content ID="Conteudo" ContentPlaceHolderID="Conteudo" runat="server">
    
    <div>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styleCadastro.css">
        <link href="https://fonts.googleapis.com/css?family=Text+Me+One" rel="stylesheet">
    </div>


    <div id="id02" class="modalx">

        <form class="modal-content" id="regForm" runat="server">
            <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
            <div class="container">
                <h1>Cadastro:</h1>
                <%-- One "tab" for each step in the form:--%>
                <div class="tab">
                    
    <p>
        <asp:TextBox runat="server" placeholder="Nome Completo..." oninput="this.className = ''" name="cnname"/></p>
                    <p>
                        <input placeholder="Nome de Usuário..." oninput="this.className = ''" name="usname"></p>
                </div>
                <div class="tab">
                    Informações de Contato:
    <p>
        <input placeholder="E-mail..." oninput="this.className = ''" name="email"></p>

                    <p>
                        <asp:TextBox runat="server" placeholder="Confirmar E-mail..."  />  
                        <input placeholder="Confirma E-mail..." oninput="this.className = ''" name="cemail"></p>
                </div>
                <div class="tab">
                    Aniversário:
    <input placeholder="Data de Nascimento" class="input--style-2" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="date">
                </div>
                <div class="tab">
                    Informações de Endereço:
      <p>
          <input class="input--style-4" type="text" maxlength="10" placeholder="CEP" name="CEP"></p>
                    <div class="rs-select2 js-select-simple select--no-search">
                        <select class="input--style-5 ajuste">
                            <option disabled="disabled" selected="selected">UF</option>
                            <option value="AL">AL</option>
                            <option value="AM">AM</option>
                            <option value="AP">AP</option>
                            <option value="BA">BA</option>
                            <option value="CE">CE</option>
                            <option value="DF">DF</option>
                            <option value="ES">ES</option>
                            <option value="GO">GO</option>
                            <option value="MA">MA</option>
                            <option value="MG">MG</option>
                            <option value="MS">MS</option>
                            <option value="MT">MT</option>
                            <option value="PA">PA</option>
                            <option value="PB">PB</option>
                            <option value="PE">PE</option>
                            <option value="PI">PI</option>
                            <option value="PR">PR</option>
                            <option value="RJ">RJ</option>
                            <option value="RN">RN</option>
                            <option value="RD">RD</option>
                            <option value="RR">RR</option>
                            <option value="RS">RS</option>
                            <option value="SC">SC</option>
                            <option value="SE">SE</option>
                            <option value="SP">SP</option>
                            <option value="TO">TO</option>
                        </select>
                    </div>
                    <p>
                        <input class="input--style-3" type="text" maxlength="30" placeholder="Rua" name="Rua"></p>
                    <p>
                        <input class="input--style-3" type="text" maxlength="50" placeholder="Complemento" name="Complemento"></p>

                </div>
                <div class="tab">
                    Senha:
    <p>
        <input placeholder="Senha..." oninput="this.className = ''" name="pword" type="password"></p>
                    <p>
                        <input placeholder="Confirma Senha..." oninput="this.className = ''" name="pword" type="password"></p>
                </div>
                <div style="overflow: auto;">
                    <div style="float: right;">
                        <button type="button" id="prevBtn" onclick="nextPrev(-1)">Voltar</button>
                        <button type="button" id="nextBtn" onclick="nextPrev(1)">Próximo</button>
                        <asp:Button Text="Próximo" runat="server" ID="btnNext" OnClick="btnNext_Click" />
                        
                            
                    </div>
                </div>
                <%-- Circles which indicates the steps of the form: --%>
                <div style="text-align: center; margin-top: 40px;">
                    <span class="step"></span>
                    <span class="step"></span>
                    <span class="step"></span>
                    <span class="step"></span>
                </div>
            </div>
        </form>
    </div>

    <script>
        var currentTab = 0; <%--Current tab is set to be the first tab(0)--%>
        showTab(currentTab); <%--Display the crurrent tab--%>

        function showTab(n) {
  <%--This function will display the specified tab of the form...--%>
            var x = document.getElementsByClassName("tab");
            x[n].style.display = "block";
 <%--...and fix the Previous / Next buttons:--%>
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
            }
            if (n == (x.length - 1)) {
                document.getElementById("nextBtn").innerHTML = "Cadastrar";
            } else {
                document.getElementById("nextBtn").innerHTML = "Próximo";
            }
 <%--...and run a function that will display the correct step indicator:--%>
            fixStepIndicator(n)
        }

        function nextPrev(n) {
  <%--This function will figure out which tab to display--%>
    var x = document.getElementsByClassName("tab");
<%--Exit the function if any field in the current tab is invalid:--%>
    if (n == 1 && !validateForm()) return false;
  <%--Hide the current tab:--%>
    x[currentTab].style.display = "none";
  <%--Increase or decrease the current tab by 1:--%>
    currentTab = currentTab + n;
 <%--if you have reached the end of the form...--%>
    if (currentTab >= x.length) {
 <%--...the form gets submitted:--%>
        document.getElementById("regForm").submit();
        return false;
    }
  <%--Otherwise, display the correct tab:--%>
            showTab(currentTab);
        }

        function validateForm() {
  <%--This function deals with validation of the form fields--%>
    var x, y, i, valid = true;
    x = document.getElementsByClassName("tab");
    y = x[currentTab].getElementsByTagName("input");
  <%--A loop that checks every input field in the current tab:--%>
    for (i = 0; i < y.length; i++) {
  <%--If a field is empty..--%>
      if (y[i].value == "") {
      <%--add an "invalid" class to the field:--%>
        y[i].className += " invalid";
     <%--and set the current valid status to false--%>
            valid = false;
        }
    }
  <%--If the valid status is true, mark the step as finished and valid:--%>
    if (valid) {
        document.getElementsByClassName("step")[currentTab].className += " finish";
    }
    return valid; <%--return the valid status--%>
        }

        function fixStepIndicator(n) {
  <%--This function removes the "active" class of all steps..--%>
    var i, x = document.getElementsByClassName("step");
    for (i = 0; i < x.length; i++) {
        x[i].className = x[i].className.replace(" active", "");
    }
  <%--...and adds the "active" class on the current step:--%>
            x[n].className += " active";
        }
<%--Get the modal--%>

</script>

   

</asp:Content>

