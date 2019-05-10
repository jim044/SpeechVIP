const express = require('express')
const app = express()

var bodyParser = require('body-parser')
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

app.get('/', function (req, res) {
  res.send('Hello World!')
});

require('./lib/speechToWord.js')(app)
require('./lib/convertSong.js')(app)
require('./lib/videotoaudio.js')(app)


app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})
