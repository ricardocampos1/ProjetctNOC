setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/getTemperatura',
        dataType: 'json',
        data: '{}',
        success: function (response) {
            console.log("temperatura: " + response.d);
            document.getElementById("lblTemperatura").innerHTML = response.d + " Cº";
        },
        error: function (xhr, status, error) {
            alert(error);
            console.log('tchau');
        }
    });
}, 5000);