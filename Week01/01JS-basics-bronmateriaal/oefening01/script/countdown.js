const setSpaces = function(parGetal) {
  let spaces = '';
  for (let index = 0; index < parGetal; index++) {
    spaces += '&nbsp';
  }
  console.log(spaces);
  return spaces;
};

const getCSSClass = function(parGetal) {
  let CSSclass;
  if (parGetal % 2 == 0) {
    CSSclass = 'u-even';
    return CSSclass;
  } else {
    CSSclass = 'u-odd';
    return CSSclass;
  }
};

const createCountDown = function() {
  let counter = '';
  let size = 10;

  for (size <= 10; size--; ) {
    counter += `<span style="font-size: ${size + 1}em" class="${getCSSClass(size + 1)}">${size + 1}${setSpaces(size + 1)}</span>`;
    console.log(size);
  }

  return counter;
};

const init = function() {
  document.querySelector('.js-holder').innerHTML = createCountDown();
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  init();
});
