<?php
session_start();

include (__DIR__ . '/dbconection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $con->prepare("SELECT haslo, imie FROM users WHERE mail = ?");
    $stmt->bind_param("s", $email);

    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($hashed_password, $imie);
        $stmt->fetch();
        $imie = ucfirst($imie);
        if (password_verify($password, $hashed_password)) {
            $_SESSION['loggedin'] = true;
            $_SESSION['email'] = $email;
            $_SESSION['imie'] = $imie; // Sprawdź, czy $imie jest prawidłowo pobierane z bazy danych
            echo "<script>document.getElementById('password-error').innerHTML='Zalogowano pomyślnie';</script>";
            echo "<script>document.getElementById('rightNav').style.display = 'none'; </script>";
        } else {
            echo "<script>document.getElementById('password-error').innerHTML='Błędne hasło';</script>";
        }
    } else {
        echo "<script>document.getElementById('password-error').innerHTML='Nie znaleziono użytkownika';</script>";
    }

    $stmt->close();
}
$con->close();
?>
<header>
    <div id="logo">
        <a href="../index.php"><img src="../images/logoShop.png" width="150px" height="45px"></a>
    </div>
    <div id="navbar">
        <div id="leftNav">
            <a href="../shop.php" class="border">Nowości</a>
            <a href="../meski.php" class="border">Mężczyźni</a>
            <a href="../damski.php" class="border">Kobiety</a>
            <a href="../dzieci.php" class="border">Dzieci</a>
        </div>
        <div id="rightNav">
            <?php
            if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true) {
                if (isset($_SESSION['imie'])) {
                    echo "<a href='cart.php' id='xd'><i class='bx bx-shopping-bag' id='shoppingBag'></i></a>";
                    echo "<a href='#' class='log'>Witaj, " . htmlspecialchars($_SESSION['imie']) . "</a>";
                    echo "<div id='loop'>
                    <i class='bx bx-search'></i>
                    <input type='text' id='search-input' placeholder='Szukaj produktów...'>
                    </div>";
                }
                echo "<a href='../php/logout.php' class='log'>Wyloguj się</a>";
            } else {
                echo "<a href='#' class='log' onclick='openPU()' id='loged'><i class='bx bx-user'></i>Zaloguj się</a>";
                echo "<a href='../php/register.php' class='log' id='loged2'><i class='bx bx-edit'></i>Rejestracja</a>";
                echo "<div id='loop'>
                <i class='bx bx-search'></i>
                <input type='text' id='search-input' placeholder='Szukaj produktów...'>
                </div>";
            }
            ?>
        </div>
    </div>

</header>
<div id="searchResults"></div>
<div id="container">
    <form id="login" method="POST">
        <i class='bx bxs-user' id="iconLogin"></i>
        <i class='bx bx-x' id='closePU' onclick='closePopup()'></i>
        <div id='sLogin'>
            <label id='email-label'>E-mail</label>
            <input type='text' spellcheck='false' id='email-field' name='email' onkeyup='validateEmail()'>
            <span id='email-error'></span>
        </div>
        <div id='sPassword'>
            <label id='password-label'>Hasło</label>
            <input type='password' spellcheck='false' name='password' id='password-field' placeholder=' '>
            <span id='password-error'></span>
        </div>
        <button id='enterLogin'>Zaloguj się!</button>
    </form>
</div>

<script src='../scripts/login.js'></script>
<script src="../scripts/search.js"></script>
