'use strict';
let gameList = [];

const url = 'https://www.diero.be/MCT/JSON/spellen.json';

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

const addGame2Select = function(id, naam) {
  document.querySelector('.js-spel').innerHTML += `<option value="${id}">${naam}</option>`;
};

const verwerkData = function(jsonObject) {
  for (let spel of jsonObject) {
    addGame2Select(spel.gameId, spel.name);
    gameList['' + spel.gameId] = spel.image;
  }
  console.log(gameList);
};

const toonImage = function(gameId) {
  document.querySelector('.js-image').innerHTML = `<img src="${gameList[gameId]}" alt="prentje van een spel" id="flag" />`;
};

const setValidity = function(e, foutboodschap) {
  e.target.setCustomValidity(foutboodschap);
};

const init = function() {
  laadData();
  const selector = document.querySelector('.js-spel');
  selector.addEventListener('input', function() {
    // zoeken op welk spel ik geklikt heb
    const selectedSpel = selector.options[selector.selectedIndex].value;
    toonImage(selectedSpel);
    // het aangeklikte spel tonen
  });
  document.querySelector('#naam').addEventListener('invalid', function(e) {
    setValidity(e, 'Naam is niet correct, minimum...');
  });
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  init();
});
