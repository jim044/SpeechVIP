"use strict"

module.exports = function(app) {
	app.get('/videotoaudio', function(req, res) {

		const fs = require('fs');
 		const extractAudio = require('ffmpeg-extract-audio')
		const mysql = require('mysql');
		const getVideoDurationInSeconds = require('get-video-duration');

		var con = mysql.createConnection({
		  host: "localhost",
		  user: "jim044",
		  password: "Obiwan2715",
		  database: "speechvip"
		});

		var pathvideo = "/home/jim044/Documents/Projets/MadeTheVIPTalk/video";
		var pathaudio = "/home/jim044/Documents/Projets/MadeTheVIPTalk/audio";
 
		fs.readdir(pathvideo, function(err, items) {
		    for (var i=0; i<items.length; i++) {
		        console.log('SELECT * FROM video WHERE nom="' + items[i] + '"');

				con.connect(function(err) {
				   con.query('SELECT * FROM video WHERE nom="' + items[i] + '"', function (err, result, fields) {
				     console.log(result);
				     if(result.length == 0)
				     	{
				     	 await extractAudio({
						   input: pathvideo + '"' + item[i] + '"',
						   output: pathvideo + '"' + item[i].split('.').slice(0, -1).join('.') + '.mp3"'
						 })
				     	}
				   });
				});
		    }
		});





	})
}