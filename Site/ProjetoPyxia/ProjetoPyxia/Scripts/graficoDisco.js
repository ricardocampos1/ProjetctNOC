var available = 0;
var usage = 0;

var ctx = document.getElementById("pie-chart");

var PieChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: [" Espaço disponivel", " Espaço em uso"],
        datasets: [{
            label: "Informações do HD",
            backgroundColor: ["#3e95cd", "#8e5ea2"],
            data: [available, usage]
        }]
    }
});

setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/getHardDiskLivreGrafico',
        dataType: 'json',
        data: '{}',
        success: function (data) {
            data.d = data.d.replace(",", ".");
            PieChart.data.datasets[0].data[0] = parseFloat(data.d);
            PieChart.update();
        },
        error: function (xhr, status, error) {
            console.log("Erro HardDiskLivreGrafico: " + xhr + ", " + status + ", " + error);
        }
    });
}, 5000);

setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/getHardDiskUsadoGrafico',
        dataType: 'json',
        data: '{}',
        success: function (data) {
            data.d = data.d.replace(",", ".");
            PieChart.data.datasets[0].data[1] = parseFloat(data.d);
            PieChart.update();
        },
        error: function (xhr, status, error) {
            console.log("Erro HardDiskUsadoGrafico: " + xhr + ", " + status + ", " + error);
        }
    });
}, 5000);
