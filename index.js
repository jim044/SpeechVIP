const express = require('express')
const app = express()

var bodyParser = require('body-parser')
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

app.use('/css',express.static(__dirname +'/css'));
app.use('/video',express.static(__dirname +'/video'));
app.use('/node_modules',express.static(__dirname +'/node_modules'));

app.get('/', function (req, res) {
	res.sendFile(__dirname + "/html/accueil.html");
});


require('./lib/speechToWord.js')(app)
require('./lib/convertSong.js')(app)
require('./lib/videotoaudio.js')(app)
require('./lib/mergeVideo.js')(app)
require('./lib/accueil.js')(app)

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})
