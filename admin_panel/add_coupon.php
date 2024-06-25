
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
    $kod = $_POST['kod'];
    $procent = $_POST['procent'];
    
    $sql = "INSERT INTO kupon (kod, procent) VALUES ('$kod', '$procent')";
    if ($conn->query($sql) === TRUE) {
        echo "Nowy kupon dodany pomyślnie";
    } else {
        echo "Błąd: " . $sql . "<br>" . $conn->error;
    }
}
?>

<h2>Dodaj Nowy Kupon</h2>
<form action="add_coupon.php" method="post">
    <label for="kod">Kod:</label>
    <input type="text" name="kod" required>
    
    <label for="procent">Zniżka (%):</label>
    <input type="number" step="1" name="procent" required>
    
    <button type="submit">Dodaj Kupon</button>
</form>

<?php include 'templates/footer.php'; ?>
