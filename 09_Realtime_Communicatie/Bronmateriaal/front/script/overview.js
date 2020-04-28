'use strict';

const lanIP = `${window.location.hostname}:5000`;
const socket = io(`http://${lanIP}`);
