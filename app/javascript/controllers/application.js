import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

document.addEventListener("DOMContentLoaded", function () {
  let btnAceptar = document.querySelector(".btn-primary");
  let btnCerrar = document.querySelector(".btn-secondary");
  let modal = document.getElementById("exampleModal");

  btnAceptar.addEventListener("click", () => {
    let modalInstance = new bootstrap.Modal(modal);
    modalInstance.show();
  });

  btnCerrar.addEventListener("click", () => {
    let modalInstance = new bootstrap.Modal(modal);
    modalInstance.hide();
  });
});
