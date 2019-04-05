"use strict"

module.exports = function(app) {
	app.get('/videotoaudio', function(req, res) {

		const fs = require('fs');
		const mysql = require('mysql');
		const { getVideoDurationInSeconds } = require('get-video-duration')

		var ffmpeg = require('ffmpeg');

		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		var pathvideo = "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video";
		var pathaudio = "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio";

		fs.readdir(pathvideo, function(err, items) {
			for (var i=0; i<items.length; i++) {
				var filevideo = '';
				var fileaudio = '';

				filevideo = items[i].replace(/ /gi, "_");
				rename(items[i], filevideo);        
			}
			res.end('Bien joue');
		});

		function rename(filevideoToRename, filevideo)
		{
			var dureevideo = '';

			getVideoDurationInSeconds(pathvideo + '/' + filevideo).then((duration) => {
				console.log(duration)
				dureevideo = duration;
			})

			fs.rename(pathvideo + '/' + filevideoToRename, pathvideo + '/' + filevideo, function(err) {
				if ( err ) {
					console.log('ERROR: ' + err);
				}
				else
				{
					con.connect(function(err) {
						con.query('SELECT * FROM video WHERE nom="' + filevideo + '"', function (err, result, fields) {
							if(result.length == 0)
							{
								
								if (err) console.log(err);
								var sql = "INSERT INTO video (nom, duree) VALUES (" + "'" + filevideo + "'," + "'" + dureevideo + "')";
								con.query(sql, function (err, result) {
									if (err) console.log(err);
									console.log("1 record inserted");
									extractAudioFromVideo(filevideo);
								});
								
							}
						});
					});
				}
			});
		}

		function extractAudioFromVideo(filevideo)
		{
			console.log('extractAudioFromVideo');
			try {
				var process = new ffmpeg(pathvideo + '/' + filevideo);
				process.then(function (video) {
					video.fnExtractSoundToMP3(pathaudio + '/' + filevideo.split('.').slice(0, -1).join('.') + '.mp3', function (error, file) {
						if (!error)
						{
							console.log('Audio file: ' + file);
						}
						else
						{
							console.log(error);
						}
					});
				}, function (err) {
					console.log('Error: ' + err);
				});
			} catch (e) {
				console.log(e.code);
				console.log(e.msg);
			}
		}

	})
}