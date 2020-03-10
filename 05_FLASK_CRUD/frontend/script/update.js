'use strict';

const toonKlant = function (jsonObject) {
  const klant = jsonObject.klant;
  document.querySelector('#KlantID').value = klant.KlantID;
  document.querySelector('#FNaam').value = klant.FNaam;
  document.querySelector('#VNaam').value = klant.VNaam;
  document.querySelector('#Straat').value = klant.Straat;
  document.querySelector('#Nummer').value = klant.Nummer;
  document.querySelector('#Postcode').value = klant.Postcode;
  document.querySelector('#Gemeente').value = klant.Gemeente;
};

const updateKlaar = function (jsonObject) {
  document.querySelector('#result').innerHTML = jsonObject.klantID + ' aangepast.';
};

const init = function () {
  console.info('Toont Klanten');
  // Ophalen van de bestaande gegevens van de klant.
  const body = JSON.stringify({
    FNaam: document.querySelector('#FNaam').value,
    Gemeente: document.querySelector('#Gemeente').value,
    Nummer: document.querySelector('#Nummer').value,
    Postcode: document.querySelector('#Postcode').value,
    Straat: document.querySelector('#Straat').value,
    VNaam: document.querySelector('#VNaam').value
  });
};

document.addEventListener('DOMContentLoaded', function () {
  console.info('DOM geladen');
  init();
});