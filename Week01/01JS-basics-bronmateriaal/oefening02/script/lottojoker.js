'use strict';

const zodiac = ['boogschutter', 'kreeft', 'leeuw', 'maagd', 'ram', 'schorpioen', 'steenbok', 'stier', 'tweelingen', 'vissen', 'waterman', 'weegschaal'];

const randomNumber = function(maxNumber) {
  let randNumber = Math.floor(Math.random() * maxNumber + 1);
  return randNumber;
};

const showWinningNumbers = function(joker) {
  let html = '';
  joker.forEach(element => {
    if (typeof element == 'number') {
      html += `<div>${element}</div>`;
    } else {
      html += `<div><img src="images/zodiac/${element}.png" alt="${element}"></div>`;
    }
  });
  return html;
};

const generateJoker = function(parAantalRands, parAantalDieren) {
  let array = [];
  for (let index = 0; index < parAantalRands; index++) {
    let randy = randomNumber(9);
    console.log(randy);
    array.push(randy);
  }
  for (let index = 0; index < parAantalDieren; index++) {
    let randZodiac = zodiac[randomNumber(zodiac.length)];
    console.log(randZodiac);
    array.push(randZodiac);
  }
  return array;
};

const init = function() {
  const joker = generateJoker(6, 2);
  console.log(joker);
  document.querySelector('.js-result').innerHTML = showWinningNumbers(joker);
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  init();
});
