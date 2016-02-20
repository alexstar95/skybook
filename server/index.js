var express     = require('express');
var app 		= express();
var path   	    = require('path');
var bodyParser  = require('body-parser');

app.use(express.static(__dirname + '/../frontend'));
app.use(express.static(__dirname + '/../frontend'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.listen(3000, function () {

	console.log("server runing ...");
});

app.get('/auth', function (req, res) {

	res.sendFile(path.join(__dirname, '/../frontend/templates/index.html'));
});

app.get('/myhome', function (req, res) {
	res.sendFile(path.join(__dirname, ))
});
