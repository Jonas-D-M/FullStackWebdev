let currentDestinationID; // is geen DOM reference maar globale variabele

//#region ***  DOM references ***
let html_destinationHolder, html_routeHolder, html_selectedCity, html_destinationSelect, html_adaptTrain;
//#endregion

//#region ***  Callback-Visualisation - show___ ***
const showDestinations = function(jsonObject) {
  //Toon menu
  console.log(jsonObject);
  let htmlstring_bestemming = '';
  let htmlstring_options = '';
  for (const bestemming of jsonObject.bestemmingen) {
    htmlstring_bestemming += `<li class="c-sidebar-item"><button class="c-sidebar-button js-station" data-destination-id="${bestemming.idbestemming}">${bestemming.stad}</button></li>`;
    htmlstring_options += `<option value="${bestemming.idbestemming}">${bestemming.stad}</option>`;
  }
  html_destinationHolder.innerHTML = htmlstring_bestemming;

  //Toon dropdownbox
  if (html_destinationSelect) {
    html_destinationSelect.innerHTML += htmlstring_options;
  }
  listenToClickDestination();
};

const showDestinationsForUpdate = function(jsonObject) {
  //Toon dropdownbox
  console.log('****');
  console.log(jsonObject);
  let htmlstring_options = '';

  for (const bestemming of jsonObject.bestemmingen) {
    htmlstring_options += `<option value="${bestemming.idbestemming}">${bestemming.stad}</option>`;
  }
  document.querySelector('.js-destionations-for-update').innerHTML = htmlstring_options;

  //haal trein op
  let urlParams = new URLSearchParams(window.location.search);
  let treinid = urlParams.get('TreinID');
  getTrain(treinid);
};

const showTrainsOnDestinations = function(jsonObject) {
  if (jsonObject.length === 0) {
    html_routeHolder.innerHTML = 'Geen treinen.';
    return;
  }

  html_routeHolder.innerHTML = '';
  let htmlstring = '';
  console.log(jsonObject);
  for (const trein of jsonObject.trein) {
    console.log(trein);
    htmlstring += `
			<div class="c-traject">
				<div class="c-traject__info">
					<h2 class="c-traject__name">${trein.stad}</h2>
					<p class="c-traject__train-id">Trein ${trein.idtrein}</p>
				</div>
				<div class="c-traject__departure">
					${trein.vertrek}
				</div>
				<div class="c-traject__track">
					${trein.spoor}
				</div>
				<div class="c-traject__delay">
				${trein.vertraging ? trein.vertraging : '-'}
				</div>
				<div class="c-traject__cancelled">
					${trein.afgeschaft ? '<span class="c-traject__cancelled-label">afgeschaft</span>' : ''}
        </div>
        <div class="c-traject__updatevertraging">
						<a href="vertraging.html?TreinID=${trein.idtrein}">
							<svg class="c-traject__updatevertraging-symbol" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#222222" stroke-width="2" stroke-linecap="round" stroke-linejoin="arcs">
                <polygon points="16 3 21 8 8 21 3 21 3 16 16 3"></polygon>
							</svg>
						</a>
					</div>
        <div class="c-traject__update">
          <a href="aanpassen.html?TreinID=${trein.idtrein}">
						<svg class="c-traject__update-symbol" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#222222" stroke-width="2" stroke-linecap="round" stroke-linejoin="arcs">
							<polygon points="16 3 21 8 8 21 3 21 3 16 16 3"></polygon>
            </svg>
          </a>
				</div>
				<div class="c-traject__delete">
					<svg class="c-traject__delete-symbol" data-train-id=${
            trein.idtrein
          } xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="#222222" stroke-width="2" stroke-linecap="round" stroke-linejoin="arcs">
						<polyline points="3 6 5 6 21 6"></polyline>
						<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
						<line x1="10" y1="11" x2="10" y2="17"></line>
						<line x1="14" y1="11" x2="14" y2="17"></line>
					</svg>
				</div>
			</div>`;
  }

  html_routeHolder.innerHTML = htmlstring;
  listenToClickRemoveTrain();
};

const showTrain = function(jsonObject) {
  console.log(jsonObject);
  document.querySelector('#idtrein').value = jsonObject.idtrein;
  document.querySelector('#afgeschaft').value = jsonObject.afgeschaft;
  document.querySelector('#bestemmingID').value = jsonObject.bestemmingID;
  document.querySelector('#spoor').value = jsonObject.spoor;
  document.querySelector('#vertraging').value = jsonObject.vertraging;
  document.querySelector('#vertrek').value = jsonObject.vertrek;
};

//#endregion

