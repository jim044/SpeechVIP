"use strict"

// module.exports = function(app) {
// 	app.get('/getPersonne', function(req, res) {
// 	})
// }

// module.exports = function(app) {
// 	app.get('/getLangue', function(req, res) {
// 	})
// }

// module.exports = function(app) {
// 	app.post('/ajouterPeople', function(req, res) {

// 		const mysql = require('mysql');
// 		var nomPrenomPersonne = req.body.nomPrenom;

// 		var con = mysql.createConnection({
// 			host: "localhost",
// 			user: "jim044",
// 			password: "Obiwan2715",
// 			database: "speechvip"
// 		});


// 		con.connect(function(err) {
// 			con.query('SELECT * FROM personne WHERE PrenomNom="' + nomPrenomPersonne + '"', async function (err, result, fields) {
// 				if(result.length == 0)
// 				{
// 					if (err) console.log(err);
// 					var sql = 'INSERT INTO personne (PrenomNom) VALUES (' + '"' + nomPrenomPersonne + '")';
// 					con.query(sql, function (err, result) {
// 						if (err) console.log(err);
// 						});
					
// 				}
// 			});
// 		});
// 	})
// }


// module.exports = function(app) {
// 	app.post('/ajouterPeople', function(req, res) {

// 		const mysql = require('mysql');
// 		var language = req.body.nomPrenom;

// 		console.log(language);
// 		var con = mysql.createConnection({
// 			host: "localhost",
// 			user: "jim044",
// 			password: "Obiwan2715",
// 			database: "speechvip"
// 		});


// 		con.connect(function(err) {
// 			con.query('SELECT * FROM personne WHERE PrenomNom="' + nomPrenomPersonne + '"', async function (err, result, fields) {
// 				if(result.length == 0)
// 				{
// 					if (err) console.log(err);
// 					var sql = 'INSERT INTO personne (PrenomNom) VALUES (' + '"' + nomPrenomPersonne + '")';
// 					con.query(sql, function (err, result) {
// 						if (err) console.log(err);
// 						});
					
// 				}
// 			});
// 		});
// 	})
// }

module.exports = function(app) {

	app.post('/getPersonne', function(req, res) {

		const mysql = require('mysql');

		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		con.connect(function(err) {
			con.query('SELECT * FROM personne', async function (err, result, fields) {
				
					//console.log(result)
					res.send(result)
				
			});
		});
	})

	app.post('/getLanguage', function(req, res) {

		const mysql = require('mysql');

		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		con.connect(function(err) {
			con.query('SELECT * FROM langue', async function (err, result, fields) {
				
					//console.log(result)
					res.send(result)
				
			});
		});
	})

	app.post('/addPeople', function(req, res) {

		const mysql = require('mysql');
		var nomPrenomPersonne = req.body.nomPrenom;

		console.log("nomPrenomPersonne " + nomPrenomPersonne);
		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});


		con.connect(function(err) {
			con.query('SELECT * FROM personne WHERE PrenomNom="' + nomPrenomPersonne + '"', async function (err, result, fields) {
				if(result.length == 0)
				{
					if (err) console.log(err);
					var sql = 'INSERT INTO personne (PrenomNom) VALUES (' + '"' + nomPrenomPersonne + '")';
					con.query(sql, function (err, result) {
						if (err) console.log(err);
						});
					res.send("Finish")
					
				}
			});
		});
	})

	app.post('/addLanguage', function(req, res) {

		const mysql = require('mysql');
		var language = req.body.language;

		console.log(language);
		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});


		con.connect(function(err) {
			con.query('SELECT * FROM langue WHERE language="' + language + '"', async function (err, result, fields) {
				if(result.length == 0)
				{
					if (err) console.log(err);
					var sql = 'INSERT INTO langue (language) VALUES (' + '"' + language + '")';
					con.query(sql, function (err, result) {
						if (err) console.log(err);
						});
					res.send("Finish")
					
				}
			});
		});
	})

	app.post('/convertVideo', function(req, res) {


		var language = req.body.language;
		var personne = req.body.personne;
		var video = req.body.video;

		var filename = video.replace(/^.*[\\\/]/, '')

		console.log(filename)
		res.redirect('/videotoaudio?filename=' + filename + '&language=' + language + '&personne=' + personne);
		//res.send("Finish")
	})


	app.post('/getLinkVideo', function(req, res) {
		const fs = require('fs');

		var arrayLinkVideo = [];
		var pathvideoAttente = "/home/jim044/Documents/Projets/SpeechVIP/video/Attente";
		fs.readdir(pathvideoAttente,  function(err, items) {
	 	for (var i=0; i<items.length; i++) {
	 			console.log(items[i]);
	 			arrayLinkVideo.push(items[i])
	 		}
	 		res.send(arrayLinkVideo)
	 	})
		
		//res.send("Finish")
	})




}

// module.exports = function(app) {
// 	app.get('/getLangue', function(req, res) {
// 	}
// }