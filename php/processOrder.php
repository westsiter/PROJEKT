<?php
session_start();
include('../php/dbconection.php');

// Check if user is logged in
if (!isset($_SESSION['email'])) {
    header('Location: login.php');
    exit;
}

// Get user ID
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
    echo "User not found.";
    exit;
}

// Get form data
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$address = $_POST['address'];
$postalCode = $_POST['postalCode'];
$phoneNumber = $_POST['phoneNumber'];
$paymentMethod = $_POST['paymentMethod'];
$totalPrice = 0;

// Get cart items
$sql = "SELECT p.id as product_id, p.cena, k.quantity 
        FROM koszyk k 
        JOIN produkty p ON k.product_id = p.id 
        WHERE k.user_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param('i', $userId);
$stmt->execute();
$result = $stmt->get_result();

$items = [];

while ($row = $result->fetch_assoc()) {
    $items[] = $row;
    $totalPrice += $row['cena'] * $row['quantity'];
}

// Create new order
$sql = "INSERT INTO orders (user_id, total_price, shipping_address, payment_method, contact_details) 
        VALUES (?, ?, ?, ?, ?)";
$shippingAddress = "Imię: $firstName\nNazwisko: $lastName\nAdres: $address\nKod pocztowy: $postalCode\nTelefon: $phoneNumber";
$contactDetails = "E-mail: $email";
$stmt = $con->prepare($sql);
$stmt->bind_param('idsss', $userId, $totalPrice, $shippingAddress, $paymentMethod, $contactDetails);
$stmt->execute();

$orderId = $stmt->insert_id;

// Add items to order_items table
foreach ($items as $item) {
    $sql = "INSERT INTO order_items (order_id, product_id, quantity, price) 
            VALUES (?, ?, ?, ?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param('iiid', $orderId, $item['product_id'], $item['quantity'], $item['cena']);
    $stmt->execute();

    // Update product quantity
    $sql = "UPDATE produkty SET ilosc = ilosc - ? WHERE id = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param('ii', $item['quantity'], $item['product_id']);
    $stmt->execute();
}

// Clear user's cart
$sql = "DELETE FROM koszyk WHERE user_id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param('i', $userId);
$stmt->execute();

// Send email confirmation
$to = $email;
$subject = "Order Confirmation - Your Order #$orderId";
$message = "Thank you for your order. Your order number is $orderId.";
$headers = "From: no-reply@toronto-shop.com";

mail($to, $subject, $message, $headers);

// Redirect to order confirmation page
header('Location: orderConfirmation.php?orderId=' . $orderId);
exit;
?>
