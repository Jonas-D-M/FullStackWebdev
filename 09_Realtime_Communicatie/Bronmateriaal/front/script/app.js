"use strict";

let html_addButton, html_wave, html_percentage;
const dailyGoal = 1500;
let currentProgress = 0; // in milliliter
// !!
const lanIP = `192.168.x.x:5000`; //!!! PAS DIT AAN ZODAT DIT dynamisch wordt !!!
// !!
const socket = io(lanIP);
