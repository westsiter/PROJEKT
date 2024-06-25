<?php
session_start();
include('../php/dbconection.php');

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_SESSION['email'])) {
    echo json_encode(['success' => false, 'message' => 'Musisz być zalogowany, żeby dodać przedmiot do koszyka!']);
    exit;
}

$email = $_SESSION['email'];
$sql = "SELECT id FROM users WHERE mail = ?";
$stmt = $con->prepare($sql);
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Błąd przygotowania zapytania: ' . $con->error]);
    exit;
}
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

$productId = isset($_POST['productId']) ? $_POST['productId'] : '';

if (!$productId) {
    file_put_contents('debug.log', "Brak przesłanego ID produktu\n", FILE_APPEND);
    echo json_encode(['success' => false, 'message' => 'Brak przesłanego ID produktu']);
    exit;
}

file_put_contents('debug.log', "productId: $productId\n", FILE_APPEND);

$sql = "SELECT ID FROM produkty WHERE ID = ?";
$stmt = $con->prepare($sql);
if (!$stmt) {
    file_put_contents('debug.log', "Błąd przygotowania zapytania dla sprawdzenia produktu: " . $con->error . "\n", FILE_APPEND);
    echo json_encode(['success' => false, 'message' => 'Błąd przygotowania zapytania: ' . $con->error]);
    exit;
}
$stmt->bind_param('i', $productId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    file_put_contents('debug.log', "Produkt o ID $productId nie istnieje\n", FILE_APPEND);
    echo json_encode(['success' => false, 'message' => 'Podany produkt nie istnieje']);
    exit;
}

file_put_contents('debug.log', "Produkt o ID $productId istnieje\n", FILE_APPEND);

$sql = "SELECT id FROM koszyk WHERE user_id = ? AND product_id = ?";
$stmt = $con->prepare($sql);
if (!$stmt) {
    file_put_contents('debug.log', "Błąd przygotowania zapytania dla koszyka: " . $con->error . "\n", FILE_APPEND);
    echo json_encode(['success' => false, 'message' => 'Błąd przygotowania zapytania: ' . $con->error]);
    exit;
}
$stmt->bind_param('ii', $userId, $productId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $sql = "UPDATE koszyk SET quantity = quantity + 1 WHERE user_id = ? AND product_id = ?";
    $stmt = $con->prepare($sql);
    if (!$stmt) {
        file_put_contents('debug.log', "Błąd przygotowania zapytania dla aktualizacji koszyka: " . $con->error . "\n", FILE_APPEND);
        echo json_encode(['success' => false, 'message' => 'Błąd przygotowania zapytania: ' . $con->error]);
        exit;
    }
    $stmt->bind_param('ii', $userId, $productId);
} else {
    $sql = "INSERT INTO koszyk (user_id, product_id, quantity) VALUES (?, ?, 1)";
    $stmt = $con->prepare($sql);
    if (!$stmt) {
        file_put_contents('debug.log', "Błąd przygotowania zapytania dla dodania do koszyka: " . $con->error . "\n", FILE_APPEND);
        echo json_encode(['success' => false, 'message' => 'Błąd przygotowania zapytania: ' . $con->error]);
        exit;
    }
    $stmt->bind_param('ii', $userId, $productId);
}

if ($stmt->execute()) {
    file_put_contents('debug.log', "Dodano produkt o ID $productId do koszyka użytkownika $userId\n", FILE_APPEND);
    echo json_encode(['success' => true]);
} else {
    file_put_contents('debug.log', "Błąd wykonania zapytania: " . $stmt->error . "\n", FILE_APPEND);
    echo json_encode(['success' => false, 'message' => 'Błąd wykonania zapytania: ' . $stmt->error]);
}

echo json_encode($products);

$stmt->close();
$con->close();
?>
