var emailField = document.getElementById("email-field");
var emailLabel = document.getElementById("email-label");
var emailError = document.getElementById("email-error");

function validateEmail() {
    if (emailField.value !== "") {
        emailLabel.style.bottom = "35px";
    } else {
        emailLabel.style.bottom = "4px";
    }

    if (!emailField.value.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)) {
        emailError.innerHTML = "NIEPOPRAWNY ADRES E-MAIL";
    } else {
        emailError.innerHTML = "";
    }
}

var passwordField = document.getElementById("password-field");
var passwordLabel = document.getElementById("password-label");

function validatePassword() {
    if (passwordField.value !== "") {
        passwordLabel.style.bottom = "35px";
    } else {
        passwordLabel.style.bottom = "4px";
    }
}

passwordField.addEventListener("input", validatePassword);

var container = document.getElementById("container");
function closePopup() {
    container.style.display = "none";
}
function openPU() {
    container.style.display = "flex";
}