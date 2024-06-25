<?php

$conn = mysqli_connect("localhost", "root", "", "toronto");
if ($conn == false) {
    die("Connection error" . mysqli_connect_error());
}
?>