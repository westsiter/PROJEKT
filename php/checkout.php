<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Toronto - Sklep z odzieżą</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../images/icon.png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../style/styleShop.css">
    <link rel="stylesheet" href="../style/styleShopNew.css">
    <link rel="stylesheet" href="../style/styleCheckout.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Reddit+Mono:wght@200..900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="description" content="Toronto - strona z najlepszymi ubraniami">
    <meta name="author" content="Łukasz Pikuła">
</head>
<body>
    <?php 
        include ('dbconection.php');
        include ('shopHeader.php');
    ?>
    <div class="checkout-container">
        <form id="checkoutForm" action="processOrder.php" method="post">
            <label for="firstName">Imię:</label>
            <input type="text" id="firstName" name="firstName" required>
            <label for="lastName">Nazwisko:</label>
            <input type="text" id="lastName" name="lastName" required>
            <label for="address">Adres:</label>
            <input id="address" name="address" required>
            <label for="postalCode">Kod pocztowy:</label>
            <input type="text" id="postalCode" name="postalCode" required>
            <label for="phoneNumber">Numer telefonu:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" required>
            <label for="paymentMethod">Metoda płatności:</label>
            <select id="paymentMethod" name="paymentMethod" required>
                <option value="credit_card">Karta kredytowa</option>
                <option value="paypal">PayPal</option>
                <option value="bank_transfer">Przelew bankowy</option>
            </select>
            <button type="submit">Złóż zamówienie</button>
        </form>
    </div>
</body>
</html>
