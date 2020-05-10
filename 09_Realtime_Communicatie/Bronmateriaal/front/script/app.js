'use strict';

let html_addButton, html_wave, html_percentage, html_amount;
const dailyGoal = 1500;
let currentProgress = 0;
const lanIP = `${window.location.hostname}:5000`;
const socket = io(lanIP);

const updateView = function (progressInPercentage) {
  console.info('called updateView');
  html_percentage.innerHTML = progressInPercentage;
  let yValue = 100 - progressInPercentage;
  if (yValue < 0) {
    yValue = 0;
  }
  html_wave.style.transform = `translateY(${yValue}%)`;
};

const listenToUI = function () {
  const elements = document.querySelectorAll('.js-water-amount');
  for (const e of elements) {
    e.addEventListener('change', function () {
      let amount = e.dataset.amount;
      html_addButton.dataset.amount = amount;
      html_amount.innerHTML = amount;
    });
  }

  html_addButton.addEventListener('click', function () {
    const newAmount = html_addButton.dataset.amount;
    console.log(`Er wordt ${newAmount}ml gedronken`);
    socket.emit('F2B_new_logging', { amount: newAmount });
  });
};
const listenToSocket = function () {
  socket.on('B2F_connected', function (json) {
    console.log(json);
    console.log(`Eerste boodschap server: huidig aantal ml gedronken in DB ${json.currentProgress}ml`);
    currentProgress = Math.ceil((json.currentProgress / dailyGoal) * 100);
    updateView(currentProgress);
  });

  socket.on('B2F_addProgress', function (payload) {
    console.log(payload);
    currentProgress += Math.ceil((parseInt(payload.amount) / dailyGoal) * 100);
    console.log('current progress: ');
    console.log(currentProgress);
    updateView(currentProgress);
  });

  socket.on('B2F_clear', function (payload) {
    currentProgress = Math.ceil((parseInt(payload.amount) / dailyGoal) * 100);
    console.log('Logs were deleted');
    updateView(currentProgress);
  });
};

const init = function () {
  console.info('DOM Content Loaded');
  html_addButton = document.querySelector('.js-log-water');
  html_wave = document.querySelector('.js-waves');
  html_percentage = document.querySelector('.js-percentage');
  html_amount = document.querySelector('.js-log');
  listenToUI();
  listenToSocket();
};

document.addEventListener('DOMContentLoaded', init);
