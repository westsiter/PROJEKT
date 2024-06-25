<?php

$con = mysqli_connect("localhost", "root", "", "toronto");
if ($con == false) {
    die("Connection error" . mysqli_connect_error());
}
?>