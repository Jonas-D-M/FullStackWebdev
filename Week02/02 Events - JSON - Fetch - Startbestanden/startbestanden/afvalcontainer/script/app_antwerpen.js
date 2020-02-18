'use strict';

const url = 'https://opendata.arcgis.com/datasets/413c00cfda8743fbb94ce7e7e67d67c7_49.geojson';

/* STAP 2: Schrijf een loadData functie die - via FETCH - communiseert met de API */
const loadData = function() {
  fetch(url)
    .then(function(response) {
      if (!response.ok) {
        throw Error(`Probleem bij de fetch(). Status Code: ${response.status}`);
      } else {
        console.info('Er is een response teruggekomen van de server');
        return response.json();
      }
    })
    .then(function(jsonObject) {
      console.info('json object is aangemaakt');
      console.info('verwerken data');
      verwerkData(jsonObject);
    })
    .catch(function(error) {
      console.error(`fout bij verwerken json ${error}`);
    });
};

/* STAP 3: Als fetch gelukt is, wordt deze functie uitgevoerd om de data via INNERHTML te tonen */
const verwerkData = function(json) {
  console.log('Starting verwerkData');
  console.log(json);
};

/* STAP 1: Voeg DOMContentLoaded Event Listener toe  */
document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  loadData();
});
