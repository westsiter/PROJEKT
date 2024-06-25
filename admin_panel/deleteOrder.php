<?php
include 'templates/header.php';
include 'db.php';
?>
<?php
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php
$sql = "SELECT * FROM orders";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    echo "<table>";
    echo "<tr><th>ID Zamówienia</th><th>ID Użytkownika</th><th>Całkowita Cena</th><th>Adres Wysyłki</th><th>Status</th><th>Akcje</th></tr>";
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>".$row['id']."</td>";
        echo "<td>".$row['user_id']."</td>";
        echo "<td>".$row['total_price']."</td>";
        echo "<td>".$row['shipping_address']."</td>";
        echo "<td>".$row['status']."</td>";
        echo "<td>
                <form action='deleteOrder.php' method='post'>
                    <input type='hidden' name='orderId' value='".$row['id']."'>
                    <button type='submit'>Usuń</button>
                </form>
              </td>";
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "Brak zamówień.";
}
?>
