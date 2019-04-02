const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World!')
});

require('./lib/accueil.js')(app)
require('./lib/convertSong.js')(app)


app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})