"use strict";

const verwijderKlant = function (jsonObject) {
  console.log(jsonObject);
};

const init = function () {
  document.querySelector(".js-delete").addEventListener("click", function () {});
};

document.addEventListener("DOMContentLoaded", function () {
  console.info("DOM geladen");
  init();
});