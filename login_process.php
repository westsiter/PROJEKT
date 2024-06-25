<?php
session_start();
include (__DIR__ . '\php\dbconection.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $pin = $_POST['pin'];

    $username = mysqli_real_escape_string($con, $username);
    $password = mysqli_real_escape_string($con, $password);
    $pin = mysqli_real_escape_string($con, $pin);

    $sql = "SELECT * FROM admin WHERE login = '$username' AND haslo = '$password' AND pin = '$pin'";
    $result = mysqli_query($con, $sql);

    if (mysqli_num_rows($result) == 1) {
        $_SESSION['username'] = $username;
        header("Location: admin_panel/index.php");
    } else {
        header("Location: login.php?error=Niepoprawne dane");
    }
}
?>
