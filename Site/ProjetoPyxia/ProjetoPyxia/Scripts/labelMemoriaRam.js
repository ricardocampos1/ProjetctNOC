setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/getTotalRamUsada',
        dataType: 'json',
        data: '{}',
        success: function (response) {
            document.getElementById("RamUsada").innerHTML = response.d + " GB";
        },
        error: function (xhr, status, error) {
            console.log("Erro RamUsada: " + xhr + ", " + status + ", " + error);
        }
    });
}, 5000);