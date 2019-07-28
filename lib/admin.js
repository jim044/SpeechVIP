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
		const fileUpload = require('express-fileupload');
		
		const file = req.file
		res.send(file);
		
		console.log(req.file)


	})
}