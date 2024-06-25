<?php
session_start();
include('../php/dbconection.php');
class ProductSearch {
    private $con;

    public function __construct($con) {
        $this->con = $con;
    }

    public function searchProducts($offset, $filters) {
        // Pobranie danych z formularza
        $kategoria = isset($filters['kategoria']) ? $filters['kategoria'] : '';
        $kolor = isset($filters['kolor']) ? $filters['kolor'] : '';
        $rozmiar = isset($filters['rozmiar']) ? $filters['rozmiar'] : '';
        $minPrice = isset($filters['minPrice']) ? $filters['minPrice'] : '';
        $maxPrice = isset($filters['maxPrice']) ? $filters['maxPrice'] : '';

        // Bazowe zapytanie SQL
        $sql = "SELECT id, nazwa, cena, zdjecie, rozmiar, opis, ilosc FROM produkty WHERE 1=1 AND plec='damskie' ";

        $params = [];
        $types = '';

        // Dodawanie warunków do zapytania SQL na podstawie filtrów
        if (!empty($kategoria)) {
            $sql .= " AND kategoria = ?";
            $params[] = $kategoria;
            $types .= 's';
        }
        if (!empty($kolor)) {
            $sql .= " AND kolor = ?";
            $params[] = $kolor;
            $types .= 's';
        }
        if (!empty($rozmiar)) {
            $sql .= " AND rozmiar = ?";
            $params[] = $rozmiar;
            $types .= 's';
        }
        if ($minPrice !== '') {
            $sql .= " AND cena >= ?";
            $params[] = $minPrice;
            $types .= 'd';
        }
        if ($maxPrice !== '') {
            $sql .= " AND cena <= ?";
            $params[] = $maxPrice;
            $types .= 'd';
        }

        // Dodawanie warunków paginacji
        $sql .= " ORDER BY id DESC LIMIT 9 OFFSET ?";
        $params[] = $offset * 9;  // Zwiększanie offsetu przez liczbę produktów na stronę
        $types .= 'i';

        // Przygotowanie i wykonanie zapytania
        $stmt = $this->con->prepare($sql);
        if ($stmt === false) {
            die('Błąd przygotowania zapytania: ' . $this->con->error);
        }

        $stmt->bind_param($types, ...$params);
        $stmt->execute();
        $result = $stmt->get_result();

        // Przetwarzanie wyników
        $products = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $products[] = $row;
            }
        }

        $stmt->close();

        return $products;
    }
}

// Utworzenie obiektu ProductSearch
$productSearch = new ProductSearch($con);

// Pobranie przekazanych zmiennych POST
$offset = isset($_POST['offset']) ? (int)$_POST['offset'] : 0;
$filters = [
    'kategoria' => isset($_POST['kategoria']) ? $_POST['kategoria'] : '',
    'kolor' => isset($_POST['kolor']) ? $_POST['kolor'] : '',
    'rozmiar' => isset($_POST['rozmiar']) ? $_POST['rozmiar'] : '',
    'minPrice' => isset($_POST['minPrice']) ? $_POST['minPrice'] : '',
    'maxPrice' => isset($_POST['maxPrice']) ? $_POST['maxPrice'] : ''
];

// Wyszukanie produktów
$products = $productSearch->searchProducts($offset, $filters);

// Wyświetlenie wyników
if (!empty($products)) {
    foreach ($products as $product) {
        echo "<div id='productCard'>";
            echo "<div id='productLeft'>";
                echo "<img src='" . $product['zdjecie'] . "' alt='" . $product['nazwa'] . "' id='productPhoto'>";
            echo "</div>";
            echo "<div id='productRight'>";
                echo "<p id='nameProduct'>" . $product['nazwa'] . "</p>";
                echo "<p id='descriptionProduct'>" . $product['opis'] . "</p>";
                echo "<p id='sizeProduct'>Rozmiar: " . $product['rozmiar'] . "</p>";
                echo "<p id='countProduct'>Ilość: " . $product['ilosc'] . "</p>";
                echo "<p id='costProduct'>Cena: " . $product['cena'] . "zł</p>";
                echo "<form class='add-to-cart-form' method='post'>";
                echo "<input type='hidden' name='productId' value='" . $product['id'] . "'>";

                if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true) {
                    if (isset($_SESSION['imie'])) {
                        echo "<button type='submit' class='addToCart'><i class='bx bx-cart-add'></i>Dodaj</button>";
                    }
                } else {
                    echo "musisz byc zalogowany, aby dodac do koszyka";
                }
                echo "</form>";
            echo "</div>";
        echo "</div>";
    }
} else {
    echo "Brak kolejnych rekordów do wyświetlenia.";
}

// Zamknięcie połączenia
$con->close();
?>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('.add-to-cart-form').on('submit', function(e) {
        e.preventDefault(); // Zapobiegamy domyślnemu działaniu formularza

        var form = $(this);
        var formData = form.serialize(); // Serializujemy dane formularza

        $.ajax({
            type: 'POST',
            url: '../php/addToCard.php',
            data: formData,
            dataType: 'json',
            success: function(response) {
                console.log(response); // Logujemy odpowiedź do konsoli
                if (response.success) {
                    alert('Produkt został dodany do koszyka!');
                } else {
                    alert('Błąd: ' + response.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('AJAX Error: ', textStatus, errorThrown);
                alert('Produkt został dodany do koszyka.');
            }
        });
    });
});
</script>
