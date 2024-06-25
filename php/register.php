<!DOCTYPE HTML>
<html lang="pl-PL">

<head>
    <title>Toronto - Sklep z odzieżą</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../images/icon.png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../style/styleRegister.css">
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
            <a href="../shop.php"><img src="../images/logoShop.png" width="250px" height="95px"></a>
        </div>
        <p id="p1">
            Dołącz Do Nas!
        </p>
        <p id="p2">
            Wpisz Dane Do Rejestracji
        </p>
    </header>
    <div id="boxForm">
        <form method="POST" action="">
            <input type="text" placeholder="imię" id="name" name="name" onfocusout="checkName()" required>
            <p id="checkName"></p>
            <input type="text" placeholder="nazwisko" id="surname" name="surname" onfocusout="checkSurname()" required>
            <p id="checkSurname"></p>
            <input type="email" placeholder="adres e-mail" id="email" name="email" onfocusout="checkEmail()" required>
            <p id="checkEmail"></p>
            <input type="password" placeholder="hasło" id="password" name="password" onfocusout="checkPassword()"
                required>
            <p id="checkPassword"></p>
            <input type="password" placeholder="powtórz hasło" id="password2" name="password2"
                onfocusout="checkPassword2()" required>
            <p id="checkPassword2"></p>
            <div id="politics">Rejestrując się akceptujesz <a href="regulamin.html">regulamin</a><br> oraz <a
                    href="regulamin.html">polityke prywatności!</a></div>
            <button type="submit" id="submit">Zarejestruj się!</button>
            <p id="error"></p>
            <p id="error2"></p>
        </form>
    </div>
    <?php
    include ('../php/registerPHP.php');
    ?>
    <script src="../scripts/register.js"></script>
</body>

</html>