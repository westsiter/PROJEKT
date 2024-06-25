
<?php include 'db.php'; ?>
<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php
$id = $_GET['id'];
$sql = "DELETE FROM produkty WHERE id = $id";
if ($conn->query($sql) === TRUE) {
    echo "Produkt usunięty pomyślnie";
} else {
    echo "Błąd: " . $conn->error;
}
header('Location: index.php');
?>
