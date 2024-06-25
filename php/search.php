<?php
session_start();
include ('../php/dbconection.php');

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['query'])) {
    $query = $_GET['query'];
    
    $stmt = $con->prepare("SELECT nazwa, cena, zdjecie FROM produkty WHERE nazwa LIKE ? OR opis LIKE ? OR cena LIKE ? OR kategoria LIKE ? OR kolor LIKE ?");
    $searchTerm = "%" . $query . "%";
    $stmt->bind_param("sssss", $searchTerm, $searchTerm, $searchTerm, $searchTerm, $searchTerm);
    
    $stmt->execute();
    $result = $stmt->get_result();
    
    $products = [];
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
    
    echo json_encode($products);
    
    $stmt->close();
}
$con->close();
?>
