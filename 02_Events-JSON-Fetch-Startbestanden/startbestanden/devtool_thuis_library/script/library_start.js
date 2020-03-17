'use strict';

/* STAP 2 */
const laadBoeken = function() {
  fetch('http://openlibrary.org/search.json?q=keuken')
    .then(function(response) {
      if (!response.ok) {
        throw Error(`Looks like there was a problem. Status Code: ${response.status}`);
      } else {
        return response.json();
      }
    })
    .then(function(jsonObject) {
      verwerkboeken(jsonObject);
    })
    .catch(function(error) {
      console.error(`fout bij verwerken json ${error}`);
    });
};

/* STAP 3 */
const verwerkboeken = function(jsonObject) {
  /* HIER KOMT JE CODE */
  console.log(jsonObject);
  let aantal = jsonObject.docs;
  console.log('aantal gevonden boeken ' + aantal.length);

  for (const keuken of jsonObject.docs) {
    console.log('Title en ondertitel ' + keuken.title);
    console.log('Geschreven door ' + keuken.author_name);
    if (keuken.subject !== (null || undefined)) {
      console.log('Boek gaat over');
      for (const subject of keuken.subject) {
        console.log('--> ' + subject);
      }
    } else {
      console.log('--- GEEN ONDERWERPEN BESCHIKBAAR ---');
    }
    console.log('********************');
  }
};

/* STAP 1 */
document.addEventListener('DOMContentLoaded', function() {
  laadBoeken();
});
