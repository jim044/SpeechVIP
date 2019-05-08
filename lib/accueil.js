"use strict"

module.exports = function(app) {
	app.get('/accueil', function(req, res) {

	// Imports the Google Cloud client library
	const speech = require('@google-cloud/speech');
	const fs = require('fs');
	var ffmpeg = require('ffmpeg');
	var path = require("path");
	var numberCut = 0;

	// Creates a client
	const client = new speech.SpeechClient();

	// The name of the audio file to transcribe
	const fileName = "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/audio/audio_cut_ten_senconds/Immigration,_Venezuela,_Corée_du_Nord___le_résumé_du_discours_de_Trump_192bitrate_mono_output000.wav";
	var getFileNameSearch = fileName.search('_192bitrate');
	var getFilePathCut = fileName.substring(0, getFileNameSearch);
	var nameOfFile = path.basename(getFilePathCut);
	console.log(nameOfFile);
	// Reads a local audio file and converts it to base64
	const file = fs.readFileSync(fileName);
	const audioBytes = file.toString('base64');

	// The audio file's encoding, sample rate in hertz, and BCP-47 language code
	const audio = {
	  content: audioBytes,
	};
	const config = {
	  enableWordTimeOffsets: true,
	  encoding: 'LINEAR16',
	  sampleRateHertz: 44100,
	  languageCode: 'en-US',
	};
	const request = {
	  audio: audio,
	  config: config,
	};

 	client
	  .longRunningRecognize(request)
	  .then(data => {
	    const operation = data[0];
	    // Get a Promise representation of the final result of the job
	    return operation.promise();
	  })
	  .then(data => {
	    const response = data[0];
	    response.results.forEach(result => {
	      console.log(`Transcription: ${result.alternatives[0].transcript}`);
	      result.alternatives[0].words.forEach(wordInfo => {
	        // NOTE: If you have a time offset exceeding 2^32 seconds, use the
	        // wordInfo.{x}Time.seconds.high to calculate seconds.
	        const startSecs =
	          `${wordInfo.startTime.seconds}` +
	          `.` +
	          wordInfo.startTime.nanos / 100000000;
	        const endSecs =
	          `${wordInfo.endTime.seconds}` +
	          `.` +
	          wordInfo.endTime.nanos / 100000000;
	        console.log(`Word: ${wordInfo.word}`);
	        console.log(`\t ${startSecs} secs - ${endSecs} secs`);

	        console.log('00:00:'+ startSecs);
	        console.log(endSecs - startSecs);

			
	        var fileNameVideo = '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video/' + nameOfFile + '.mp4';
	        var folderName = '/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video/video_cut_word/'

	        cutVideo(nameOfFile, folderName, fileNameVideo, startSecs, endSecs, numberCut).then(function(leResultat) {
	        })
	        numberCut += 1;
	      });
	    });
	  })
	  .catch(err => {
	    console.error('ERROR:', err);
	  });



	  var cutVideo = function(nameOfFile, folderName, videoPath, startTime, endTime, numberToCut)
	  {
	  	return new Promise(function(resolve, reject)
	  	{
	  		console.log(folderName + nameOfFile + '_Cut_' + numberToCut + '.mp4');
		  	var ffmpeg = require('fluent-ffmpeg');

		    ffmpeg(videoPath)
		    .setStartTime('00:00:'+startTime)
		    .setDuration(endTime - startTime)
		    .output(folderName + nameOfFile + '_Cut_' + numberToCut + '.mp4')

		    .on('end', function(err) {   
		        if(!err)
		        {
		          console.log('conversion Done');
		          resolve('conversion Done');
		        }                 

		    })
		    .on('error', function(err){
		        console.log('error: ', +err);

		    }).run();
		})
	  }
	 })
}