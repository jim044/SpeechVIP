"use strict"

module.exports = function(app) {
	app.post('/mergevideo', function(req, res) {
		const fs = require('fs');
		var textVideo = req.body.textVideo;
		var split_textVideo = textVideo.split(" ");
		console.log("textVideo " + textVideo)
		var fluent_ffmpeg = require("fluent-ffmpeg");
		var folderMerge = "/home/jim044/Documents/Projets/SpeechVIP/video/video_cut_word";
		var mergedVideo = fluent_ffmpeg();

		
		
		const mysql = require('mysql');
		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		// mergeLesVideos();
		var videoNames = [];
		 var split_Video_Function = function()
		 {
			
			 return new Promise(function(resolve, Reject)
			 {

				con.connect(async function(err) {

					var i;
					for (i = 0; i < split_textVideo.length; i++) { 
						console.log('SELECT * FROM video_cut WHERE mot ="' + split_textVideo[i] + '"');
						await con.query('SELECT * FROM video_cut WHERE mot="' + split_textVideo[i] + '"', async function (err, resultat, fields) {
							console.log(resultat.length)
							if(resultat.length != 0)
							{

								videoNames.push(folderMerge + '/' + resultat[0].nom + '.mp4'); 
								console.log("test")
								resolve("Finish")
							}
						});

					}
					console.log(videoNames)


				});
		 	})
		 }
		

		


		
		async function mergeLesVideos()
		{
			split_Video_Function().then(function(leResultat) {
					console.log(leResultat)
					return leResultat;
				});
			// var lesvaleurs = 0;
			// await fs.readdir(folderMerge, function(err, items) {
			// console.log(items.length);
			// for (var i=0; i<3; i++) {
			// 	videoNames.push(folderMerge + '/' + items[i]); 
			// 	lesvaleurs = i;   
			// }
			// 	videoNames.forEach(function(videoName){
			// 	    mergedVideo = mergedVideo.addInput(videoName);
			// 	});

			// 	mergedVideo.mergeToFile(folderMerge + '/mergeVideo.mp4', './tmp/')
			// 	.on('error', function(err) {
			// 	    console.log('Error ' + err.message);
			// 	})
			// 	.on('end', function() {
			// 	    console.log('Finished!');
			// 	});

			// 	res.end('Bien joue');
			// });	
		}

	});
}