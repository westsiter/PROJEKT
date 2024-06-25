   
   function checkName(){
        var name=document.getElementById("name").value;
        if(name===""){
            document.getElementById("checkName").innerHTML="POLE IMIĘ NIE MOŻE POZOSTAĆ PUSTE!";
            document.getElementById("name").style.borderBottomColor = "red";
        }
        else{
                document.getElementById("checkName").innerHTML="";
                document.getElementById("name").style.borderBottomColor = "green";
        }
    }
   
    function checkSurname(){
        var surname=document.getElementById("surname").value;
        if(surname==="") {
            document.getElementById("checkSurname").innerHTML="POLE NAZWISKO NIE MOŻE POZOSTAĆ PUSTE!";
            document.getElementById("surname").style.borderBottomColor = "red";
        }
        else{
            document.getElementById("checkSurname").innerHTML="";
            document.getElementById("surname").style.borderBottomColor = "green";
        }
    }   

    function checkEmail(){
        var email=document.getElementById("email").value;
        if(email===""){
            document.getElementById("checkEmail").innerHTML="POLE ADRES E-MAIL NIE MOŻE POZOSTAĆ PUSTE!";
            document.getElementById("email").style.borderBottomColor = "red";
        }
        else{
            if(!email.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){
                document.getElementById("checkEmail").innerHTML="NIEPOPRAWNY ADRES E-MAIL";
                document.getElementById("email").style.borderBottomColor = "red";
            }
            else{
                document.getElementById("checkEmail").innerHTML="";
                document.getElementById("email").style.borderBottomColor = "green";
            }
        }
    }
   
    function checkPassword(){
        var password=document.getElementById("password").value;
        if(password==="") {
            document.getElementById("checkPassword").innerHTML="WPROWADŻ HASŁO!";
            document.getElementById("password").style.borderBottomColor = "red";
        }
        else{
            document.getElementById("checkPassword").innerHTML="";
            document.getElementById("password").style.borderBottomColor = "green";
        }
    }
    
    function checkPassword2(){
        var passwordA=document.getElementById("password2").value;
        var password=document.getElementById("password").value;
        if(passwordA===""){
            document.getElementById("checkPassword2").innerHTML="WPROWADŹ PONOWNIE HASŁO!";
            document.getElementById("password2").style.borderBottomColor = "red";
        }
        else if(password != passwordA){
            document.getElementById("checkPassword2").innerHTML="HASŁA MUSZĄ BYĆ IDENTYCZNE";
            document.getElementById("password2").style.borderBottomColor = "red";
        }
        else{
            document.getElementById("checkPassword2").innerHTML="";
            document.getElementById("password2").style.borderBottomColor = "green";
        }
    }