
<?php include 'templates/header.php'; ?>
<?php include 'db.php'; ?>

<?php
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nazwa = $_POST['nazwa'];
    $cena = $_POST['cena'];
    $opis = $_POST['opis'];
    $kolor = $_POST['kolor'];
    $kategoria = $_POST['kategoria'];
    $rozmiar = $_POST['rozmiar'];
    $plec = $_POST['plec'];
    $zdjecie = $_FILES['zdjecie']['name'];
    $target = "../uploads/" . basename($zdjecie);
    
    if (move_uploaded_file($_FILES['zdjecie']['tmp_name'], $target)) {
        $sql = "INSERT INTO produkty (nazwa, cena, opis, zdjecie, kolor, kategoria, rozmiar, plec) VALUES ('$nazwa', '$cena', '$opis', '$target', '$kolor', '$kategoria', '$rozmiar', '$plec')";
        if ($conn->query($sql) === TRUE) {
            echo "Nowy produkt dodany pomyślnie";
        } else {
            echo "Błąd: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Nie udało się przesłać zdjęcia";
    }
}
?>

<h2>Dodaj Nowy Produkt</h2>
<form action="add_product.php" method="post" enctype="multipart/form-data">
    <label for="nazwa">Nazwa:</label>
    <input type="text" name="nazwa" required>
    
    <label for="cena">Cena:</label>
    <input type="number" step="0.01" name="cena" required>
    
    <label for="opis">Opis:</label>
    <textarea name="opis" required></textarea>
    
    <label for="kolor">Kolor:</label>
    <input type="text" name="kolor" required>
    
    <label for="kategoria">Kategoria:</label>
    <input type="text" name="kategoria" required>
    
    <label for="rozmiar">Rozmiar:</label>
    <input type="text" name="rozmiar" required>
    
    <label for="plec">Płeć:</label>
    <select name="plec" required>
        <option value="meski">Mężczyzna</option>
        <option value="damski">Kobieta</option>
        <option value="dzieci">Dzieci</option>
    </select>
    <label for="zdjecie">Zdjęcie:</label>
    <input type="file" name="zdjecie" required>
    
    <button type="submit">Dodaj Produkt</button>
</form>

<?php include 'templates/footer.php'; ?>