//#region ***  Callback-No Visualisation - callback___  ***
const callbackAddTrain = function(data) {
  console.log('ADD antw van server ');
  if (data.treinid > 0) {
    console.log('ADD gelukt');
    console.log(data);
    getTrainsOnDestinations(document.querySelector('#add_bestemming').value);
    currentDestinationID = document.querySelector('#add_bestemming').value;
    html_selectedCity.innerText = document.querySelector('#add_bestemming').options[document.querySelector('#add_bestemming').selectedIndex].innerText;
    document.querySelector('#add_afgeschaft').checked = false;
    document.querySelector('#add_bestemming').selectedIndex = 0;
    document.querySelector('#add_spoor').value = '';
    document.querySelector('#add_vertraging').value = '';
    document.querySelector('#add_vertrek').value = '';
  }
};
const callbackRemoveTrain = function(data) {
  console.log(data);
  getTrainsOnDestinations(currentDestinationID);
};

const callbackAdaptTrain = function(data) {
  //console.log("trein aangepast");
  console.log(data);
  getTrain(treinid);
  //window.location = "index.html";
};
const callbackAdaptTrainError = function(data) {
  //console.log("trein aangepast");
  console.log(data);
  //window.location = "index.html";
};

const callbackUpdateDelay = function(data) {
  console.log(data);
  //window.location = 'index.html';
};
//#endregion

//#region ***  Data Access - get___ ***
const getDestinations = function() {
  handleData('http://127.0.0.1:5000/api/v1/bestemmingen', showDestinations);
};
const getTrain = function(treinid) {
  handleData(`http://127.0.0.1:5000/api/v1/treinen/${treinid}`, showTrain);
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
      html_selectedCity.innerText = btn.innerText;
      const id = btn.getAttribute('data-destination-id');
      currentDestinationID = id;
      getTrainsOnDestinations(id);
    });
  }
};

const listenToClickAddTrain = function() {
  const button = document.querySelector('#btn_add_train');
  button.addEventListener('click', function() {
    console.log('toevoegen nieuwe trein');
    const jsonobject = {
      afgeschaft: document.querySelector('#add_afgeschaft').checked,
      bestemmingID: document.querySelector('#add_bestemming').value,
      spoor: document.querySelector('#add_spoor').value,
      vertraging: document.querySelector('#add_vertraging').value == '' ? null : document.querySelector('#add_vertraging').value,
      vertrek: document.querySelector('#add_vertrek').value
    };
    console.log(jsonobject);
    handleData('http://127.0.0.1:5000/api/v1/treinen', callbackAddTrain, null, 'POST', JSON.stringify(jsonobject));
  });
};

const listenToClickRemoveTrain = function() {
  const buttons = document.querySelectorAll('.c-traject__delete-symbol');
  for (const b of buttons) {
    b.addEventListener('click', function() {
      const id = b.getAttribute('data-train-id');
      console.log('verwijder ' + id);
      handleData(`http://127.0.0.1:5000/api/v1/treinen/${id}`, callbackRemoveTrain, null, 'DELETE');
    });
  }
};

const listenToClickAdaptTrain = function() {
  let treinid = document.querySelector('#idtrein').value;
  const jsonobject = {
    idtrein: treinid,
    afgeschaft: document.querySelector('#afgeschaft').value,
    bestemmingID: document.querySelector('#bestemmingID').value,
    spoor: document.querySelector('#spoor').value,
    vertraging: document.querySelector('#vertraging').value,
    vertrek: document.querySelector('#vertrek').value
  };
  console.log(jsonobject);
  handleData(`http://127.0.0.1:5000/api/v1/treinen/${treinid}`, callbackAdaptTrain, callbackAdaptTrainError, 'PUT', JSON.stringify(jsonobject));
};
//#endregion

//#region ***  INIT / DOMContentLoaded  ***
const init = function() {
  console.log('🚂', 'https://www.youtube.com/watch?v=8oVTXSntnA0');
  // Get some DOM, we created empty earlier.
  html_destinationHolder = document.querySelector('.js-destinations');
  html_routeHolder = document.querySelector('.js-trajects');
  html_selectedCity = document.querySelector('.js-departure');
  html_destinationSelect = document.querySelector('.js-destination');
  html_adaptTrain = document.querySelector('.js-adapttrain');

  if (html_destinationHolder) {
    //deze code wordt gestart vanaf index.html
    getDestinations();
    listenToClickAddTrain();
  }
  if (html_adaptTrain) {
    let urlParams = new URLSearchParams(window.location.search);
    let treinid = urlParams.get('TreinID');
    if (treinid) {
      getTrain(treinid);
    } else {
      window.location.href = 'index.html';
    }
  }
};

document.addEventListener('DOMContentLoaded', init);
//#endregion
