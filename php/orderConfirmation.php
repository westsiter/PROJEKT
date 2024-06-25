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
    <div class="confirm">
        <p>Dziękujemy za złożenie zamówienia. Twój numer zamówienia to: <?php echo $_GET['orderId']; ?>.</p>
    </div>

    <script>
        setTimeout(function() {
            window.location.href = '../shop.php';
        }, 2000);
    </script>

</body>
</html>
