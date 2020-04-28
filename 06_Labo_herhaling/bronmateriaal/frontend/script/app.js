'use strict';

let destinationId;

//#region ***  DOM references ***
let html_destinationHolder, html_routeHolder, html_selectedCity, html_destinationSelect, html_adaptTrain;
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

const showTrainsOnDestinations = function(jsonObject) {
  if (jsonObject.length === 0) {
    html_adaptTrain.html_routeHolder.innerHTML = 'Geen treinen.';
    return;
  }
  listenToClickRemoveTrain();
};

//#endregion

//#region ***  Callback-No Visualisation - callback___  ***
const callbackAddTrain = function(data) {
  console.log('ADD antw van server');
  if (data.treinid > 0) {
    console.log('ADD gelukt');
  }
};
const callbackRemoveTrain = function(data) {
  console.log('Remove antw van server');
};
//#endregion

//#region ***  Data Access - get___ ***
const getBestemmingen = function() {
  console.info('Get bestemmingen');
  handleData('http://127.0.0.1:5000/api/v1/bestemmingen', showDestination);
};
const getTrainsOnDestinations = function(idDestination) {
  handleData(`http://127.0.0.1:5000/api/v1/treinen/bestemming/${idDestination}`, showTrainsOnDestinations);
};

//#endregion

//#region ***  Event Listeners - listenTo___ ***
const listenToClickDestination = function() {
  const buttons = document.querySelectorAll('.js-station');
  for (const btn of buttons) {
    btn.addEventListener('click', function() {
      const id = this.getAttribute('data-destination-id');
      destinationId = id;
      getTrainsOnDestinations(id);
    });
  }
};

const listenToClickAddTrain = function() {
  const button = document.querySelector('.js-add-train');
  button.addEventListener('click', function() {
    console.log('Toevoegen nieuwe trein');
    const jsonObject = '';
    console.log(jsonObject);
    handleData('http://127.0.0.1:5000/api/v1/treinen', callbackAddTrain, null, 'POST', JSON.stringify(jsonObject));
  });
};
const listenToClickRemoveTrain = function() {
  const buttons = document.querySelectorAll('.c-traject__delete-symbol');
  for (const b of buttons) {
    b.addEventListener('click', function() {
      const id = this.getAttribute('data-train-id');
      console.log('verwijder ' + id);
      handleData(`http://127.0.0.1:5000/api/v1/treinen/${id}`, callbackRemoveTrain, null, 'DELETE');
    });
  }
};
//#endregion

//#region ***  INIT / DOMContentLoaded  ***
const init = function() {
  console.log('🚂', 'https://www.youtube.com/watch?v=8oVTXSntnA0');

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
