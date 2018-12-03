//Variavel javascript que faz referencia com a tag line-chart( para apresentação do grafico)
var ctx = document.getElementsByClassName("line");
// Variavel necessaria para criação do grafico
var LinhaGrafico = new Chart(ctx, {
    // Colocar o tipo do grafico
    type: 'line',
    // Conteudos apresentados nestes graficos
    data: {
        //legenda linha horizontal
        labels: ["10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%"],
        datasets: [{
            //Legenda referente ao dado
            label: "Teste Grafico Dashboard",
            //Dados em relação ao conteudo acima
            data: [1, 5, 6, 9, 0, 0, 0, 0, 0, 1, 9],
            borderWidht: 3,
            borderColor: "rgba(15,259,989)",
            background: "transparent",
        }]
    }
});