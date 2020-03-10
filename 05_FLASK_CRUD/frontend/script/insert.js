'use strict';

const insertKlaar = function(jsonObject) {
  console.log(jsonObject);
  document.querySelector('.js-result').innerHTML = `Klant met id ${jsonObject.KlantID} werd toegevoegd.`;
};

const init = function() {
  document.querySelector('.js-add').addEventListener('click', function() {
    const body = JSON.stringify({
      FNaam: document.querySelector('#FNaam').value,
      Gemeente: document.querySelector('#Gemeente').value,
      Nummer: document.querySelector('#Nummer').value,
      Postcode: document.querySelector('#Postcode').value,
      Straat: document.querySelector('#Straat').value,
      VNaam: document.querySelector('#VNaam').value
    });
    handleData('http://localhost:5000/api/v1/klanten', insertKlaar, null, 'POST', body);

    console.log(body);
  });
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  init();
});
