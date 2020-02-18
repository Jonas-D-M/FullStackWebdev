'use strict';

/* STAP 2 */
const laadBoeken = function() {
  fetch('http://openlibrary.org/search.json?q=keuken')
    .then(function(response) {
      if (!response.ok) {
        throw Error(
          `Looks like there was a problem. Status Code: ${response.status}`
        );
      } else {
        return response.json();
      }
    })
    .then(function(jsonObject) {
      verwerkboeken(jsonObject);
    })
    .catch(function(error) {
      console.error(`fout bij verwerken json ${error}`);
    });
};

/* STAP 3 */
const verwerkboeken = function(jsonObject) {
  /* HIER KOMT JE CODE */
};

/* STAP 1 */
document.addEventListener('DOMContentLoaded', function() {
  laadBoeken();
});
