setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/getTotalRamUsada',
        dataType: 'json',
        data: '{}',
        success: function (response) {
            console.log(response.d)
            document.getElementById("RamUsada").innerHTML = response.d + " GB"
        },
        error: function (xhr, status, error) {
            alert(error)
            console.log('tchau')
        }
    });
}, 5000);