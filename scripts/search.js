function displayResults(results) {
    let output = '<ul>';
    if (results.length > 0) {
        results.forEach(function (product) {
            output += `<li>
                <img src="${product.zdjecie}" alt="${product.nazwa}">
                <div>${product.nazwa} - ${product.cena} PLN</div>
            </li>`;
        });
        document.getElementById('searchResults').classList.add('border');
    } else {
        document.getElementById('searchResults').classList.remove('border');
    }
    output += '</ul>';
    document.getElementById('searchResults').innerHTML = output;
}

document.getElementById('search-input').addEventListener('keyup', function () {
    let query = this.value;
    if (query.length > 2) {
        fetchResults(query);
    } else {
        document.getElementById('searchResults').innerHTML = '';
        document.getElementById('searchResults').classList.remove('border');
    }
});

function fetchResults(query) {
    let xhr = new XMLHttpRequest();
    xhr.open('GET', `../php/search.php?query=${query}`, true);
    xhr.onload = function () {
        if (this.status === 200) {
            let results = JSON.parse(this.responseText);
            displayResults(results);
        }
    };
    xhr.send();
}