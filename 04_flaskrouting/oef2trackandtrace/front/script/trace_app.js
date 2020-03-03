'use strict';

const maakZichtbaar = function(isZichtbaar) {
  const htmlTrace = document.querySelector('.js-section-trace');
  const htmlInfo = document.querySelector('.js-section-info-sender');
  if (isZichtbaar === true) {
    htmlTrace.classList.remove('u-hide');
    htmlInfo.classList.remove('u-hide');
  } else {
    htmlTrace.classList.add('u-hide');
    htmlInfo.classList.add('u-hide');
  }
};

const callbackVerwerkStatus = function(_jsonObject) {
  maakZichtbaar(true);
  console.log('status succes');
  document.querySelector('.js-sender-name').innerHTML = _jsonObject.detail.naam;
  document.querySelector('.js-sender-postcode').innerHTML = _jsonObject.detail.postcode;
  if (_jsonObject.detail.afgifte) {
    document.querySelector('.js-step-drop-off').classList.add('c-step--done');
    if (!_jsonObject.detail.sorteercentrum) {
      document.querySelector('.js-step-drop-off').classList.add('c-step--active');
    }
  }
};

const callbackErrorStatus = function() {
  console.log('status error');
};

const showTrackTraceInfo = function() {
  const nr = document.querySelector('.js-search-txt').value;
  const url = `http://127.0.0.1:5000/api/v1/trace/${nr}`;
  if (nr) {
    handleData(url, callbackVerwerkStatus, callbackErrorStatus);
  }
};

const init = function() {
  document.querySelector('.js-search-btn').addEventListener('click', showTrackTraceInfo);
};

document.addEventListener('DOMContentLoaded', function() {
  console.info('DOM geladen');
  init();
});
