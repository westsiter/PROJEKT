<?php
include ('dbconection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $password2 = $_POST['password2'];

    $password_hashed = password_hash($password, PASSWORD_DEFAULT);

    //czy imie ma wiecej niz 4 litery
    if (strlen($name) > 3) {
        //sprawdz czy hasla sa identyczne
        if ($password !== $password2) {
            //jesli  hasla nie są identyczne
            echo "<script>document.getElementById('error').innerHTML='Hasła nie są identyczne';</script>";
        } else {
            if (strlen($password) > 5 && preg_match('/[A-Z]/', $password) && preg_match('/[^a-zA-Z0-9]/', $password)) {
                //czy istnieje już użytkownik o podanym adresie e-mail
                $checkQuery = mysqli_query($con, "SELECT * FROM users WHERE mail='$email'");
                if (mysqli_num_rows($checkQuery) > 0) {
                    //jesli istnieje
                    echo "<script>document.getElementById('error').innerHTML='UŻYTKOWNIK O PODANYM ADRESIE E-MAIL JUŻ ISTNIEJE';</script>";
                } else {
                    $query = mysqli_query($con, "INSERT INTO users (imie, nazwisko, mail, haslo) VALUES ('$name', '$surname', '$email', '$password_hashed')");
                    if ($query) {
                        echo "<script>document.getElementById('error').style.color = 'green';</script>";
                        echo "<script>document.getElementById('error').innerHTML='Pomyślnie zarejestrowano użytkownika!';</script>";
                        echo "<script>setTimeout(function() { window.location.href = 'shop.php'; }, 3000);</script>";
                    } else {
                        echo "<script>document.getElementById('error').innerHTML='Nie udało się ukończyć rejestracji. Spróbuj ponownie później.';</script>";
                    }
                }
            } else {
                echo "<script>document.getElementById('error').innerHTML='Hasło powinno posiadać przynajmniej: jedną dużą literę,';</script>";
                echo "<script>document.getElementById('error2').innerHTML='jedną cyfre, jeden znak specjalny oraz przynajmniej 6 liter';</script>";

            }
        }
    } else {
        echo "<script>document.getElementById('error').innerHTML='Imię powinno mieć więcej niż 4 litery';</script>";
    }
}
?>