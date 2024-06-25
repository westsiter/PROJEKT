<?php include 'templates/header.php'; ?>
<?php include 'db.php'; ?>
<?php
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<h2>Zarządzaj Kuponami<p><a href="add_coupon.php" id="textAdd">Dodaj Kupon</a></h2></p>
<table>
    <tr>
        <th>Kod</th>
        <th>Zniżka (%)</th>
        <th>Akcje</th>
    </tr>
    <?php
    $result = $conn->query("SELECT id, kod, procent FROM kupon");

    if ($result === false) {
        echo "<tr><td colspan='3'>Błąd zapytania: " . $conn->error . "</td></tr>";
    } else {
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                        <td>{$row['kod']}</td>
                        <td>{$row['procent']}</td>
                        <td>
                            <a href='edit_coupon.php?id={$row['id']}'>Edytuj</a> |
                            <a href='delete_coupon.php?id={$row['id']}' onclick='return confirm(\"Jesteś pewny?\")'>Usuń</a>
                        </td>
                      </tr>";
            }
        } else {
            echo "<tr><td colspan='3'>Brak kuponów w bazie danych</td></tr>";
        }
    }
    ?>
</table>

<?php include 'templates/footer.php'; ?>
