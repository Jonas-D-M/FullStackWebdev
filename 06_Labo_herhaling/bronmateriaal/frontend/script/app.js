'use strict';

//#region ***  DOM references ***
let html_bestemming, html_bestemmingen, html_destinationHolder, html_routeHolder, html_selectedCity, html_destinationSelect, html_adaptTrain;
//#endregion

//#region ***  Callback-Visualisation - show___ ***
const showDestination = function(jsonObject) {
  // toont menu & keuzelijst
  let bestemmingenHtml = '';
  let bestemmingHtml = '<option value="" disabled="" selected="">Kies een bestemming</option>';
  for (const bestemming of jsonObject.bestemmingen) {
    bestemmingenHtml += `<li class="c-sidebar-item"><button class="c-sidebar-button js-station" data-destination-id="${bestemming.idbestemming}">${bestemming.stad}</button></li>`;
    bestemmingHtml += `<option value=${bestemming.idbestemming}>${bestemming.stad}</option>`;
  }
  html_destinationSelect.innerHTML = bestemmingHtml;
  html_destinationHolder.innerHTML = bestemmingenHtml;
  // start met het luisteren naar click event van de net aangemaakte menu items
  listenToClickDestination();
};
//#endregion

//#region ***  Callback-No Visualisation - callback___  ***
//#endregion

//#region ***  Data Access - get___ ***
const getBestemmingen = function() {
  console.info('Get bestemmingen');
  handleData('http://127.0.0.1:5000/api/v1/bestemmingen', showDestination);
};
//#endregion

//#region ***  Event Listeners - listenTo___ ***
const listenToClickDestination = function() {
  const buttons = document.querySelectorAll('.js-station');
  for (const btn of buttons) {
    btn.addEventListener('click', function() {
      console.log(this);
      console.log(this.innerHTML);
    });
  }
};
//#endregion

//#region ***  INIT / DOMContentLoaded  ***
const init = function() {
  console.log('🚂', 'https://www.youtube.com/watch?v=8oVTXSntnA0');
  // html_bestemmingen = document.querySelector('.js-destinations');
  // html_bestemming = document.querySelector('.js-destination');

  html_destinationHolder = document.querySelector('.js-destinations');
  html_routeHolder = document.querySelector('.js-trajects');
  html_selectedCity = document.querySelector('.js-departures');
  html_destinationSelect = document.querySelector('.js-destination');
  html_adaptTrain = document.querySelector('.js-adapttrain');

  if (html_destinationHolder) {
    getBestemmingen();
  }
};

document.addEventListener('DOMContentLoaded', init);
//#endregion
