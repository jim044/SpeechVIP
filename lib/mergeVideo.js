"use strict"

module.exports = function(app) {
	app.post('/mergevideo', function(req, res) {
		const fs = require('fs');
		var textVideo = req.body.textVideo;
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
		split_textVideo.forEach(async (textVideo) => {
			// console.log(textVideo)

			try {
			  await searchVideo(textVideo).then(function(leResultat){
			  	console.log(leResultat)
			  })
			} catch (error) {
			  console.log('That did not go well.')
			  throw error
			}

			// var myfunc = searchVideo(textVideo).then(function(leResultat) {
			// 	console.log("Finish")
			// })
			// .catch( function() {
		 //    alert( "$.get failed!" );
		 //  } );


		  // await searchVideo(textVideo).then(function(leResultat) {
		  // 	console.log(leResultat)
		  //     // if (err) {
		  //     // 	// console.log(err)
		  //     // } else {
		  //     // 	nbVideoRecu += 1; 

		  //     // 	// console.log(laVideo)
		  //     // 	console.log(nbVideoRecu)

		  //     // 	if (nbVideoRecu == split_textVideo.length)
		  //     // 	{
		  //     // 		mergeLesVideos();
		  //     // 	}
		  //     // }
		  //   });
		});

		// for (i = 0; i < split_textVideo.length; i++) {
		// 	searchVideo(i, (err, laVideo)=> {
		//       if (err) {
		//       	// console.log(err)
		//       } else {
		//       	nbVideoRecu += 1; 

		//       	// console.log(laVideo)
		//       	console.log(nbVideoRecu)

		//       	if (nbVideoRecu == split_textVideo.length)
		//       	{
		//       		mergeLesVideos();
		//       	}
		//       }
		//     });
		// }


		function searchVideo(textVideo) {
			return new Promise(function(resolve, reject) {
				// reject(Error('I was never going to resolve.'))
				con.connect(function(err) {

	 				// console.log('SELECT * FROM video_cut WHERE mot ="' + textVideo + '"');

	 				con.query('SELECT * FROM video_cut WHERE mot="' + textVideo + '" ORDER BY RAND() LIMIT 1', async function (err, resultat, fields) {
	 					// console.log(textVideo)

	 					if(resultat.length != 0)
	 					{
	 						videoNames.push(folderMerge + '/' + resultat[0].nom + '.mp4'); 
		 					resolve(textVideo);
	 					}
	 					else
	 					{
	 						reject("Nothing")
	 					}
	 					
	 				});

	 			});
			});
		}

		
		function mergeLesVideos()
		{
			console.log(videoNames)
			// var lesvaleurs = 0;
			// await fs.readdir(folderMerge, function(err, items) {
			// console.log(items.length);
			// for (var i=0; i<3; i++) {
			// 	videoNames.push(folderMerge + '/' + items[i]); 
			// 	lesvaleurs = i;   
			// }
				// videoNames.forEach(function(videoName){
				//     mergedVideo = mergedVideo.addInput(videoName);
				// });
				// console.log(mergedVideo)

				// mergedVideo.mergeToFile(folderVideoCreate + '/mergeVideo.mp4', './tmp/')
				// .on('error', function(err) {
				//     console.log('Error ' + err.message);
				// })
				// .on('end', function() {
				//     console.log('Finished!');
				// });

				// res.end('Bien joue');
			// });	
		}

	});
}