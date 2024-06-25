<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php include 'db.php'; ?>

<?php
$id = $_GET['id'];
$sql = "DELETE FROM kupon WHERE id = $id";
if ($conn->query($sql) === TRUE) {
    echo "Kupon usunięty pomyślnie";
} else {
    echo "Błąd: " . $conn->error;
}
header('Location: manage_coupons.php');
?>
