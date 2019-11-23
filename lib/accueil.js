"use strict"

module.exports = function(app) {
	app.get('/getVideo', function(req, res) {
		const fs = require('fs');

		var pathVideoCreate = "/home/jim044/Projets/SpeechVIP/video/Create_Video";
		var pathVideoCreateShort = "../video/Create_Video";
		var listVideoCreate = [];


		fs.readdir(pathVideoCreate,  function(err, items) {
			if (items != undefined)
			{
				for (var i=0; i<items.length; i++) {
				/*console.log(pathVideoCreateShort + "/" + items[i]);*/

				var arrayVideo = ''
				var data = {
					lienVideo: pathVideoCreateShort + "/" + items[i],
				};

				listVideoCreate.push(data);
            	}
            }
            res.json(listVideoCreate);

        });

	})
}