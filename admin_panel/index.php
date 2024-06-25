<?php include 'templates/header.php'; ?>
<?php include 'db.php'; ?>
<?php
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>

<h2>Zarządzaj Produktami<p><a href="add_product.php" id="textAdd">Dodaj Nowy Produkt</a></h2></p>
<table>
    <tr>
        <th>Zdjecie</th>
        <th>Nazwa</th>
        <th>Cena</th>
        <th>Opis</th>
        <th>Kolor</th>
        <th>Kategoria</th>
        <th>Rozmiar</th>
        <th>Płeć</th>
        <th colspan="2">Akcje</th>
    </tr>
    <?php
    $result = $conn->query("SELECT id, nazwa, cena, opis, zdjecie, kolor, kategoria, rozmiar, plec FROM produkty");

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td><img src='{$row['zdjecie']}' width='50' /></td>            
                    <td>{$row['nazwa']}</td>
                    <td>{$row['cena']}</td>
                    <td>{$row['opis']}</td>
                    <td>{$row['kolor']}</td>
                    <td>{$row['kategoria']}</td>
                    <td>{$row['rozmiar']}</td>
                    <td>{$row['plec']}</td>
                    <td style='border-right: 0px'><a href='edit_product.php?id={$row['id']}'>Edytuj</a></td>
                    <td style='border-left: 0px'><a href='delete_product.php?id={$row['id']}' onclick='return confirm(\"Jesteś pewny?\")'>Usuń</a></td>
                  </tr>";
        }
    } else {
        echo "<tr>
                <td colspan='9'>Brak produktów w bazie danych</td>
              </tr>";
    }
    ?>
</table>

<?php include 'templates/footer.php'; ?>