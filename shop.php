<!DOCTYPE HTML>
<html lang="pl-PL">

<head>
    <title>Toronto - Sklep z odzieżą</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="images/icon.png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./style/styleShop.css">
    <link rel="stylesheet" href="./style/styleShopNew.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Reddit+Mono:wght@200..900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="description" content="Toronto - strona z najlepszymi ubraniami">
    <meta name="author" content="Łukasz Pikuła">
    <style>
        #searchResults {
            position: absolute;
            /* Or 'fixed' if you want it to stay in a fixed position even when scrolling */
            top: 60px;
            /* Adjust based on your layout */
            right: 10px;
            /* Adjust based on your layout */
            width: 25%;
            max-height: 500px;
            overflow-y: auto;
            background-color: white;
            /* To make sure it's readable */
            padding: 10px;
            /* Optional: for better spacing */
            margin-top: 10px;
            /* Optional: for better spacing */
            z-index: 1000;
            /* Ensures it appears above other elements */
        }

        #searchResults.border {
            border: 1px solid #ccc;
            /* Optional: for better visibility */
        }

        #searchResults ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        #searchResults li {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        #searchResults img {
            margin-right: 10px;
            width: 50px;
            height: 50px;

        }

        .add-to-cart {
            margin-left: auto;
            padding: 5px 10px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .add-to-cart:hover {
            background-color: #218838;
        }
        
    </style>
</head>

<body>

    <?php
    include ('./php/shopHeader.php');
    include ('./php/shopNew.php');
    ?>

</body>

</html>