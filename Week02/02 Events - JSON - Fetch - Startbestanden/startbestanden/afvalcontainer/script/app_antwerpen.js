'use strict';
let link = 'https://opendata.arcgis.com/datasets/413c00cfda8743fbb94ce7e7e67d67c7_49.geojson';

const init = function() {
  fetch(link)
    .then(function(response) {
      if (!response.ok) {
        throw Error(`Looks like there was a problem. Status Code: ${response.status}`);
      } else {
        return response.json();
      }
    })
    .then(function(jsonObject) {
      verwerken(jsonObject);
    })
    .catch(function(error) {
      console.error(`fout bij verwerken json ${error}`);
    });
};
const verwerken = function(json) {
  let lijst = '';
  for (let straat of json.features) {
    lijst += `<div class="locatie">
    <div class="adres">${straat.properties.STRAATNAAM}</div>
    <div class="row">
      <div>
        GFT
        <div class="aantal">${zeroToStreep(straat.properties.AANTAL_CNTR_GFT)}</div>
      </div>
      <div>
        GLAS
        <div class="aantal">${zeroToStreep(straat.properties.AANTAL_CNTR_GLAS)}</div>
      </div>
      <div>
        PMD
        <div class="aantal">${zeroToStreep(straat.properties.AANTAL_CNTR_PMD)}</div>
      </div>
      <div>
        REST
        <div class="aantal">${zeroToStreep(straat.properties.AANTAL_CNTR_REST)}</div>
      </div>
      <div>
        PAPIER
        <div class="aantal">${zeroToStreep(straat.properties.AANTAL_CNTR_PK)}</div>
      </div>
    </div>
  </div>`;
  }
  document.querySelector('#containerLocaties').innerHTML = lijst;
};
const zeroToStreep = function(input) {
  return input === 0 ? '---' : input;
};
document.addEventListener('DOMContentLoaded', function() {
  init();
});
