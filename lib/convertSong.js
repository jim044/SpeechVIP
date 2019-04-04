"use strict"

module.exports = function(app) {
	app.get('/convertSong', function(req, res) {

	const Lame = require("node-lame").Lame;

	const encoder = new Lame({
	    output: "/home/jim044/Documents/Projets/MadeTheVIPTalk/audio/Donald Trump.wav",
	    bitrate: 192,
	    mode : "m",
	}).setFile("/home/jim044/Documents/Projets/MadeTheVIPTalk/audio/Donald Trump.mp3");	

	encoder
    .encode()
    .then(() => {
        // Encoding finished
    })
    .catch(error => {
        // Something went wrong
    });

	})
}