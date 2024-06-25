<?php
include('dbconection.php');

// Log POST data for debugging
file_put_contents('php://stderr', print_r($_POST, TRUE));

$kategoria = isset($_POST['kategoria']) ? $_POST['kategoria'] : '';
$kolor = isset($_POST['kolor']) ? $_POST['kolor'] : '';
$rozmiar = isset($_POST['rozmiar']) ? $_POST['rozmiar'] : '';
$minPrice = isset($_POST['input-min']) ? $_POST['input-min'] : '';
$maxPrice = isset($_POST['input-max']) ? $_POST['input-max'] : '';

$query = "SELECT * FROM products WHERE 1=1";

if ($kategoria != '') {
    $query .= " AND kategoria = ?";
}
if ($kolor != '') {
    $query .= " AND kolor = ?";
}
if ($rozmiar != '') {
    $query .= " AND rozmiar = ?";
}
if ($minPrice != '') {
    $query .= " AND cena >= ?";
}
if ($maxPrice != '') {
    $query .= " AND cena <= ?";
}

$stmt = $con->prepare($query);

$params = [];
if ($kategoria != '') {
    $params[] = $kategoria;
}
if ($kolor != '') {
    $params[] = $kolor;
}
if ($rozmiar != '') {
    $params[] = $rozmiar;
}
if ($minPrice != '') {
    $params[] = $minPrice;
}
if ($maxPrice != '') {
    $params[] = $maxPrice;
}

$types = str_repeat('s', count($params));
$stmt->bind_param($types, ...$params);

$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='product'>";
        echo "<img src='{$row['zdjecie']}' alt='{$row['nazwa']}'>";
        echo "<p>{$row['nazwa']}</p>";
        echo "<p>Cena: {$row['cena']} PLN</p>";
        echo "</div>";
    }
} else {
    echo "<p>Brak produktów spełniających kryteria filtrowania.</p>";
}

$stmt->close();
$con->close();
?>
