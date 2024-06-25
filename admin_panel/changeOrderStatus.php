<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['orderId']) && isset($_POST['newStatus'])) {
    $orderId = $_POST['orderId'];
    $newStatus = $_POST['newStatus'];

    $sql = "UPDATE orders SET status = '$newStatus' WHERE id = $orderId";
    if (mysqli_query($conn, $sql)) {
        header('Location: order.php');
        exit;
    } else {
        echo "Błąd podczas aktualizacji statusu zamówienia: " . mysqli_error($conn);
    }
} else {
    echo "Nieprawidłowe żądanie.";
}
?>
