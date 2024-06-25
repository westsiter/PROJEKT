<?php
session_start();
include ('../php/dbconection.php');

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(['success' => false, 'message' => 'Nieprawidłowa metoda żądania']);
    exit;
}

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

$sql = "SELECT SUM(p.cena * k.quantity) AS total_price
        FROM koszyk k 
        JOIN produkty p ON k.product_id = p.id 
        WHERE k.user_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param('i', $userId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $totalPrice = $row['total_price'];
} else {
    $totalPrice = 0;
}

$promotionCode = $_POST['promotionCode'];

$sql = "SELECT procent FROM kupon WHERE kod = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param('s', $promotionCode);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {

    $row = $result->fetch_assoc();
    $discountPercent = $row['procent'];
    $discountedPrice = $totalPrice * (100 - $discountPercent) / 100;
    echo json_encode(['success' => true, 'discountedPrice' => $discountedPrice]);
} else {
    echo json_encode(['success' => false, 'message' => 'Nieprawidłowy kod promocyjny']);
}

$stmt->close();
$con->close();
?>