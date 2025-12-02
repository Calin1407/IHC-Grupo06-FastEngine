document.addEventListener("DOMContentLoaded", () => {
    const btn = document.getElementById("btn1");
    const form = document.getElementById("contactForm");

    if (!btn || !form) return;

    const getVal = (id) => (document.getElementById(id)?.value || "").trim();

    btn.addEventListener("click", (e) => {
        e.preventDefault();

        const nombre = getVal("nombre");
        const correo = getVal("correo");
        const ubicacion = getVal("ubicacion");
        const telefono = getVal("telefono");

        if (!nombre || !correo || !ubicacion || !telefono) {
            alert("Completa todos los campos antes de registrarte.");
            return;
        }

        const ok = confirm(
            "Confirmas tu registro?\n\n" +
            `Nombre: ${nombre}\n` +
            `Correo: ${correo}\n` +
            `Ubicación: ${ubicacion}\n` +
            `Teléfono: ${telefono}`
        );

        if (ok) {
            alert("Registro enviado!");
            form.reset();
        } else {
            alert("Registro cancelado.");
        }
    });
});
