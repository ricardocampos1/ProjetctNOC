setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/getTemperatura',
        dataType: 'json',
        data: '{}',
        success: function (response) {
            document.getElementById("lblTemperatura").innerHTML = response.d + " Cº";
        },
        error: function (xhr, status, error) {
            console.log("Erro temperatura: " + xhr + ", " + status + ", " + error);
        }
    });
}, 5000);