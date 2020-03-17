'use strict';
let APIKey = '74b199735022be5d6c0444a30db06528';
let uri = `http://api.openweathermap.org/data/2.5/forecast?q=kortrijk,BE&appid=${APIKey}&units=metric&lang=nl`;
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
  document.querySelector('.location').innerHTML = json.city.name;
  let str = '';
  let day = [];
  let days = ['Maandag', 'Dinsdag', 'Woensdag', 'Donderdag', 'Vrijdag', 'Zaterdag', 'Zondag'];

  for (let i = 0; i < json.list.length; i += 8) {
    let obj = json.list[i];
    let date = new Date(obj.dt * 1000);
    let daycount = date.getDay();
    str += `<div class="dag">
          <div class="datum">${days[daycount]}</div>
          <div class="afbeelding">
            <img src="images/weather/${weatherCodeToImage(obj.weather[0].id)}" alt="${obj.weather[0].description}" />
          </div>
          <div class="uitleg">
          ${obj.weather[0].description}
          </div>
          <div class="min">${Math.round(obj.main.temp_min)}&#176;C</div>
          <div class="max">${Math.round(obj.main.temp_max)}&#176;C</div>
          <div class="wind">
          <img src="images/weather/${directionToImage(parseFloat(obj.wind.deg))}" alt="${obj.wind.deg}" />
          <img src="images/weather/${strengthToImage(parseFloat(obj.wind.speed))}" alt="${obj.wind.speed}" />
          </div>
        </div>`;
  }
  document.querySelector('.forecast').innerHTML = str;
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
const directionToImage = function(direction) {
  if (direction >= 315 || direction < 45) {
    return 'wi-wind-deg-n.svg';
  } else if (direction >= 45 && direction < 135) {
    return 'wi-wind-deg-o.svg';
  } else if (direction >= 135 && direction < 225) {
    return 'wi-wind-deg-z.svg';
  } else if (direction >= 225 && direction < 315) {
    return 'wi-wind-deg-w.svg';
  }
};
const strengthToImage = function(strength) {
  let roundedStrength = Math.round(strength);
  return `wi-wind-beaufort-${roundedStrength}.svg`;
};
document.addEventListener('DOMContentLoaded', function() {
  laadWeatherInfo();
});
