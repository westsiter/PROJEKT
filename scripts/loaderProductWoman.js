$(document).ready(function () {
    let offset = 0;
    let loading = false;
    let filters = {};

    function loadProducts(reset = false) {
        if (loading) return;
        loading = true;
        $.ajax({
            url: './php/productLoaderWoman.php',
            type: 'post',
            data: { offset: offset, filters: filters },
            success: function (response) {
                if (reset) {
                    $('#productContainer').html(response);  // Załaduj nowe produkty przy resetowaniu
                } else {
                    $('#productContainer').append(response);  // Dodaj więcej produktów
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

    $(document).ready(function () {
        loadProducts();

        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
                loadProducts();
            }
        });

        $('#containerFiltr').submit(function (e) {
            e.preventDefault();
            offset = 0;  // Resetujemy offset
            filters = {
                kategoria: $('#kategoria').val() || '',  // Dodano || '' aby nie wysyłać pustych wartości
                kolor: $('#kolor').val() || '',
                rozmiar: $('#rozmiar').val() || '',
                minPrice: $('#input-min').val() || '',
                maxPrice: $('#input-max').val() || ''
            };
            $('#productContainer').empty();  // Czyścimy kontener produktów
            loadProducts(true);  // Resetujemy produkty
        });

        $('#resetFiltr').click(function (e) {
            e.preventDefault();
            location.reload();  // Odśwież całą stronę
        });
    });
});