const lanIP = `${window.location.hostname}:5000`;
const socket = io(`http://${lanIP}`);

const clearClassList = function (el) {
  el.classList.remove('c-room--wait');
  el.classList.remove('c-room--on');
};

const listenToUI = function () {};

const listenToSocket = function () {};

document.addEventListener('DOMContentLoaded', function () {
  console.info('DOM geladen');
  listenToUI();
  listenToSocket();
});
