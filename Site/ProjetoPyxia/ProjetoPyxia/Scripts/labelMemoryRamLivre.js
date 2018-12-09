setInterval(() => {
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: 'PaginaAjax.aspx/getTotalRamLivre',
        dataType: 'json',
        data: '{}',
        success: function (response) {
            document.getElementById("RamLivre").innerHTML = response.d + " GB";
        },
        error: function (xhr, status, error) {
            alert(error);
            console.log('tchau');
        }
    });
}, 5000);