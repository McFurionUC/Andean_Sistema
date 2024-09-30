// Seleccionamos los elementos del formulario
const formularioRutas = document.querySelector(".formulario__rutas");
const inputHora = document.getElementById("hora");
const inputPasaje = document.getElementById("pasaje");
const inputOrigen = document.getElementById("origen");
const inputDestino = document.getElementById("destino");

// Función para validar campos
function validarCampos() {
    if (inputHora.value === "" || inputPasaje.value === "" || inputOrigen.value === "" || inputDestino.value === "") {
        alert("Por favor, complete todos los campos.");
        return false;
    }
    return true;
}

// Función para limpiar formulario
function limpiarFormulario() {
    inputHora.value = "";
    inputPasaje.value = "";
    inputOrigen.value = "";
    inputDestino.value = "";
}

// Manejo del envío del formulario
formularioRutas.addEventListener("submit", function(event) {
    event.preventDefault(); // Evitar que se recargue la página al enviar el formulario

    // Validar los campos del formulario
    if (validarCampos()) {
        // Mostrar mensaje de confirmación
        alert(`Ruta seleccionada:\nHora: ${inputHora.value}\nPasaje: S/. ${inputPasaje.value}\nOrigen: ${inputOrigen.value}\nDestino: ${inputDestino.value}`);

        // Limpiar formulario después de la confirmación
        limpiarFormulario();
    }
});
