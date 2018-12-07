new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
        labels: [],
        datasets: [
            {
                label: "Porcentagem de uso do HD",
                backgroundColor: ["#3e95cd"],
                data: []
            }
        ]
    },
    options: {
        legend: { display: false },
        title: {
            display: true,
            text: 'Desempenho processador'
        }
    }
});