"use strict"

module.exports = function(app) {
	app.get('/getVideo', function(req, res) {
		const fs = require('fs');

	var pathVideoCreate = "/home/jim044/Documents/Projets/SpeechVIP/video/Create_Video";
	var listVideoCreate = {};
	var key = 'listVideos';
	listVideoCreate[key] = [];





	fs.readdir(pathVideoCreate,  function(err, items) {
		for (var i=0; i<items.length; i++) {
				//console.log(items[i]);

				var data = {
				    lienVideo: pathVideoCreate + '/' + items[i],
				};

				listVideoCreate[key].push(data);

				//listVideoCreate.push(items[i]);
				console.log(listVideoCreate);
				res.setHeader('content-type', 'application/json');
            	res.json(listVideoCreate); // fetch rows
			}
			
		});

	})
}