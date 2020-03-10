"use strict";

const insertKlaar = function (jsonObject) {
  console.log(jsonObject);
};

const init = function () {
  document.querySelector(".js-add").addEventListener("click", function () {
    const body = JSON.stringify({
      FNaam: document.querySelector("#FNaam").value,
      Gemeente: document.querySelector("#Gemeente").value,
      Nummer: document.querySelector("#Nummer").value,
      Postcode: document.querySelector("#Postcode").value,
      Straat: document.querySelector("#Straat").value,
      VNaam: document.querySelector("#VNaam").value
    });
    console.log(body);
  });
};

document.addEventListener("DOMContentLoaded", function () {
  console.info("DOM geladen");
  init();
});