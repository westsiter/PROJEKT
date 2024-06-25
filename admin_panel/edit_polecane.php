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
$result = $conn->query("SELECT * FROM polecane WHERE id = $id");
$product = $result->fetch_assoc();

if (!is_dir('uploads')) {
    mkdir('uploads', 0777, true);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    echo "<pre>";
    print_r($_POST);
    echo "</pre>";
    $nazwa = $_POST['nazwa'];
    $cena = $_POST['cena'];
    $zdjecie = $_FILES['zdjecie']['name'];
    if ($zdjecie) {
        $target = "../uploads/" . basename($zdjecie); // Store full path
        if (move_uploaded_file($_FILES['zdjecie']['tmp_name'], $target)) {
            $zdjecie_sql = ", zdjecie=?";
        } else {
            echo "Failed to move uploaded file.";
            $zdjecie_sql = "";
            $zdjecie = null;  // Reset $zdjecie if upload failed
        }
    } else {
        $zdjecie_sql = "";
    }

    $sql = "UPDATE polecane SET nazwa=?, cena=? $zdjecie_sql WHERE id=?";
    $stmt = $conn->prepare($sql);

    if ($zdjecie) {
        $stmt->bind_param("sdsi", $nazwa, $cena, $target, $id); // Use $target instead of $zdjecie
    } else {
        $stmt->bind_param("sdi", $nazwa, $cena, $id);
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
<form action="edit_polecane.php?id=<?php echo $id; ?>" method="post" enctype="multipart/form-data">
    <img src="../uploads/<?php echo $product['zdjecie']; ?>" width="75%">
    <label for="nazwa">Nazwa:</label>
    <input type="text" name="nazwa" value="<?php echo htmlspecialchars($product['nazwa']); ?>" required>

    <label for="cena">Cena:</label>
    <input type="number" step="0.01" name="cena" value="<?php echo htmlspecialchars($product['cena']); ?>" required>

    <label for="zdjecie">Zdjęcie:</label>
    <input type="file" name="zdjecie">
    <button type="submit">Aktualizuj Polecany Produkt</button>
</form>

<?php include 'templates/footer.php'; ?>
