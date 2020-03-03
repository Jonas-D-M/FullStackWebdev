'use strict';
let html_gewicht, html_lengte, html_button;

const checkValues = function(lengte, gewicht) {
  if (lengte >= 150 && lengte <= 215 && gewicht >= 35 && gewicht <= 200) {
    html_button.disabled = '';
  } else {
    html_button.disabled = 'disabled';
  }
};
const berekenBMI = function(lengte, gewicht) {
  lengte = lengte / 100;
  return gewicht / (lengte * lengte);
};

const addEventListeners = function() {
  html_lengte.addEventListener('input', function() {
    checkValues(html_lengte.value, html_gewicht.value);
  });
  html_gewicht.addEventListener('input', function() {
    checkValues(html_lengte.value, html_gewicht.value);
  });
  html_button.addEventListener('click', function() {
    console.info(berekenBMI(html_lengte.value, html_gewicht.value));
  });
};

const init = function() {
  console.info('Script geladen');
  html_gewicht = document.querySelector('.js-gewicht');
  html_lengte = document.querySelector('.js-lengte');
  html_button = document.querySelector('input[type=button]');

  html_button.disabled = 'disabled';

  addEventListeners();
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  init();
});
