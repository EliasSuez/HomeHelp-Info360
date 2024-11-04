let selectedRole = ""; 

function visitAs(role) {
    selectedRole = role;
    console.log(`Visitando como: ${role}`);
    document.getElementById("welcomeModal").style.display = "none";
    
    const ctaButton = document.getElementById("cta-button");
    if (role === "trabajador") {
        ctaButton.innerText = "Ofrece tus servicios ahora";
    } else if (role === "empleador") {
        ctaButton.innerText = "Encuentra un profesional ahora";
    }
}

function handleButtonClick() {
    if (selectedRole === "trabajador") {
        console.log("Redirigiendo a la página para ofrecer servicios...");
    } else if (selectedRole === "empleador") {
        console.log("Redirigiendo a la búsqueda de profesionales...");
    } else {
        console.log("Por favor, selecciona un rol primero.");
    }
}

window.onload = function() {
    document.getElementById("welcomeModal").style.display = "flex";
};

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
    let errors = [];

    if (!email) {
        errors.push("El campo de email es obligatorio.");
    }
    if (!password) {
        errors.push("El campo de contraseña es obligatorio.");
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email && !emailPattern.test(email)) {
        errors.push("Por favor ingresa un email válido.");
    }

    if (errors.length > 0) {
        event.preventDefault(); 
        alert(errors.join("\n")); 
    }
});

document.querySelector(".formRegister").addEventListener("submit", function(event) {
    const Name = document.getElementById("Name").value
    const LastName = document.getElementById("Lastname").value
    const Email = document.getElementById("Email").value
    const DNI = document.getElementById("DNI").value
    const Birthdate = document.getElementById("Birthdate").value
    const Address = document.getElementById("Address").value
    const Password = document.getElementById("Password").value
    let errors = [];

    if(Name != ""){
        errors.push("Por favor ingrese un nombre valido")        
    }
    if(LastName != ""){
        errors.push("Por favor ingrese un apellido valido")        
    }
    if(Email != ""){
        errors.push("Por favor ingrese un email valido")        
    }
    if(DNI != ""){
        errors.push("Por favor ingrese un email valido")        
    }
    if(Birthdate < Date.now && Birthdate.year > 0){
        errors.push("Por favor ingrese un año de nacimiento valido")        
    }
    if(Address != ""){
        errors.push("Por favor ingrese un email valido")        
    }
    
});



