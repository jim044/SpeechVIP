"use strict"

module.exports = function(app) {
	app.get('/videotoaudio', function(req, res) {
		const fs = require('fs');
		const mysql = require('mysql');
		const { getVideoDurationInSeconds } = require('get-video-duration')
		const fluentffmpeg = require('fluent-ffmpeg');
		const { getAudioDurationInSeconds } = require('get-audio-duration')
		const folderNameReceive = req.body.folderAudio
		// Imports the Google Cloud client library
		const speech = require('@google-cloud/speech').v1p1beta1;
		// Creates a client
		const client = new speech.SpeechClient();


		var ffmpeg = require('ffmpeg');
		var spawn = require('child_process').spawn;
		var path = require("path");
		var arrayVideoPath = [];
		var numberCut = 0;
		var filenameOriginal = req.query.filename;
		var personne = req.query.personne;
		var langue = req.query.language.split('/')[0];
		var codelangue = req.query.language.split('/')[1];
		var idPersonne;
		var idLangue;
		var idVideo;


		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		con.connect(function(err) {
			con.query('SELECT * FROM personne WHERE PrenomNom="' + personne + '"', async function (err, result, fields) {
				idPersonne = result[0].id;
			})
		})

		con.connect(function(err) {
			con.query('SELECT * FROM langue WHERE languageCode="' + codelangue + '"', async function (err, result, fields) {
				idLangue = result[0].id;
			})
		})

		var pathvideo = "/home/jim044/Projets/SpeechVIP/video";
		var pathvideoAttente = "/home/jim044/Projets/SpeechVIP/video/Attente";
		var pathaudio = "/home/jim044/Projets/SpeechVIP/audio";
		var filevideo = '';
		var fileaudio = '';


		filevideo = filenameOriginal.replace(/ /gi, "_");
		filevideo = filevideo.replace("'", "")
		filevideo = filevideo.replace(" ", "")
		filevideo = filevideo.replace("(", "")
		filevideo = filevideo.replace(")", "")

		rename(filenameOriginal, filevideo);
		res.end('Bien joue');

		function rename(filevideoToRename, filevideo)
		{

			var dureevideo = '';

			getVideoDurationInSeconds(pathvideoAttente + '/' + filevideoToRename).then((duration) => {

				dureevideo = duration;

				fs.rename(pathvideoAttente + '/' + filevideoToRename, pathvideoAttente + '/' + filevideo, function(err) {
					if ( err ) {
						console.log('ERROR: ' + err);
					}
					else
					{
						con.connect(function(err) {
							con.query('SELECT * FROM video WHERE nom="' + filevideo + '"', async function (err, result, fields) {
								if(result.length == 0)
								{
									if (err) console.log(err);

									var sql = 'INSERT INTO video (id_personne, id_language, nom, duree) VALUES (' + idPersonne + ',' + idLangue + ',' + '"' + filevideo + '",' + '"' + dureevideo + '")';
									con.query(sql, function (err, result) {
										idVideo = result.insertId;
										if (err) console.log(err);
										extractAudioFromVideo(filevideo);
									});
								}
							});
						});
					}
				});
			})
			return true;
		}

		function extractAudioFromVideo(filevideo)
		{
			try {
				
				var process = new ffmpeg(pathvideoAttente + '/' + filevideo);
				process.then(async function (video) {
					await video.fnExtractSoundToMP3(pathaudio + '/' + filevideo.split('.').slice(0, -1).join('.') + '.mp3', function (error, file) {
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
							 	});

							 	convert.stderr.on('data', (data) => {
							 	});

							 	convert.on('close', (code) => {
							 		var audiofile192Bitrate = fileWav.split('.').slice(0, -1).join('.') + '_192bitrate.wav';


							 		let changeChannel = spawn('ffmpeg', ['-i', audiofile192Bitrate, '-map_channel', "0.0.1", audiofile192Bitrate.split('.').slice(0, -1).join('.') + '_mono.wav'])
							 		changeChannel.stdout.on('data', (data) => {
							 		});

							 		changeChannel.stderr.on('data', (data) => {
							 		});

							 		changeChannel.on('close', (code) => {
							 			var audiofile192BitrateMono = audiofile192Bitrate.split('.').slice(0, -1).join('.') + '_mono.wav';
							 			var audiofile192BitrateMonoCut = path.basename(audiofile192BitrateMono).split('.').slice(0, -1).join('.');
							 			
							 			let segment = spawn('ffmpeg', ['-i', audiofile192BitrateMono, '-f', 'segment', '-segment_time', 10, '-c', 'copy', '/home/jim044/Projets/SpeechVIP/audio/audio_cut_ten_senconds/' + audiofile192BitrateMonoCut + '_%03d.wav'])
							 			segment.stdout.on('data', (data) => {

							 			});

							 			segment.stderr.on('data', (data) => {
							 			});

							 			segment.on('close', (code) => {
							 				fs.chmod(audiofile192BitrateMono, '0777', function(err){
							 					if(err)
							 					{
							 						throw err;
							 					} 
							 					else
							 					{
							 						getAudioDurationInSeconds(audiofile192BitrateMono).then(async(audioDuration) => {
							 							var sql = 'INSERT INTO audio (id_video, nom, duree) VALUES (' + idVideo + ',' + '"' + audiofile192BitrateMonoCut + '",' + '"' + audioDuration + '")';
							 							con.query(sql, async function (err, result) {
							 								fs.unlinkSync(fileWav);
							 								fs.unlinkSync(audiofile192Bitrate);
							 								var numberCutAudio = audioDuration / 10;
							 								await cutAudioByWord(audiofile192BitrateMonoCut, Math.ceil(numberCutAudio)).then(function(leResultat) {
							 									
							 								})
							 								
							 								fs.unlinkSync(audiofile192BitrateMono);
							 								fs.rename(pathvideoAttente + "/" + filenameOriginal, '/home/jim044/Projets/SpeechVIP/video/Archives/' + filenameOriginal, function (err) {
							 								})
							 								
							 								return true;
							 							});
							 						});
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
						return true;
					});
				}, function (err) {
					console.log('Error: ' + err);
				});
			} catch (e) {
				console.log(e.code);
				console.log(e.msg);
			}
			return true;
	 //});
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
				})
				.on('end', () => {
					var wavfilename = audioFileName.split('.').slice(0, -1).join('.') + '.wav';
					fs.unlinkSync(audioFileName);
					resolve('Success!');
				})
			.save(audioFileName.split('.').slice(0, -1).join('.') + '.wav');//path where you want to save your file
		})
	}



	var cutAudioByWord = function(fileAudioName, numberOfCut)
	{
		return new Promise(async function(resolution, rejet)
		{
			var nomFichierWithNumber;

			for (var i=0; i<numberOfCut; i++) {
				if (i<10)
				{
					nomFichierWithNumber = fileAudioName + '_00' + i + '.wav'
				}
				else if(i<100 && i>9)
				{
					nomFichierWithNumber = fileAudioName + '_0' + i + '.wav'
				}
				else if(i>99)
				{
					nomFichierWithNumber = fileAudioName + '_' + i + '.wav'
				}
				
				var nomFichierASupprimer = '/home/jim044/Projets/SpeechVIP/audio/audio_cut_ten_senconds/' + nomFichierWithNumber;

				await recognitionAudio(nomFichierWithNumber, i, numberOfCut).then(function(leResultat) {
					fs.unlinkSync(nomFichierASupprimer);
					return leResultat;
				});
			}
			resolution('Recognition Word Done');
		})
	}
	

	var recognitionAudio = async function(nomFichierWithNumber, i, nombreElementACouper)
	{
		return new Promise(async function(resolveAgain, RejectAgain)
		{
			// The name of the audio file to transcribe
			var fileName = '/home/jim044/Projets/SpeechVIP/audio/audio_cut_ten_senconds/' + nomFichierWithNumber;
			var getFileNameSearch = fileName.search('_192bitrate');
			var getFilePathCut = fileName.substring(0, getFileNameSearch);
			var nameOfFile = path.basename(getFilePathCut);
			var debutDuDecoupage = 0;
			var finDuDecoupage = 0;
			
			
			
			var file = fs.readFileSync(fileName);
			var audioBytes = file.toString('base64');
			
			var audio = {
				content: audioBytes,
			};
			var config = {
				enableWordConfidence: true,
				enableWordTimeOffsets: true,
				encoding: 'LINEAR16',
				sampleRateHertz: 44100,
				languageCode: codelangue,
			};
			var request = {
				audio: audio,
				config: config,
			};

			await client
			.longRunningRecognize(request)
			.then(data => {
				var operation = data[0];
				return operation.promise();
			})
			.then(data => {
				var response = data[0];
				if( response.results[0] === undefined)
				{
					resolveAgain('Aucun cut possible');
				}
				var WordsArray = response.results[0].alternatives[0].words;

				getCutVideo(nombreElementACouper, WordsArray, fileName, getFileNameSearch, getFilePathCut, nameOfFile, debutDuDecoupage, finDuDecoupage, i).then(() => {
					
					resolveAgain('Fin');
				})

			})
			.catch(err => {
				console.error('ERROR:', err);
			});
		})
	}

	const getCutVideo = async (nombreElementACouper, WordsArray, fileName, getFileNameSearch, getFilePathCut, nameOfFile, debutDuDecoupage, finDuDecoupage, i) => {
		var j = 0;
		var sentence = "";
		var WordSentenceAdd = 0;
		var retourCutvideo;

		for ( const item of WordsArray)
		{
			numberCut += 1;
			var wordInfo = item;
			if (wordInfo.confidence > 0.9)
			{

				const startSecs =
				`${wordInfo.startTime.seconds}` +
				`.` +
				wordInfo.startTime.nanos / 100000000;
				const endSecs =
				`${wordInfo.endTime.seconds}` +
				`.` +
				wordInfo.endTime.nanos / 100000000;

				var fileNameVideo = '/home/jim044/Projets/SpeechVIP/video/Attente/' + nameOfFile + '.mp4';
				var folderName = '/home/jim044/Projets/SpeechVIP/video/video_cut_word/'


				if (debutDuDecoupage == 0)
				{
					debutDuDecoupage = (i * 10) + parseFloat(startSecs)
				}

				if (sentence == "")
				{
					sentence = wordInfo.word
				}
				else
				{
					WordSentenceAdd =+ 1;
					sentence = sentence + " " + wordInfo.word
				}

				

				if( j % 3 === 0)
				{
					WordSentenceAdd = 0;
					finDuDecoupage = (i * 10) + parseFloat(endSecs)
					if (/\s/.test(sentence)) {
					    retourCutvideo = await cutVideo(sentence, nameOfFile, folderName, fileNameVideo, debutDuDecoupage, finDuDecoupage) //.then(function(leResultat) {
					    	if (i == nombreElementACouper-1)
					    	{
					    		fs.rename(fileNameVideo, '/home/jim044/Projets/SpeechVIP/video/Archives/' + nameOfFile + '.mp4', function (err) {
					    		})
					    	}

					    	sentence = "";
					    	debutDuDecoupage = 0;
					    	finDuDecoupage = 0;
					    }
					    
					}

				};
				j += 1;
			}
		}

		const cutVideo = function(sentenceTranscrib, nameOfFile, folderName, videoPath, startTime, endTime) 
		{

			var startTimeOffset = parseFloat(startTime);
			var endTimeOffset = parseFloat(endTime);

			var duration = parseFloat(endTimeOffset) - parseFloat(startTimeOffset);


			startTimeOffset = parseFloat(startTimeOffset)
			endTimeOffset = parseFloat(endTimeOffset)

			if(duration > 0.6)
			{
				var numberToCutMoisUn = numberCut - 1;

				fluentffmpeg(videoPath)
				.setStartTime(sec2time(startTimeOffset))
				.setDuration((parseFloat(endTimeOffset)) - parseFloat(startTimeOffset))
				.output(folderName + nameOfFile + '_Cut_' + numberToCutMoisUn + '.mp4')
				.on('end', function(err) {   
					if(!err)
					{
						var nomFichierCouper = nameOfFile + '_Cut_' + numberToCutMoisUn;

						var sql2 = 'INSERT INTO video_cut (id_video, nom, mot, duree) VALUES (' + idVideo + ',"' + nomFichierCouper + '","' + sentenceTranscrib.toUpperCase() + '",' + duration + ')';
						con.query(sql2, function (err, result) {
							return 'conversion Done';
						})	
					}                 
				})
				.on('error', async function(err){
					console.log('error: video cut : ' + numberToCutMoisUn);
					return 'Error';
				}).run();

			}
			else
			{

			}
		}


		function sec2time(timeInSeconds) {
			var pad = function(num, size) { return ('000' + num).slice(size * -1); },
			time = parseFloat(timeInSeconds).toFixed(3),
			hours = Math.floor(time / 60 / 60),
			minutes = Math.floor(time / 60) % 60,
			seconds = Math.floor(time - minutes * 60),
			milliseconds = time.slice(-3);

			return pad(hours, 2) + ':' + pad(minutes, 2) + ':' + pad(seconds, 2) + '.' + pad(milliseconds, 3);
		}

	})

}