$(document).ready(function () {
    $('#buyNow').click(function() {
        window.location.href = '../php/checkout.php';
    });
    function loadCart() {
        $.ajax({
            type: 'POST',
            url: '../php/getCartItems.php',
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    var items = response.items;
                    var cartItems = $('#cartItems');
                    var totalQuantity = response.totalQuantity || 0;
                    var totalPrice = response.totalPrice || 0;

                    cartItems.empty();

                    if (items.length > 0) {
                        items.forEach(function (item) {
                            var itemTotalPrice = item.cena * item.quantity;
                            cartItems.append(
                                '<tr data-product-id="' + item.product_id + '">' +
                                '<td><img src="' + item.zdjecie + '" alt="' + item.nazwa + '"></td>' +
                                '<td>' + item.nazwa + '</td>' +
                                '<td>' + item.cena + ' zł</td>' +
                                '<td><input type="number" class="quantity-input" value="' + item.quantity + '" min="1"></td>' +
                                '<td>' + itemTotalPrice + ' zł</td>' +
                                '<td><button class="btn btn-remove">Usuń</button></td>' +
                                '</tr>'
                            );
                        });

                        $('#totalQuantity').text(totalQuantity);
                        $('#totalPrice').text(totalPrice + ' zł');
                    } else {
                        cartItems.append('<tr><td colspan="6">Twój koszyk jest pusty.</td></tr>');
                    }
                } else {
                    alert('Błąd: ' + response.message);
                }
            },
            error: function () {
                alert('Wystąpił błąd podczas ładowania koszyka.');
            }
        });
    }

    loadCart();

    $('#cartItems').on('change', '.quantity-input', function () {
        var row = $(this).closest('tr');
        var productId = row.data('product-id');
        var quantity = $(this).val();

        $.ajax({
            type: 'POST',
            url: '../php/updateCartItem.php',
            data: { productId: productId, quantity: quantity },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    loadCart();
                } else {
                    alert('Błąd: ' + response.message);
                }
            },
            error: function () {
                alert('Wystąpił błąd podczas aktualizacji koszyka.');
            }
        });
    });

    $('#cartItems').on('click', '.btn-remove', function () {
        var row = $(this).closest('tr');
        var productId = row.data('product-id');

        $.ajax({
            type: 'POST',
            url: '../php/updateCartItem.php',
            data: { productId: productId, quantity: 0 },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    loadCart();
                } else {
                    alert('Błąd: ' + response.message);
                }
            },
            error: function () {
                alert('Wystąpił błąd podczas aktualizacji koszyka.');
            }
        });
    });
    $('#promotion').on('input', function () {
        var promotionCode = $(this).val();
        if (promotionCode === '') {
            loadCart();
        } else {
            verifyPromotionCode(promotionCode);
        }
    });
    function verifyPromotionCode(promotionCode) {
        $.ajax({
            type: 'POST',
            url: '../php/verifyPromotionCode.php',
            data: { promotionCode: promotionCode },
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    $('#totalPrice').text(response.discountedPrice + ' zł');
                    $('#promotion').css('border-color', 'green');
                } else {
                    $('#promotion').css('border-color', 'red');
                }
            },
            error: function () {
                alert('Wystąpił błąd podczas weryfikacji kodu promocyjnego.');
            }
        });
    }
});