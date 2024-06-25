<?php include 'templates/header.php'; ?>
<?php include 'db.php'; ?>
<?php
if (!isset($_SESSION['username'])) {
    header("Location: http://localhost/login.php");
    exit();
}
?>
<?php
$id = $_GET['id'];
$result = $conn->query("SELECT * FROM kupon WHERE id = $id");
$coupon = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kod = $_POST['kod'];
    $procent = $_POST['procent'];
    
    $sql = "UPDATE kupon SET kod='$kod', procent='$procent' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo "Kupon zaktualizowany pomyślnie";
    } else {
        echo "Błąd: " . $sql . "<br>" . $conn->error;
    }
}
?>

<h2>Edytuj Kupon</h2>
<form action="edit_coupon.php?id=<?php echo $id; ?>" method="post">
    <label for="kod">Kod:</label>
    <input type="text" name="kod" value="<?php echo $coupon['kod']; ?>" required>
    
    <label for="procent">Zniżka (%):</label>
    <input type="number" step="1" name="procent" value="<?php echo $coupon['procent']; ?>" required>
    
    <button type="submit">Aktualizuj Kupon</button>
</form>

<?php include 'templates/footer.php'; ?>
