<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js" defer></script>
</head>
<body>
    <header>
        <h1>Admin Panel</h1>
        <h2><a href="../index.php">Powrót</a></h2>
        <nav>
            <ul>
                <li><a href="index.php">Produkty</a></li>
                <li><a href="manage_coupons.php">Kupony</a></li>
                <li><a href="analiza.php">Analiza</a></li>
                <li><a href="order.php">Zamówienia</a></li>
                <li><a href="polecane.php">Polecane</a></li>
            </ul>
        </nav>
    </header>
    <main>
