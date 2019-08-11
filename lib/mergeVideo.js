"use strict"

module.exports = function(app) {
	app.post('/mergevideo', function(req, res) {
		const fs = require('fs');
		var textVideo = req.body.textsearchSentence;
		// console.log(textVideo)

		var split_textVideo = textVideo.split(" ");
		 // console.log("textVideo " + textVideo)
		var fluent_ffmpeg = require("fluent-ffmpeg");
		var folderMerge = "/home/jim044/Documents/Projets/SpeechVIP/video/video_cut_word";
		var folderVideoCreate = "/home/jim044/Documents/Projets/SpeechVIP/video/Create_Video";
		var mergedVideo = fluent_ffmpeg();
		var videoNames = [];
		
		
		const mysql = require('mysql');
		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		var i;
		var nbVideoRecu = 0;



		const example = async () => {
			const nums = [1,2,3];
			for (const item of split_textVideo) {
				const result = await searchVideo(item);
				if(result != "Nothing")
				{
					console.log(item)
					console.log(result)
					videoNames.push(folderMerge + '/' + result + '.mp4'); 
				}
				
			}
			mergeLesVideos();
		}

		const searchVideo = textVideo => {
			return new Promise((resolve, reject) => {
				setTimeout(() => {

					con.connect(function(err) {
						con.query('SELECT * FROM video_cut WHERE mot="' + textVideo + '" ORDER BY RAND() LIMIT 1', async function (err, resultat, fields) {
							if(resultat.length != 0)
							{
								resolve (resultat[0].nom);
							}
							else
							{
								resolve("Nothing")
							}
						});

					});

				}, 500);
			});
		}

		example().then(() => {
			console.log('done');
		})

		function mergeLesVideos()
		{
			videoNames.forEach(function(videoName){
				mergedVideo = mergedVideo.addInput(videoName);
			});

			con.connect(function(err) {
				con.query('SELECT * FROM video_create WHERE nom="' + textVideo + '.mp4"', async function (err, resultat, fields) {
					if(resultat.length == 0)
					{
						mergedVideo.mergeToFile(folderVideoCreate + '/' + textVideo + '.mp4', './tmp/')
						.on('error', function(err) {
							console.log('Error ' + err.message);
						})
						.on('end', function() {
							console.log('Finished!');
							
								var sql = 'INSERT INTO video_create (nom) VALUES ("' + textVideo + '.mp4")';
								 con.query(sql, function (err, result) {
									res.redirect("/")
									// res.sendFile("/home/jim044/Documents/Projets/SpeechVIP/html/accueil.html");
								 });
							
						});

						// res.end('Bien joue');
					}
				});

			});


		}

	});
}