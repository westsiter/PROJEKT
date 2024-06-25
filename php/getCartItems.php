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

// Pobieranie ID użytkownika na podstawie adresu e-mail
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

// Pobieranie przedmiotów z koszyka użytkownika
$sql = "SELECT p.id as product_id, p.nazwa, p.cena, p.zdjecie, k.quantity 
        FROM koszyk k 
        JOIN produkty p ON k.product_id = p.id 
        WHERE k.user_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param('i', $userId);
$stmt->execute();
$result = $stmt->get_result();

$items = [];
$totalPrice = 0;
$totalQuantity = 0;

while ($row = $result->fetch_assoc()) {
    $items[] = $row;
    $totalPrice += $row['cena'] * $row['quantity'];
    $totalQuantity += $row['quantity'];
}

echo json_encode(['success' => true, 'items' => $items, 'totalPrice' => $totalPrice, 'totalQuantity' => $totalQuantity]);

$stmt->close();
$con->close();
?>
