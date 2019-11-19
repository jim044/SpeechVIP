"use strict"

module.exports = function(app) {
	app.post('/mergevideo', function(req, res) {
		const fs = require('fs');
		var textVideo = req.body.textsearchSentence;
		// console.log(textVideo)

		var split_textVideo = textVideo.split(" ");
		 // console.log("textVideo " + textVideo)
		var fluent_ffmpeg = require("fluent-ffmpeg");
		var folderMerge = "/home/jim044/Projets/SpeechVIP/video/video_cut_word";
		var folderVideoCreate = "/home/jim044/Projets/SpeechVIP/video/Create_Video";
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
		var fonduNoir = "/home/jim044/Projets/SpeechVIP/video/Fondu/fond noir.mp4"



		const example = async () => {
			var saveItem = "";
			var resultBis = "Nothing";
			var result = "Nothing";
			// const nums = [1,2,3];
			for (const item of split_textVideo) {
				result = await searchVideo(item);
				console.log(item)
				console.log("item " + result)
				if(result == "Nothing")
				{
					if (saveItem != "")
					{
						saveItem = saveItem + " " + item;
						resultBis = await searchVideo(saveItem);
						console.log("saveItem " + saveItem); 
						console.log("saveItemResultBis " + resultBis)

					}
					else
					{
						saveItem = item;
					}
				}
				if(result != "Nothing" || resultBis != "Nothing")
				{
					if(result != "Nothing")
					{
						console.log("result1")
						videoNames.push(folderMerge + '/' + result + '.mp4'); 
						videoNames.push(fonduNoir);
						result = "Nothing"
					}
					else if(resultBis != "Nothing")
					{
						saveItem = "";
						console.log("result2")
						
						await videoNames.push(folderMerge + '/' + resultBis + '.mp4'); 
						await videoNames.push(fonduNoir);
						resultBis = "Nothing";
						

					}
					
				}
				
			}
			
			mergeLesVideos();
		}

		const searchVideo = textVideo => {
			return new Promise((resolve, reject) => {
				setTimeout(() => {

					con.connect(function(err) {
						console.log('SELECT * FROM video_cut WHERE mot collate utf8_bin ="' + textVideo.toUpperCase() + '" ORDER BY RAND() LIMIT 1')
						con.query('SELECT * FROM video_cut WHERE mot collate utf8_bin ="' + textVideo.toUpperCase() + '" ORDER BY RAND() LIMIT 1', async function (err, resultat, fields) {
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
			console.log(folderVideoCreate + '/' + textVideo.toUpperCase() + '.mp4')

			console.log("videoNames " + videoNames)
			videoNames.forEach(function(videoName){
				mergedVideo = mergedVideo.addInput(videoName);
			});

			con.connect(function(err) {
				con.query('SELECT * FROM video_create WHERE nom ="' + textVideo.toUpperCase() + '.mp4"', async function (err, resultat, fields) {
					if(resultat.length == 0)
					{
						mergedVideo.mergeToFile(folderVideoCreate + '/' + textVideo.toUpperCase() + '.mp4', './tmp/')
						.on('error', function(err) {
							console.log('Error ' + err.message);
						})
						.on('end', function() {
							console.log('Finished!');
							
								var sql = 'INSERT INTO video_create (nom) VALUES ("' + textVideo.toUpperCase() + '.mp4")';
								 con.query(sql, function (err, result) {
									res.redirect("/")
									// res.sendFile("/home/jim044/Projets/SpeechVIP/html/accueil.html");
								 });
							
						})

						// res.end('Bien joue');
					}
				});

			});


		}

	});
}