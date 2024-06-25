<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toronto ADMIN</title>
    <link rel="stylesheet" href="./style/styleAdminLogin.css">
</head>
<body>
    <div class="container">
        <h2>Admin Panel Login</h2>
        <form action="login_process.php" method="POST">
            <label for="username">Login:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Hasło:</label>
            <input type="password" id="password" name="password" required>

            <label for="pin">PIN:</label>
            <input type="text" id="pin" name="pin" required>

            <button type="submit">Login</button>
        </form>
        <?php
        if (isset($_GET['error'])) {
            echo "<p class='error-message'>" . $_GET['error'] . "</p>";
        }
        ?>
    </div>
</body>
</html>
