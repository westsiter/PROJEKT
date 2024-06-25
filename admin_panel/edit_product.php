<?php include 'templates/header.php'; ?>
<?php include 'db.php'; ?>
<?php
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php
$id = $_GET['id'];
$result = $conn->query("SELECT * FROM produkty WHERE id = $id");
$product = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    echo "<pre>";
    print_r($_POST);
    echo "</pre>";
    $nazwa = $_POST['nazwa'];
    $cena = $_POST['cena'];
    $opis = $_POST['opis'];
    $kolor = $_POST['kolor'];
    $kategoria = $_POST['kategoria'];
    $rozmiar = $_POST['rozmiar'];
    $plec = $_POST['plec'];
    $zdjecie = $_FILES['zdjecie']['name'];
    if ($zdjecie) {
        $target = "../uploads/" . basename($zdjecie);
        move_uploaded_file($_FILES['zdjecie']['tmp_name'], $target);
        $zdjecie_sql = ", zdjecie=?";
    } else {
        $zdjecie_sql = "";
    }

    $sql = "UPDATE produkty SET nazwa=?, cena=?, opis=?, kolor=?, kategoria=?, rozmiar=?, plec=? $zdjecie_sql WHERE id=?";
    $stmt = $conn->prepare($sql);

    if ($zdjecie) {
        $stmt->bind_param("sdssssssi", $nazwa, $cena, $opis, $kolor, $kategoria, $rozmiar, $plec, $target, $id);
    } else {
        $stmt->bind_param("dssssssi", $nazwa, $cena, $opis, $kolor, $kategoria, $rozmiar, $plec, $id);
    }

    if ($stmt->execute()) {
        echo "Produkt zaktualizowany pomyślnie";
    } else {
        echo "Błąd: " . $stmt->error;
    }
    $stmt->close();
}
?>

<h2>Edytuj Produkt</h2>
<form action="edit_product.php?id=<?php echo $id; ?>" method="post" enctype="multipart/form-data">
    <img src="../uploads/<?php echo $product['zdjecie']; ?>" width="75%">
    <label for="nazwa">Nazwa:</label>
    <input type="text" name="nazwa" value="<?php echo htmlspecialchars($product['nazwa']); ?>" required>

    <label for="cena">Cena:</label>
    <input type="number" step="0.01" name="cena" value="<?php echo htmlspecialchars($product['cena']); ?>" required>

    <label for="opis">Opis:</label>
    <textarea name="opis" required><?php echo htmlspecialchars($product['opis']); ?></textarea>

    <label for="kolor">Kolor:</label>
    <input type="text" name="kolor" value="<?php echo htmlspecialchars($product['kolor']); ?>" required>

    <label for="kategoria">Kategoria:</label>
    <input type="text" name="kategoria" value="<?php echo htmlspecialchars($product['kategoria']); ?>" required>

    <label for="rozmiar">Rozmiar:</label>
    <input type="text" name="rozmiar" value="<?php echo htmlspecialchars($product['rozmiar']); ?>" required>

    <label for="plec">Płeć:</label>
    <select name="plec" required>
        <option value="meskie" <?php echo $product['plec'] == 'meskie' ? 'selected' : ''; ?>>Mężczyzna</option>
        <option value="damskie" <?php echo $product['plec'] == 'damskie' ? 'selected' : ''; ?>>Kobieta</option>
        <option value="dzieci" <?php echo $product['plec'] == 'dzieci' ? 'selected' : ''; ?>>Dzieci</option>
    </select>
    <label for="zdjecie">Zdjęcie:</label>
    <input type="file" name="zdjecie">
    <button type="submit">Aktualizuj Produkt</button>
</form>

<?php include 'templates/footer.php'; ?>
