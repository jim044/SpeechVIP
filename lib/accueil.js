"use strict"

module.exports = function(app) {
	app.get('/accueil', function(req, res) {

	// Imports the Google Cloud client library
	const speech = require('@google-cloud/speech');
	const fs = require('fs');

	// Creates a client
	const client = new speech.SpeechClient();

	// The name of the audio file to transcribe
	const fileName = "/home/jim044/Documents/Projets/MadeTheVIPTalk/audio/Donald Trump.wav";

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
	  languageCode: 'fr-FR',
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
	      });
	    });
	  })
	  .catch(err => {
	    console.error('ERROR:', err);
	  });

	 })
}