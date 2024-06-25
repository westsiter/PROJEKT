$(document).ready(function () {
    let offset = 0;
    let loading = false;
    let filters = {};

    function loadProducts(reset = false) {
        if (loading) return;
        loading = true;
        $.ajax({
            url: './php/productLoaderMan.php',
            type: 'POST',
            data: { offset: offset, filters: filters },
            success: function (response) {
                console.log("AJAX Response:", response); // Log response

                if (reset) {
                    $('#productContainer').html(response);
                } else {
                    $('#productContainer').append(response);
                }
                if (response.trim() !== "Brak kolejnych rekordów do wyświetlenia.") {
                    offset++;
                    loading = false;
                } else {
                    if (reset) {
                        $('#productContainer').html("<p>Brak produktów spełniających kryteria.</p>");
                    }
                    $(window).off('scroll');
                }
            },
            error: function () {
                loading = false;
            }
        });
    }

    loadProducts();

    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
            loadProducts();
        }
    });

    $('#containerFiltr').submit(function (e) {
        e.preventDefault();
        offset = 0;
        filters = {
            kategoria: $('#kategoria').val() || '',
            kolor: $('#kolor').val() || '',
            rozmiar: $('#rozmiar').val() || '',
            minPrice: $('#input-min').val() || '',
            maxPrice: $('#input-max').val() || ''
        };
        console.log("Filters:", filters); // Log filters

        $('#productContainer').empty();
        loadProducts(true);
    });

    $('#resetFiltr').click(function (e) {
        e.preventDefault();
        location.reload();
    });
});
