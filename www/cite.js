// Inicializa los popovers Bootstrap 5 para las citas (.jn-cite).
// Se llama al cargar y después de cada actualización de Shiny.

function initCitePopovers() {
  document.querySelectorAll('.jn-cite[data-bs-toggle="popover"]').forEach(function (el) {
    if (!bootstrap.Popover.getInstance(el)) {
      new bootstrap.Popover(el, { html: true, sanitize: false });
    }
  });
}

document.addEventListener('DOMContentLoaded', initCitePopovers);

// Re-inicializar tras cada valor reactivo que Shiny actualice en el DOM
$(document).on('shiny:value', function () {
  setTimeout(initCitePopovers, 150);
});
