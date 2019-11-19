"use strict"

module.exports = function(app) {
	const multer  = require('multer')

	var storage = multer.diskStorage({
		destination: function (req, file, cb) {
			cb(null, './video/Attente/')
		},
		filename: function (req, file, cb) {
			cb(null, file.originalname)
		}
	})

	var upload = multer({ storage: storage })

	app.post('/uploadVideo', upload.single('videoUpload'), function(req, res) {
		console.log("En cours")
		const fileUpload = require('express-fileupload');
		const file = req.file
		res.redirect("/adminSpeechVIP")
	})

	app.post('/connexion_admin', function(req, res) {
		/*var identifiant = req.body.identifiant;
		var mot_de_passe = req.body.mot_de_passe;
*/
/*		const mysql = require('mysql');

		var con = mysql.createConnection({
			host: "localhost",
			user: "jim044",
			password: "Obiwan2715",
			database: "speechvip"
		});

		con.connect(function(err) {
			con.query('SELECT * FROM administration WHERE identifiant ="' + identifiant + '" AND mot_de_passe= MD5("' + mot_de_passe + '")', async function (err, result, fields) {
					console.log(result)
					var connection = true;*/
					res.redirect(307, "/adminSpeechVIP")
/*				});
		})*/
	})
	}