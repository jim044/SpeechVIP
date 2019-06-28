"use strict"

module.exports = function(app) {
	app.get('/getVideo', function(req, res) {
		const fs = require('fs');

	var pathVideoCreate = "/home/jim044/Documents/Projets/SpeechVIP/video/Create_Video";
	var pathVideoCreateShort = "../video/Create_Video";
	var listVideoCreate = [];
	

	fs.readdir(pathVideoCreate,  function(err, items) {
		for (var i=0; i<items.length; i++) {
				//console.log(items[i]);

				var arrayVideo = ''
				var data = {
				    lienVideo: pathVideoCreateShort + '/' + items[i],
				};

				listVideoCreate.push(data);

				//listVideoCreate.push(items[i]);
				//console.log(listVideoCreate);
				//res.setHeader('content-type', 'application/json');
            	 // fetch rows
			}
			res.json(listVideoCreate);
			
		});

	})
}