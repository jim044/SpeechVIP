"use strict"

module.exports = function(app) {
	app.get('/convertSong', function(req, res) {

	//console.log('Fichier audioFileName ' + audioFileName) 



				    const Lame = require("node-lame").Lame;
 
					const encoder = new Lame({
					    output: "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/testBitrate.mp3",
					    bitrate: 192
					}).setFile("/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump.wav");
					 
					encoder
					    .encode()
					    .then(() => {
					        console.log('ok');
					    })
					    .catch(error => {
					        console.log('erreur');
					    });


	})
}