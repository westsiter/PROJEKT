<div id="NewContainer">
    <div id="NewContent">
        <video autoplay loop muted plays-inline class="background-clip">
            <source src="../images/bgvideoNews.mp4" type="video/mp4" height="2px">
        </video>
        <h1>Nasze nowości</h1>
    </div>
</div>
<div id="LastProductContainer">
    <?php
    include ('dbconection.php');
    // Wykonaj zapytanie SQL, aby pobrać ostatnie trzy rekordy z tabeli
    $sql = "SELECT nazwa, cena, zdjecie FROM polecane";
    $result = $con->query($sql);

    // Sprawdź, czy zapytanie zwróciło wyniki
    if ($result->num_rows > 0) {
        // Wyświetl wyniki
        while ($row = $result->fetch_assoc()) {
            echo "<div id='LastProductCard'>";
            echo "<img src='" . $row['zdjecie'] . "' alt='" . $row['nazwa'] . "' id='zdjecieCards'>";
            echo "<p id='nazwa' > " . $row['nazwa'] . "</p>";
            echo "<p id='cena'>Cena: " . $row['cena'] . "zł</p>";
            echo "</div>";
        }
    } else {
        echo "Brak rekordów do wyświetlenia.";
    }

    // Zwolnij zasoby i zamknij połączenie z bazą danych
    $result->free_result();
    $con->close();
    ?>

</div>

<footer>
    <p id="firma">Polsko Japońska Akademia Technik Komputerowych w Gdańsku </p>
    <p id="regulamin"><a href="regulamin.html">Regulamin i polityka prywatności strony</a></p>
    <p id="author"> &copy, 2024 Łukasz Pikuła</p></p>
</footer>