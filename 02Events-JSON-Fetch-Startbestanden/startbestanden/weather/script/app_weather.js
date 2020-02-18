'use strict';
let APIKey = '74b199735022be5d6c0444a30db06528';
let uri = `http://api.openweathermap.org/data/2.5/forecast?q=kortrijk,BE&appid=${APIKey}&units=metric&lang=nl`;
/*
<div class="dag">
  <div class="datum">Maandag</div>
  <div class="afbeelding">
    <img src="images/weather/wi-thunderstorm.svg" alt="Onweer" />
  </div>
  <div class="uitleg">
    Onweer
  </div>
  <div class="min">10</div>
  <div class="max">20</div>
</div>
*/
const laadWeatherInfo = function() {
  fetch(uri)
    .then(function(response) {
      if (!response.ok) {
        throw Error(`Looks like there was a problem. Status Code: ${response.status}`);
      } else {
        return response.json();
      }
    })
    .then(function(jsonObject) {
      verwerkWeer(jsonObject);
    })
    .catch(function(error) {
      console.error(`fout bij verwerken json ${error}`);
    });
};
const verwerkWeer = function(json) {
  console.log(json);
  document.querySelector('.js-city-placeholder').innerHTML = json.city.name;
  let str = '';
  let day = [];
  let days = ['Maandag', 'Dinsdag', 'Woensdag', 'Donderdag', 'Vrijdag', 'Zaterdag', 'Zondag'];

  for (let i = 0; i < json.list.length; i += 8) {
    let obj = json.list[i];
    let date = new Date(obj.dt * 1000);
    let daycount = date.getDay();
    str += `<div class="c-forecast">
            <div class="c-forecast__datum">${days[daycount]}</div>
            <div class="c-forecast__sym">
              <img src="images/weather/${weatherCodeToImage(obj.weather[0].id)}" alt="${obj.weather[0].description}" />
            </div>

            <div class="c-forecast__uitleg">
            ${obj.weather[0].description}
            </div>
            <div class="c-forecast__max">${Math.round(obj.main.temp_max)}&#176;C</div>
            <div class="c-forecast__min">${Math.round(obj.main.temp_min)}&#176;C</div>
           
          </div>`;
  }
  document.querySelector('.js-weather-placeholder').innerHTML = str;
};
const weatherCodeToImage = function(code) {
  let codeString = code.toString();
  let firstDigit = codeString.substring(0, 1);
  let specials = {
    800: 'wi-day-sunny.svg',
    801: 'wi-day-sunny-overcast.svg',
    900: 'wi-thunderstorm.svg'
  };
  let normal = {
    2: 'wi-thunderstorm.svg',
    3: 'wi-sprinkle.svg',
    5: 'wi-rain.svg',
    6: 'wi-snow.svg',
    7: 'wi-fog.svg',
    8: 'wi-cloud.svg'
  };
  return specials[code] !== undefined ? specials[code] : normal[firstDigit] !== undefined ? normal[firstDigit] : 'wi-alien.svg';
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOMContent loaded');
  laadWeatherInfo();
});
