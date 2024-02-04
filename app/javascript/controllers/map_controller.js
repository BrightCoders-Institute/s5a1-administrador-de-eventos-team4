import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="map"
export default class extends Controller {
  connect() {
    const apiKey = "pk.8ef046976867e15790d27dae0c26d553";

    var map = L.map("map").setView([19.24997, -103.72714], 13);

    L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 19,
      attribution:
        '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    }).addTo(map);

    var popup = L.popup();

    L.Control.geocoder({
      position: "topright",
      apiKey: apiKey,
      placeholder: "Buscar dirección o lugar",
    }).addTo(map);

    function onMapClick(e) {
      popup.setLatLng(e.latlng).setContent(e.latlng.toString()).openOn(map);
    }

    map.on("click", function (e) {
      let ubicacion = document.querySelector(".ubicacion");

      fetch(
        `https://us1.locationiq.com/v1/reverse?key=${apiKey}&lat=${e.latlng.lat}&lon=${e.latlng.lng}&format=json`
      )
        .then((response) => {
          if (!response.ok) {
            throw new Error("Network response was not ok");
          }
          return response.json();
        })
        .then((data) => {
          ubicacion.value = `Nombre del lugar: ${data.display_name
            .split(",")
            .slice(0, 3)
            .join(", ")}.
          Codigo Postal: ${data.address.postcode}.
          Ciudad: ${data.address.city}.
          Pais: ${data.address.country}`;
        })
        .catch((error) => {
          console.error("Hubo un problema con la solicitud:", error);
        });
    });

    map.on("click", onMapClick);
  }
}
