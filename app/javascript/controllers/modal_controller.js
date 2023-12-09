
// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    // Muestra el modal con una animación después de un pequeño retraso
    setTimeout(() => {
      this.modalTarget.classList.remove('fade');
      this.modalTarget.classList.add('show');
      this.modalTarget.classList.add('d-block');
    }, 50);

    // Escucha el evento Turbo submit-end para manejar respuestas de formularios
    this.element.addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        Turbo.visit(event.detail.fetchResponse.response.url);
      }
    });

    // Escucha el evento para abrir el modal desde otro índice
    document.addEventListener("openModalFromOtherIndex", () => {
      this.openModal();
    });
  }

  openModal() {
    // Abre el modal desde otro índice
    this.modalTarget.classList.remove('fade');
    this.modalTarget.classList.add('show');
    this.modalTarget.classList.add('d-block');
  }

  close() {
    // Oculta el modal con una animación
    this.modalTarget.classList.add('fade');
    this.modalTarget.classList.remove('show');
    this.modalTarget.classList.remove('d-block');

    // Elimina el elemento después de completar la animación
    setTimeout(() => {
      this.element.parentElement.removeAttribute("src");
      this.element.remove();
    }, 250);
  }
}
