new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
        labels: ["Espaço disponivel", "Espaço em uso"],
        datasets: [{
            label: "Informações do HD",
            backgroundColor: ["#3e95cd", "#8e5ea2"],
            data: {}
        }]
    }
});

