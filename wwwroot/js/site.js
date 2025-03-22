let selectedRole = ""; 
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
    let conf = confirm("¿Estás seguro de que deseas contratarlo?");
    if (conf) {
        $.ajax({
            url: "/Home/MarcarTrabajo", 
            method: "POST",
            data: { UsuarioId: usuarioId },
            success: function (response) {
                if (response.success) {
                    alert("El contrato fue realizado.");

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
function toggleEdit() {
    // Obtener los campos de entrada
    const inputs = document.querySelectorAll('.inputPerfil');
    // Obtener el botón
    const button = document.getElementById('editSaveBtn');
    
    // Comprobar si los campos están habilitados o no
    const isDisabled = inputs[0].disabled;
    
    if (!isDisabled) {
        // Validar los datos antes de enviarlos
        const isValid = validateForm();
        
        // Si la validación falla, detener la acción
        if (!isValid) {
            return;
        }

        // Deshabilitar los campos después de validación y cambiar el botón a "Cargar información"
        inputs.forEach(input => {
            input.disabled = true;
        });
        button.textContent = 'Cargar información';

        // Enviar los datos mediante AJAX después de la validación
        submitData();
    } else {
        // Si los campos están deshabilitados (modo lectura), habilitarlos y cambiar el botón a "Guardar"
        inputs.forEach(input => {
            input.disabled = false;
        });
        button.textContent = 'Guardar';
    }
}

function validateForm() {
    const name = document.getElementById('name').value.trim();
    const lastname = document.getElementById('lastname').value.trim();
    const email = document.getElementById('email').value.trim();
    const dni = document.getElementById('dni').value.trim();
    const birthdate = document.getElementById('birthdate').value;

    if (!name || !lastname || !email || !dni || !birthdate) {
        alert('Todos los campos son obligatorios.');
        return false;
    }

    // Validar el formato del email
    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailPattern.test(email)) {
        alert('El formato del email es inválido.');
        return false;
    }

    // Validar el DNI (debe ser un número de 8 dígitos)
    const dniPattern = /^\d{8}$/;
    if (!dniPattern.test(dni)) {
        alert('El DNI debe ser un número de 8 dígitos.');
        return false;
    }

    return true;
}

function submitData() {
    const usuarioId = document.getElementById('ID_Usuario').value;
    const dni = document.getElementById('dni').value.trim();
    const nombre = document.getElementById('name').value.trim();
    const apellido = document.getElementById('lastname').value.trim();
    const email = document.getElementById('email').value.trim();
    const fechaNacimiento = document.getElementById('birthdate').value;

    $.ajax({
        url: '/Home/Modificar',
        method: 'POST',
        data: {
            UsuarioId: usuarioId,
            DNI: dni,
            Nombre: nombre,
            Apellido: apellido,
            Email: email,
            FechaNacimiento: fechaNacimiento
        },
        success: function(response) {
            if (response.success) {
                alert("Los datos se han guardado correctamente.");
            } else {
                alert("Error: " + response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error:", status, error);
            console.error("Detalles:", xhr.responseText);
            alert("Ocurrió un error al procesar la solicitud: " + error);
        }
    });
}