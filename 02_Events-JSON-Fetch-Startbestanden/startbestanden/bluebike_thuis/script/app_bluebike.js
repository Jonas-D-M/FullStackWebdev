'use strict';

const url = 'https://datatank.stad.gent/4/mobiliteit/bluebikedeelfietsensintpieters';

/* STAP 2 */
const laadData = function() {
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

/* STAP 3 */
const verwerkData = function(jsonObject) {
  console.log(jsonObject);
  let amountInUse;
  let amountAvailable;
  let amountTotal;
  let amountInMaintenance;
  let message = ``;

  let attr = jsonObject.properties.attributes;

  for (let el of attr) {
    switch (el.attributeName) {
      case 'CapacityInUse':
        amountInUse = el.value;
        break;
      case 'CapacityAvailable':
        amountAvailable = el.value;
        break;
      case 'CapacityInMaintenance':
        amountInMaintenance = el.value;
        break;
      case 'CapacityTotal':
        amountTotal = el.value;
        break;
    }
  }

  if (amountInUse > amountTotal / 2) {
    message = 'Haast je, meer dan de helft is al in gebruik!';
  } else {
    message = 'Nog voldoende fietsen beschikbaar';
  }

  document.querySelector('.js-amount-in-use').innerHTML = amountInUse;
  document.querySelector('.js-amount-available').innerHTML = amountAvailable;
  document.querySelector('.js-amount-out-of-use').innerHTML = amountInMaintenance;
  document.querySelector('.js-message').innerHTML = message;
};

/* STAP 1 */
document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  laadData();
});
