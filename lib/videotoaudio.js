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
		var arrayVideoPath = [];
		var numberCut = 0;


		const { getAudioDurationInSeconds } = require('get-audio-duration')


		const folderNameReceive = req.body.folderAudio
		//console.log(folderNameReceive);
	// Imports the Google Cloud client library
	const speech = require('@google-cloud/speech');
	
	// Creates a client
	const client = new speech.SpeechClient();


	var con = mysql.createConnection({
		host: "localhost",
		user: "jim044",
		password: "Obiwan2715",
		database: "speechvip"
	});

	var pathvideo = "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video";
	var pathvideoAttente = "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video/Attente";
	var pathaudio = "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio";

	fs.readdir(pathvideoAttente, async function(err, items) {
		for (var i=0; i<items.length; i++) {
			var filevideo = '';
			var fileaudio = '';
			

			filevideo = items[i].replace(/ /gi, "_");
			//await rename(items[i], filevideo)

			console.log(items.length)
			console.log(filevideo)
			 // if (arrayVideoPath.indexOf(items[i])!=1)
			 // {
			 	//console.log(items[i]);
			 	await rename(items[i], filevideo).then(function(leResultat) {
			 		return leResultat;
			 	});
			 // } 
			 // arrayVideoPath.push(items[i]);
		}
		res.end('Bien joue');
	});

	var rename = function(filevideoToRename, filevideo, numberCutRename)
	{
		return new Promise(async function(resolutionRename, rejetRemane)
		{


			var dureevideo = '';

			getVideoDurationInSeconds(pathvideoAttente + '/' + filevideo).then((duration) => {
				//console.log(duration)
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
									// var sql = "INSERT INTO video (nom, duree) VALUES (" + "'" + filevideo + "'," + "'" + dureevideo + "')";
									// con.query(sql, function (err, result) {
										if (err) console.log(err);
										//console.log("1 record inserted");
										extractAudioFromVideo(filevideo);

										 //extractAudioFromVideo(filevideo);//.then(function(resultatExtractAudio) {
										 	resolutionRename('Success!');

										// 	console.log('Success');
										// 	return resultatExtractAudio;
										// });

										
									//});
									
								}
							});
						});
					}
				});
			})
			return true;

		})
	}

	function extractAudioFromVideo(filevideo)
	{
		 // return new Promise(async function(resolutionExtractAudio, rejetExtractAudio)
		 // {
		
		
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
								  //console.log(`stdout: ${data}`);
								});

							 	convert.stderr.on('data', (data) => {
								  //console.log(`stderr: ${data}`);
								});

							 	convert.on('close', (code) => {
							 		//console.log(`child process exited with code ${code}`);
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
							 			//console.log(audiofile192BitrateMonoCut)
							 			
							 			let segment = spawn('ffmpeg', ['-i', audiofile192BitrateMono, '-f', 'segment', '-segment_time', 10, '-c', 'copy', '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/audio_cut_ten_senconds/' + audiofile192BitrateMonoCut + '_%03d.wav'])
							 			segment.stdout.on('data', (data) => {
							 				
							 				//console.log(`stdout: ${data}`);
							 				
							 			});

							 			segment.stderr.on('data', (data) => {
							 				
							 				//console.log(`stderr: ${data}`);
							 				

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
							 							// var sql = "INSERT INTO audio (nom, duree) VALUES (" + "'" + audiofile192BitrateMonoCut + "'," + "'" + audioDuration + "')";
							 							// con.query(sql, async function (err, result) {
							 								fs.unlinkSync(fileWav);
							 								fs.unlinkSync(audiofile192Bitrate);
							 								var numberCutAudio = audioDuration / 10;
							 								await cutAudioByWord(audiofile192BitrateMonoCut, Math.ceil(numberCutAudio)).then(function(leResultat) {
							 									fs.unlinkSync(audiofile192BitrateMonoCut);
							 									resolutionExtractAudio('Success!');
							 									return leResultat;
							 								})
							 								return true;
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
			    // console.log(JSON.stringify(progress));
			    //console.log('Processing: ' + progress.targetSize + ' KB converted');
			})
				.on('end', () => {
					//console.log('Processing finished !');
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
			//numberCut = 0;

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
				
				var nomFichierASupprimer = '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/audio_cut_ten_senconds/' + nomFichierWithNumber;
				
				console.log('numberCut : ' + numberCut)

				await recognitionAudio(nomFichierWithNumber, i, numberOfCut).then(function(leResultat) {
					fs.unlinkSync(nomFichierASupprimer);
					//console.log('Nom fichier a supprimer : ' + nomFichierWithNumber)
					//numberCut = leResultat;
					return leResultat;
				});


				//console.log('Louper le Timeout');
			}
			//console.log('Recognition Word Done');
			resolution('Recognition Word Done');
		})
	}
	

	var recognitionAudio = function(nomFichierWithNumber, i, nombreElementACouper)
	{
		return new Promise(async function(resolveAgain, RejectAgain)
		{
			// The name of the audio file to transcribe
			var fileName = '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/audio_cut_ten_senconds/' + nomFichierWithNumber;
			
			var getFileNameSearch = fileName.search('_192bitrate');
			var getFilePathCut = fileName.substring(0, getFileNameSearch);
			var nameOfFile = path.basename(getFilePathCut);
			//console.log(nameOfFile);
		// Reads a local audio file and converts it to base64
		var file = fs.readFileSync(fileName);
		var audioBytes = file.toString('base64');

		// The audio file's encoding, sample rate in hertz, and BCP-47 language code
		var audio = {
			content: audioBytes,
		};
		var config = {
			enableWordTimeOffsets: true,
			encoding: 'LINEAR16',
			sampleRateHertz: 44100,
			languageCode: 'en-US',
		};
		var request = {
			audio: audio,
			config: config,
		};

		await client
		.longRunningRecognize(request)
		.then(data => {
			var operation = data[0];
		    // Get a Promise representation of the final result of the job
		    return operation.promise();
		})
		.then(data => {
			var response = data[0];

			response.results.forEach(async (result) => {
				//console.log(`Transcription: ${result.alternatives[0].transcript}`);
				//console.log(result.alternatives[0].words.length);
				for (var j = 0;j<result.alternatives[0].words.length;j++)
				{
					var wordInfo = result.alternatives[0].words[j];
					//console.log('wordInfo : ' + wordInfo.text);
				//result.alternatives[0].words.forEach(async (wordInfo) => {
		        // NOTE: If you have a time offset exceeding 2^32 seconds, use the
		        // wordInfo.{x}Time.seconds.high to calculate seconds.
		        var startSecs =
		        `${wordInfo.startTime.seconds}` +
		        `.` +
		        wordInfo.startTime.nanos / 100000000;
		        var endSecs =
		        `${wordInfo.endTime.seconds}` +
		        `.` +
		        wordInfo.endTime.nanos / 100000000;

		        var fileNameVideo = '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video/Attente/' + nameOfFile + '.mp4';
		        var folderName = '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video/video_cut_word/'

		        var debutDuDecoupage = (i * 10) + parseFloat(startSecs)
		        var finDuDecoupage = (i * 10) + parseFloat(endSecs)
		        //console.log('startSecs : ' + startSecs)
		        //console.log('Debut decoupage : ' + debutDuDecoupage)
		        //console.log('i ' + i)
		        //console.log('_NUmber Cut_One' + numberCut);

		        numberCut += 1;
		        console.log('_NUmber Cut_One' + numberCut);
		        await cutVideo(wordInfo.word, nameOfFile, folderName, fileNameVideo, debutDuDecoupage, finDuDecoupage, numberCut).then(function(leResultat) {
		        	
		        	
		        	// console.log('is : ' + i)
		        	//console.log('nombreElementACouper : ' + nombreElementACouper);
		        	if (i == nombreElementACouper-1)
		        	{

		        		fs.rename(fileNameVideo, '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video/Archives/' + nameOfFile + '.mp4', function (err) {
		        		})
		        	}
		        	
		        	
		        	return numberCut;
		        })
		        
		    };
		    resolveAgain('Cut ok');
		    
		    // console.log('is2 : ' + i)
		    
		});
			
		})
		.catch(err => {
			console.error('ERROR:', err);
		});
	})
	}


	var cutVideo = function(wordTranscrib, nameOfFile, folderName, videoPath, startTime, endTime, numberToCut)
	{
		return new Promise(async function(resolve, reject)
		{

			var numberToCutMoisUn = numberToCut - 1;
			//console.log('_NUmber CUt _Two' + numberToCutMoisUn);
			//var ffmpeg = require('fluent-ffmpeg');
			console.log('World transcrib : ' + wordTranscrib);
			console.log(videoPath);
			console.log(numberToCutMoisUn);

			await fluentffmpeg(videoPath)
			.setStartTime(sec2time(startTime))
			.setDuration(parseFloat(endTime) - parseFloat(startTime))
			.output(folderName + nameOfFile + '_Cut_' + numberToCutMoisUn + '.mp4')

			.on('end', function(err) {   
				if(!err)
				{
					var nomFichierCouper = nameOfFile + '_Cut_' + numberToCutMoisUn;
					var duration = parseFloat(endTime) - parseFloat(startTime);
					var sql2 = 'INSERT INTO video_cut (nom, mot, duree) VALUES ("' + nomFichierCouper + '","' + wordTranscrib + '",' + duration + ')';
					//console.log(sql2);
					con.query(sql2, function (err, result) {
						//console.log(err);
						//console.log('conversion Done : ' + numberToCutMoisUn);
						resolve('conversion Done');
						return 'conversion Done';
					})
				}                 

			})
			.on('error', async function(err){
				console.log('error: video cut : ' + numberToCutMoisUn);

				 // await cutVideo(nameOfFile, folderName, videoPath, startTime, endTime, numberToCut).then(function(leResultat) {
		   //       })
		}).run();
		})
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