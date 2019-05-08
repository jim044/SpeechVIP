"use strict"

module.exports = function(app) {
	app.get('/videotoaudio', function(req, res) {

		const fs = require('fs');
		const mysql = require('mysql');
		const { getVideoDurationInSeconds } = require('get-video-duration')
		const fluentffmpeg = require('fluent-ffmpeg');
		var ffmpeg = require('ffmpeg');
		var spawn = require('child_process').spawn;

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
									//var sql = "INSERT INTO video (nom, duree) VALUES (" + "'" + filevideo + "'," + "'" + dureevideo + "')";
									//con.query(sql, function (err, result) {
										if (err) console.log(err);
										console.log("1 record inserted");
										extractAudioFromVideo(filevideo);
									//});
									
								}
							});
						});
					}
				});
			})


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
							fs.chmod(file, '0777', function(err){
							 if(err)
							 {
							 	throw err;
							 } 
							 else
							 {
								let bitrate = '192K';
								let convert = spawn('ffmpeg', ['-i', file, '-b:a', bitrate, file.split('.').slice(0, -1).join('.') + '192bitrate.mp3'])
							 	//convertAudio(file);

							 	convert.stdout.on('data', (data) => {
								  //console.log(`stdout: ${data}`);
								});

								convert.stderr.on('data', (data) => {
								  //console.log(`stderr: ${data}`);
								});

								convert.on('close', (code) => {

								  console.log(`child process exited with code ${code}`);
								  var audiofile192Bitrate = file.split('.').slice(0, -1).join('.') + '192bitrate.mp3';
								  let convert = spawn('ffmpeg', ['-i', audiofile192Bitrate, '-f', 'segment', '-segment_time', 10, '-c', 'copy', '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/out%03d.mp3'])
								 	fs.chmod(audiofile192Bitrate, '0777', function(err){
								 		if(err)
										 {
										 	throw err;
										 } 
										 else
										 {
										 	fs.unlinkSync(file);
										 }
								 	});
								});

							 	
							 }
							});

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

		// function convertAudio(audioFileName)
		// {
		// 	let track = audioFileName;//your path to source file

		// 	fluentffmpeg(track)
		// 	.toFormat('wav')
		// 	.on('error', (err) => {
		// 	    console.log('An error occurred: ' + err.message);
		// 	})
		// 	.on('progress', (progress) => {
		// 	    // console.log(JSON.stringify(progress));
		// 	    console.log('Processing: ' + progress.targetSize + ' KB converted');
		// 	})
		// 	.on('end', () => {
		// 	    console.log('Processing finished !');
		// 	    //fs.chmod(audioFileName.split('.').slice(0, -1).join('.') + '.wav', '0777', function(err){
		// 	    	var wavfilename = audioFileName.split('.').slice(0, -1).join('.') + '.wav';
		// 		 // if(err)
		// 		 // {
		// 		 // 	throw err;
		// 		 // } 
		// 		 // else
		// 		 // {
		// 		 	fs.unlinkSync(audioFileName);

		// 		 	console.log('Fichier audioFileName ' + wavfilename) ;
		// 			var Lame = require("node-lame").Lame;

		// 			const encoder = new Lame({
		// 			    output: "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/testBitrate.mp3",
		// 			    bitrate: 192,
		// 			    mode : "m",
		// 			}).setFile(wavfilename);

		// 			encoder
		// 		    .encode()
		// 		    .then(() => {
		// 		    	console.log('Ecodage fini');
		// 		        // Encoding finished
		// 		    })
		// 		    .catch(error => {
		// 		    	console.log('Erreur encodage : ');
		// 		        // Something went wrong
		// 		    });
		// 		 // }			
		// 		// });
		// 	})
		// 	.save(audioFileName.split('.').slice(0, -1).join('.') + '.wav');//path where you want to save your file
		// }

	})
}