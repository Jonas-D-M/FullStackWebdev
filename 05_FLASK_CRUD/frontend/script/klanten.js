"use strict";

const toonKlanten = function (jsonObject) {
  console.log(jsonObject);
  let htmlstring = `<table border="1" width="100%"><tr><th>FNaam</th><th>VNaam</th><th>Straat</th><th>Nummer</th><th>Postcode</th><th>Gemeente</th><th>verwijderen</th></tr>`;
  htmlstring += `<tr><td>${klant.FNaam}</td><td>${klant.VNaam}</td><td>${klant.Straat}</td><td>${klant.Nummer}</td><td>${klant.Postcode}</td><td>${klant.Gemeente}</td></tr>`;
  htmlstring += `</table>`;
};

const init = function () {
  console.info("Toont alle klanten");
};

document.addEventListener("DOMContentLoaded", function () {
  console.info("DOM geladen");
  init();
});