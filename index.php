<?php
session_start();

if (!isset($_COOKIE['page_visits'])) {
    $visits = 1;
} else {
    $visits = $_COOKIE['page_visits'] + 1;
}
setcookie('page_visits', $visits, time() + (86400 * 30)); // 30 dni
?>
<!DOCTYPE html>

<html lang="pl-PL">

<head>
    <title>Toronto - Sklep z odzieżą</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/icon.png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./style/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Reddit+Mono:wght@200..900&display=swap" rel="stylesheet">

    <meta charset="UTF-8">
    <meta name="description" content="Toronto - strona z najlepszymi ubraniami">
    <meta name="author" content="Łukasz Pikuła">
</head>

<body>
    <header>
        <div id="logo">
            <a href="index.html"><img src="../images/logoW.png" width="150px" height="45px"></a>
        </div>
        <input type="checkbox" id="check">
        <label for="check" class="icons">
            <i class='bx bx-menu' id="menu-icon"></i>
            <i class='bx bx-x' id="close-icon"></i>
        </label>
        <div id="navbar">
            <a href="#">O nas</a>
            <a href="#">Kontakt</a>
            <a href="#">opinie</a>
            <a href="shop.php"><i class='bx bx-shopping-bag'></i> Sklep</a>
        </div>
    </header>
    <div class="about">
        <div id="logos">
            <img src="../images/logoW.png">
        </div>
        <div id="inspire">
            <p>Remember Who You Wanted To Be</p>
        </div>
    </div>
    <div id="description">
        Polskie przedsiębiorstwo będące jednym z największych na świecie producentów obuwia, odzieży i akcesoriów
        sportowych.
        Toronto, Inc. Założone w 1964 w Washington County jako Blue Ribbon Sports przez Billa Bowermana i Philipa
        Knighta, który do 2004 był prezesem koncernu.
        Jej nazwa pochodzi od znanego w Kanadzie miasta mody Toronto
    </div>
    <div id="contact">
        <div id="contactMenu">
            <a href="https://www.facebook.com"><i class='bx bxl-facebook-circle' id="fb"></i></a>
            <a href="https://www.instagram.com"><i class='bx bxl-instagram' id="ig"></i></a>
            <a href="https://www.whatsapp.com"><i class='bx bxl-whatsapp' id="ws"></i></a>
            <a href="https://www.gmail.com"><i class='bx bxl-gmail' id="mail"></i></a>
            <a href="123456789"><i class='bx bxs-phone' id="phone"></i></a>
            <a href="https://www.telegram.com"><i class='bx bxl-telegram' id="tg"></i></i></a>
        </div>
    </div>
    <footer>
        <div id="author">&copy; Łukasz Pikuła<br> Polsko-Japońska Akademia Technik Komputerowych w Gdańsku</div>
    </footer>
</body>
</html5>