'use strict';

const backend_IP = 'http://localhost:5000';
const backend = backend_IP + '/api/v1';

//#region ***  DOM references ***
let html_mendeljev;
let html_info;
let html_filter;
//#endregion

//#region ***  Callback-Visualisation - show___ ***
const showTypes = function (jsonObject) {
  let htmlstring_types = ``;
  for (const types of jsonObject) {
    htmlstring_types += `<div data-typeid=${types.typeID} class="js-filter-type c-filter--type c-filter--type-${types.typeCode}">${types.type}</div>`;
  }
  html_filter.innerHTML = htmlstring_types;
  listenToClickFilter();
};

const showElements = function (jsonObject) {
  let htmlstring_elements = ``;
  for (const element of jsonObject) {
    htmlstring_elements += `
    <div data-atomic=${element.atomicNumber} class="c-mendelelement o-gridrow-${element.displayRow} o-gridcol-${element.displayColumn} c-mendelelement--${element.typeCode}">
      <div class="c-mendelelement__atomicnumber">${element.atomicNumber}</div>
      <div class="c-mendelelement__symbol">${element.symbol}</div>
    </div>`;
  }
  html_mendeljev.innerHTML = htmlstring_elements;
  listenToHover();
};

const showElementInfo = function (jsonObject) {
  let htmlstring_info = ``;
  htmlstring_info = `<p>symbool: ${jsonObject.symbol} - ${jsonObject.name}: ${jsonObject.discoverer}</p>`;
  html_info.innerHTML = htmlstring_info;
};

const showElementsByType = function (jsonObject) {
  console.log(jsonObject);
  let htmlstring_elements = ``;
  for (const element of jsonObject) {
    htmlstring_elements += `<div data-atomic=${element.atomicNumber} class="c-mendelelement o-gridrow-${element.displayRow} o-gridcol-${element.displayColumn} c-mendelelement--${element.typeCode}">
    <div class="c-mendelelement__atomicnumber">${element.atomicNumber}</div>
    <div class="c-mendelelement__symbol">${element.symbol}</div>
  </div>`;
  }
  html_mendeljev.innerHTML = htmlstring_elements;
  listenToHover();
};
//#endregion

//#region ***  Callback-No Visualisation - callback___  ***
//#endregion

//#region ***  Data Access - get___ ***
const getTypes = function () {
  handleData(backend + '/types', showTypes);
};
const getElements = function () {
  handleData(backend + '/elementen', showElements);
};
const getElementInfo = function (id) {
  handleData(backend + `/elementen/${id}`, showElementInfo);
};

const getTypesById = function (id) {
  handleData(backend + `/elementen/types/${id}`, showElementsByType);
};
//#endregion

//#region ***  Event Listeners - listenTo___ ***
const listenToHover = function () {
  const elements = document.querySelectorAll('.c-mendelelement');
  for (const el of elements) {
    el.addEventListener('mouseenter', function () {
      const id = el.getAttribute('data-atomic');
      getElementInfo(id);
    });
  }
};

const listenToClickFilter = function () {
  const types = document.querySelectorAll('.js-filter-type');
  for (const t of types) {
    t.addEventListener('click', function () {
      const id = t.getAttribute('data-typeid');
      getTypesById(id);
    });
  }
};
//#endregion

//#region ***  INIT / DOMContentLoaded  ***
const init = function () {
  html_filter = document.querySelector('.js-filter');
  html_mendeljev = document.querySelector('.js-mendeljev');
  html_info = document.querySelector('.js-info');
  getTypes();
  getElements();
};
//#endregion

document.addEventListener('DOMContentLoaded', init);
