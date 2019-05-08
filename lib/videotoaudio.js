"use strict"

module.exports = function(app) {
	app.get('/videotoaudio', function(req, res) {

		const fs = require('fs');
		const mysql = require('mysql');
		const { getVideoDurationInSeconds } = require('get-video-duration')
		const fluentffmpeg = require('fluent-ffmpeg');
		var ffmpeg = require('ffmpeg');
		var spawn = require('child_process').spawn;
		var path = require("path");

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
				//console.log(duration)
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
							fs.chmod(file, '0777', function(err){
								if(err)
								{
									throw err;
								} 
								else
								{
									convertAudio(file).then(function(leResultat) {
									var fileWav = file.split('.').slice(0, -1).join('.') + '.wav';
									let bitrate = '192K';
									let convert = spawn('ffmpeg', ['-i', fileWav, '-b:a', bitrate, fileWav.split('.').slice(0, -1).join('.') + '_192bitrate.wav'])
							 	//convertAudio(file);

							 	convert.stdout.on('data', (data) => {
								  //console.log(`stdout: ${data}`);
								});

							 	convert.stderr.on('data', (data) => {
								  //console.log(`stderr: ${data}`);
								});

							 	convert.on('close', (code) => {
							 		console.log(`child process exited with code ${code}`);
							 		var audiofile192Bitrate = fileWav.split('.').slice(0, -1).join('.') + '_192bitrate.wav';


							 		let changeChannel = spawn('ffmpeg', ['-i', audiofile192Bitrate, '-map_channel', "0.0.1", audiofile192Bitrate.split('.').slice(0, -1).join('.') + '_mono.wav'])
							 		changeChannel.stdout.on('data', (data) => {
									  //console.log(`stdout: ${data}`);
									});

							 		changeChannel.stderr.on('data', (data) => {
									  //console.log(`stderr: ${data}`);
									});

							 		changeChannel.on('close', (code) => {
							 			var audiofile192BitrateMono = audiofile192Bitrate.split('.').slice(0, -1).join('.') + '_mono.wav';
							 			var audiofile192BitrateMonoCut = path.basename(audiofile192BitrateMono).split('.').slice(0, -1).join('.');
							 			console.log(audiofile192BitrateMonoCut)
							 			let segment = spawn('ffmpeg', ['-i', audiofile192BitrateMono, '-f', 'segment', '-segment_time', 10, '-c', 'copy', '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/audio_cut_ten_senconds/' + audiofile192BitrateMonoCut + '_output%03d.wav'])
							 			segment.stdout.on('data', (data) => {
							 				//console.log(`stdout: ${data}`);
							 			});

							 			segment.stderr.on('data', (data) => {
							 				//console.log(`stderr: ${data}`);
							 			});

							 			segment.on('close', (code) => {
							 				fs.chmod(audiofile192Bitrate, '0777', function(err){
							 					if(err)
							 					{
							 						throw err;
							 					} 
							 					else
							 					{
							 						fs.unlinkSync(fileWav);
							 						fs.unlinkSync(audiofile192Bitrate);
							 					}
							 				});
							 			});
							 		});
							 	});
							 })
									
									
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

		var convertAudio = function(audioFileName) {
			return new Promise(function(resolve, reject) {
				let track = audioFileName;//your path to source file
				fluentffmpeg(track)
				.toFormat('wav')
				.on('error', (err) => {
					console.log('An error occurred: ' + err.message);
				})
				.on('progress', (progress) => {
			    // console.log(JSON.stringify(progress));
			    console.log('Processing: ' + progress.targetSize + ' KB converted');
			})
				.on('end', () => {
					console.log('Processing finished !');
					var wavfilename = audioFileName.split('.').slice(0, -1).join('.') + '.wav';
					fs.unlinkSync(audioFileName);
					resolve('Success!');
				})
			.save(audioFileName.split('.').slice(0, -1).join('.') + '.wav');//path where you want to save your file
		})
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