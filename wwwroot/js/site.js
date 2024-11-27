﻿let selectedRole = ""; 
let selecciono = false; 


function handleButtonClick() {
    if (selectedRole === "trabajador") {
        console.log("Redirigiendo a la página para ofrecer servicios...");
    } else if (selectedRole === "empleador") {
        console.log("Redirigiendo a la búsqueda de profesionales...");
    } else {
        console.log("Por favor, selecciona un rol primero.");
    }
}

// window.onload = function() {
//     document.getElementById("welcomeModal").style.display = "flex";
// };

function performSearch() {
    const query = document.getElementById("searchInput").value;
    if (query) {
        console.log(`Buscando: ${query}`);
    } else {
        console.log("Por favor, ingresa un término de búsqueda.");
    }
}

document.querySelector(".form").addEventListener("submit", function(event) {
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let errors = [];

    if (!email) {
        errors.push("El campo de email es obligatorio.");
    }
    if (!password) {
        errors.push("El campo de contraseña es obligatorio.");
    }

    
    if (email && !emailPattern.test(email)) {
        errors.push("Por favor ingresa un email válido.");
    }

    if (errors.length > 0) {
        event.preventDefault(); 
        alert(errors.join("\n")); 
    }
});

document.querySelector(".formTrabajador").addEventListener("input", function(event) {
    const Name = document.getElementById("Name").value
    const LastName = document.getElementById("Lastname").value
    const Email = document.getElementById("Email").value
    const DNI = document.getElementById("DNI").value
    const Birthdate = document.getElementById("Birthdate").valu
    const Password = document.getElementById("Password").value
    const ConfirmPassword = document.getElementById("ConfirmPassword").value
    const regexp_email = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
    const regexp_password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}/;
    let errors = [];

    if(Name != ""){
        errors.push("Por favor ingrese un nombre valido")        
    }
    if(LastName != ""){
        errors.push("Por favor ingrese un apellido valido")        
    }
    if(!regexp_email.test(Email)){
        errors.push("Por favor ingrese un email valido")        
    }
    if(DNI != "" && DNI.length == 8){
        errors.push("Por favor ingrese un DNI valido")        
    }
    if(Birthdate < Date.now && Birthdate.year > 0){
        errors.push("Por favor ingrese un año de nacimiento valido")        
    }
    if(!regexp_password.test(Password))
    {
        errors.push("Por favor ingrese un contraseña valido")
    }
    if(Password != ConfirmPassword)
    {
        errors.push("Las constraseñas no son iguales")
    }
    if(errors.length > 0)
    {
        event.preventDefault(); 
        alert(errors.join("\n")); 
    }
});

document.querySelector(".formCliente").addEventListener("submit", function(event) {
    const Name = document.getElementById("Name").value
    const LastName = document.getElementById("Lastname").value
    const Email = document.getElementById("Email").value
    const DNI = document.getElementById("DNI").value
    const Birthdate = document.getElementById("Birthdate").valu
    const Password = document.getElementById("Password").value
    const ConfirmPassword = document.getElementById("ConfirmPassword").value
    const regexp_email = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
    const regexp_password = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,15}/;
    let errors = [];

    if(Name != ""){
        errors.push("Por favor ingrese un nombre valido")        
    }
    if(LastName != ""){
        errors.push("Por favor ingrese un apellido valido")        
    }
    if(!regexp_email.test(Email)){
        errors.push("Por favor ingrese un email valido")        
    }
    if(DNI != "" && DNI.length == 8){
        errors.push("Por favor ingrese un DNI valido")        
    }
    if(Birthdate < Date.now && Birthdate.year > 0){
        errors.push("Por favor ingrese un año de nacimiento valido")        
    }
    if(!regexp_password.test(Password))
    {
        errors.push("Por favor ingrese un contraseña valido")
    }
    if(Password != ConfirmPassword)
    {
        errors.push("Las constraseñas no son iguales")
    }
    if(errors.length > 0)
    {
        event.preventDefault(); 
        alert(errors.join("\n")); 
    }
});


function ConfirmarArreglo(usuarioId) {
    let conf = confirm("¿Estás seguro de que deseas arreglarlo?");
    if (conf) {
        $.ajax({
            url: "/Home/MarcarArreglado", 
            method: "POST",
            data: { UsuarioId: usuarioId },
            success: function (response) {
                if (response.success) {
                    alert("El trabajo fue aceptado.");

                    let button = document.querySelector(`[data-usuario-id='${usuarioId}']`);
                    if (button) {
                        button.disabled = true;
                        button.innerText = "Aceptado";
                        button.style.backgroundColor = "#ccc";
                        button.style.cursor = "not-allowed";
                    }
                } else {
                    alert("Error: " + response.message);
                }
            },
            error: function () {
                alert("Ocurrió un error al procesar la solicitud.");
            }
        });
    }
}

function ConfirmarTrabajador(usuarioId) {
    let conf = confirm("¿Estás seguro de que deseas arreglarlo?");
    if (conf) {
        $.ajax({
            url: "/Home/MarcarTrabajo", 
            method: "POST",
            data: { UsuarioId: usuarioId },
            success: function (response) {
                if (response.success) {
                    alert("El trabajo fue aceptado.");

                    let button = document.querySelector(`[data-usuario-id='${usuarioId}']`);
                    if (button) {
                        button.disabled = true;
                        button.innerText = "Aceptado";
                        button.style.backgroundColor = "#ccc";
                        button.style.cursor = "not-allowed";
                    }
                } else {
                    alert("Error: " + response.message);
                }
            },
            error: function () {
                alert("Ocurrió un error al procesar la solicitud.");
            }
        });
    }
}
