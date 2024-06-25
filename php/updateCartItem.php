<?php
session_start();
include('../php/dbconection.php');

// Obsługa błędów
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Sprawdzenie, czy użytkownik jest zalogowany
if (!isset($_SESSION['email'])) {
    echo json_encode(['success' => false, 'message' => 'Nie jesteś zalogowany.']);
    exit;
}

$email = $_SESSION['email'];
$sql = "SELECT id FROM users WHERE mail = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param('s', $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $userId = $row['id'];
} else {
    echo json_encode(['success' => false, 'message' => 'Użytkownik o podanym adresie e-mail nie istnieje']);
    exit;
}

$productId = $_POST['productId'];
$quantity = $_POST['quantity'];

if ($quantity > 0) {
    $sql = "UPDATE koszyk SET quantity = ? WHERE user_id = ? AND product_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param('iii', $quantity, $userId, $productId);
} else {
    $sql = "DELETE FROM koszyk WHERE user_id = ? AND product_id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param('ii', $userId, $productId);
}

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Wystąpił błąd podczas aktualizacji koszyka.']);
}

$stmt->close();
$con->close();
?>
