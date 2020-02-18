'use strict';

/* STAP 2 */
const laadDataPartago = function() {
  fetch('https://datatank.stad.gent/4/mobiliteit/deelwagenspartago')
    .then(function(response) {
      if (!response.ok) {
        throw Error(`Looks like there was a problem. Status Code: ${response.status}`);
      } else {
        return response.json();
      }
    })
    .then(function(jsonObject) {
      verwerkAutos(jsonObject);
    })
    .catch(function(error) {
      console.error(`fout bij verwerken json ${error}`);
    });
};

/* STAP 3 */
/* Schrijf de correcte functie */

/* STAP 1 */
document.addEventListener('DOMContentLoaded', function() {
  laadDataPartago();
});
