//Variavel javascript que faz referencia com a tag line-chart( para apresentação do grafico)
var ctx = document.getElementsByClassName("line-chart");
// Variavel necessaria para criação do grafico
var LinhaGrafico1 = new Chart(ctx, {
    // Colocar o tipo do grafico
    type: 'line',
    // Conteudos apresentados nestes graficos
    data: {
        //legenda linha horizontal
        labels: [],
        datasets: [{
            //Legenda referente ao dado
            label: "Uso em porcentagem x Horario",
            //Dados em relação ao conteudo acima
            data: [],
            borderWidht: 3,
            borderColor: "rgba(15,259,989)",
            background: "transparent",
        }]
    }
});
setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/GetUltimoProcessador',
        dataType: 'json',
        data: '{}',
        success: function (data) {
            LinhaGrafico1.data.datasets[0].data.push(data.d);
            LinhaGrafico1.data.labels.push(new Date().getHours() + ":" + new Date().getMinutes() + ":" + new Date().getSeconds());
            if (LinhaGrafico1.data.labels.length > 25) {
                LinhaGrafico1.data.datasets[0].data.shift(0);
                LinhaGrafico1.data.labels.shift();
            }
            LinhaGrafico1.update();
        },
        error: function (xhr, status, error) {
            alert(error)
            console.log('tchau')
        }
    });
}, 5000);
