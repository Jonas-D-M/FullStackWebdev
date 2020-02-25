'use strict';

const init = function() {
  const range = document.querySelector('input[type=range]');
  range.addEventListener('input', function() {
    document.querySelector('.js-output').innerHTML = `${range.value}/10`;
  });
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  init();
});
