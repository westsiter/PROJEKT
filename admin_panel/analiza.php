
<?php include 'templates/header.php'; ?>
<?php include 'db.php'; ?>

<?php
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php

$result = $conn->query("SELECT COUNT(id) AS total_users FROM users");
$user_data = $result->fetch_assoc();
$total_users = $user_data['total_users'];

$page_visits = isset($_COOKIE['page_visits']) ? $_COOKIE['page_visits'] : 0;
?>

<h2>Analiza</h2>
<p>Ilość użytkowników: <?php echo $total_users; ?></p>
<p>Ilość odwiedzin strony: <?php echo $page_visits; ?></p>

<?php include 'templates/footer.php'; ?>
