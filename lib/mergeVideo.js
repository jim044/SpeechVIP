"use strict"

module.exports = function(app) {
	app.get('/mergevideo', function(req, res) {
		const fs = require('fs');
		var fluent_ffmpeg = require("fluent-ffmpeg");
		var folderMerge = "/home/jim044/Documents/Projets/SpeechTalk/SpeechVIP/video/video_cut_word";
		var mergedVideo = fluent_ffmpeg();

		var videoNames = [];
		mergeLesVideos();
		async function mergeLesVideos()
		{
			var lesvaleurs = 0;
			await fs.readdir(folderMerge, function(err, items) {
			console.log(items.length);
			for (var i=0; i<10; i++) {
				videoNames.push(folderMerge + '/' + items[i]); 
				lesvaleurs = i;   
			}
				videoNames.forEach(function(videoName){
				    mergedVideo = mergedVideo.addInput(videoName);
				});

				mergedVideo.mergeToFile(folderMerge + '/mergeVideo.mp4', './tmp/')
				.on('error', function(err) {
				    console.log('Error ' + err.message);
				})
				.on('end', function() {
				    console.log('Finished!');
				});

				res.end('Bien joue');
			});	
		}

	});
}