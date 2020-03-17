'use strict';

const url = 'http://api.tvmaze.com/singlesearch/shows?q=Homeland&embed=episodes';

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

const verwerkData = function(json) {
  let html = '';
  console.log(json);

  html += `<div>De naam van de serie is ${json.name}</div>
  <div>Het uur waarop het wordt uitgezonden is ${json.schedule.time}</div>
  <div>Volgende genres<ol>`;

  for (let genre of json.genres) {
    html += `<li>${genre}</li>`;
  }
  html += `</ol></div><div>Overzicht episodes<ul>`;

  for (let episode of json._embedded.episodes) {
    html += `<li>s${episode.season}-e${episode.number} - ${episode.name} </li>`;
  }

  html += `</ul></div>`;
  document.querySelector('body').innerHTML = html;
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  laadData();
});
