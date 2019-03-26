// setup esm since Chronicler uses it
require = require('esm')(module);

const fs = require('fs');
const { handleWebhookEvent } = require('./Chronicler/src/helpers/pr');

const event = JSON.parse(
  fs.readFileSync(process.env.GITHUB_EVENT_PATH, { encoding: 'utf8' })
);

handleWebhookEvent(event)
  .then((res) => {
    if (res === true) {
      console.log('PR was not merged, ignoring this event.')
    } else {
      console.log('Edited or added a release draft.')
    }
  })
  .catch(err => console.log(`Error: ${err}`));
