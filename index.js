const express = require('express')
const app = express()


var bodyParser = require('body-parser')
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

app.use('/lib',express.static(__dirname +'/lib'));
app.use('/css',express.static(__dirname +'/css'));
app.use('/video',express.static(__dirname +'/video'));
app.use('/video/Create_Video',express.static(__dirname +'/video/Create_Video'));
app.use('/node_modules',express.static(__dirname +'/node_modules'));

app.get('/', function (req, res) {
	res.sendFile(__dirname + "/html/accueil.html");
});

app.get('/adminConnexion', function (req, res) {
	res.sendFile(__dirname + "/html/connexion_admin.html");
});

app.get('/adminSpeechVIP', function (req, res) {
	res.sendFile(__dirname + "/html/connexion_admin.html");
});

app.post('/adminSpeechVIP', function (req, res) {
	var identifiant = req.body.identifiant;
	var mot_de_passe = req.body.mot_de_passe;

	const mysql = require('mysql');

		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		con.connect(function(err) {
			con.query('SELECT * FROM administration WHERE identifiant ="' + identifiant + '" AND mot_de_passe= MD5("' + mot_de_passe + '")', async function (err, result, fields) {
					/*console.log(result)*/
					if (typeof result !== 'undefined' && result.length > 0) {
						res.sendFile(__dirname + "/html/admin.html");
					}
					else
					{
						res.sendFile(__dirname + "/html/connexion_admin.html");
					}
				});
		})

		
});

require('./lib/speechToWord.js')(app)
require('./lib/convertSong.js')(app)
require('./lib/videotoaudio.js')(app)
require('./lib/mergeVideo.js')(app)
require('./lib/accueil.js')(app)
require('./lib/admin.js')(app)
require('./lib/updateData.js')(app)

app.listen(5080, function () {
  console.log('Example app listening on port 5080!')
})
