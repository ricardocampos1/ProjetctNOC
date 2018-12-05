﻿new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
        labels: ["A definir", "A definir", "A definir", "A definir", "A definir"],
        datasets: [
            {
                label: "Processador",
                backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f", "#e8c3b9", "#c45850"],
                data: [2478, 5267, 734, 784, 433]
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