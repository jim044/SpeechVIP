"use strict"

module.exports = function(app) {
	app.get('/getPersonne', function(req, res) {
	})
}

module.exports = function(app) {
	app.get('/getLangue', function(req, res) {
	})
}

module.exports = function(app) {
	app.post('/addPeople', function(req, res) {

		const mysql = require('mysql');
		var nomPrenomPersonne = req.body.nomPrenom;

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
					
				}
			});
		});
	})
}

module.exports = function(app) {
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
					
				}
			});
		});
	})
}

// module.exports = function(app) {
// 	app.get('/getLangue', function(req, res) {
// 	}
// }