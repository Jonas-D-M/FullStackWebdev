'use strict';

const lanIP = `${window.location.hostname}:5000`;
const socket = io(`http://${lanIP}`);

let html_table, html_button;

const updateTable = function (json) {
  console.info('Updating table');
  let html = ``;
  for (const e of json.logs) {
    html += `<tr class="c-row">
    <td class="c-cell">${e.date}</td>
    <td class="c-cell">${e.amount}ml</td>
    </tr>`;
  }
  html_table.innerHTML = html;
  console.info('Table updated');
};

const getLogs = function () {
  console.info('Getting logs');
  handleData(`http://${lanIP}/api/v1/progress`, updateTable);
};

const deleteLogsToday = function () {
  console.info('Logs deleted');
};

const listenToButton = function () {
  console.info('Adding event listener to button');
  html_button.addEventListener('click', function () {
    console.log('op de button geklikt');
    handleData(`http://${lanIP}/api/v1/progress/today`, deleteLogsToday, null, 'DELETE');
  });
};

const listenToSockets = function () {
  socket.on('B2F_clear', getLogs);
  socket.on('B2F_addProgress', getLogs);
};

const init = function () {
  console.info('DOMContentLoaded');

  html_table = document.querySelector('.js-table');
  html_button = document.querySelector('.js-clear-amount-today');
  getLogs();
  listenToButton();
  listenToSockets();
};

document.addEventListener('DOMContentLoaded', init);
