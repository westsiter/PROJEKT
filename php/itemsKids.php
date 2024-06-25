<div id="containerMan">
    <form id="containerFiltr" method="POST" action="filtred.php">
        <p id="filtry">Filtry</p>
        <label for="kategoria">kategoria</label>
        <div id="selectContainer">
            <select id="kategoria" name="kategoria">
                <option value="">Wszystkie kategorie</option>
                <option value="spodnie">spodnie</option>
                <option value="koszulki">koszulki</option>
                <option value="bluzy">bluzy</option>
            </select>
        </div>
        <label for="kolor">kolor</label>
        <div id="selectContainer">
            <select id="kolor" name="kolor">
                <option value="">Wszystkie kolory</option>
                <option value="czarny">czarne</option>
                <option value="biały">białe</option>
                <option value="szary">szare</option>
                <option value="niebieski">niebieski</option>
            </select>
        </div>
        <div id="rangeContainer">
            <p id="filtry">Cena</p>
            <p id="rangeDesc">Wybierz przedział cenowy</p>
            <div id="price-input">
                <div id="field">
                    <input type="number" id="input-min" name="input-min" value="" placeholder="Min">
                    <div id="separator">-</div>
                    <input type="number" id="input-max" name="input-max" value="" placeholder="Max">
                </div>
            </div>
        </div>
        <button id="buttonFiltr">Filtruj</button>
        <button id="resetFiltr" type="reset">Reset</button>
    </form>
    <div id="clothes">
        <div id="productContainer">
            <!-- Tutaj będą dodawane produkty -->
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../scripts/loaderProductKids.js"></script>