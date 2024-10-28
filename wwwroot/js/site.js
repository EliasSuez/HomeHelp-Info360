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

