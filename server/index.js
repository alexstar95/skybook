//some example module creation to systemize the code
var moduleexample = require("./lib/module-example.js");
var express = require('express');
var skyAPI = require("./lib/skyAPI");
var mysql = require('mysql');
var app = express();

var connection = mysql.createConnection({
		host     : "localhost",
		user     : "root",
		password : "mamaligos",
		database : "skybook"
});

connection.connect(function(err){
	if(!err) {
	    console.log("Database is connected ... nn");    
	} else {
	    console.log("Error connecting database ... nn");    
	}
});

app.get('/', function (req, res) {
	skyAPI.requestRoutes(function (){
		res.send(skyAPI.FlightsArray);
	});
  	
});

app.listen(3000, function () {
	console.log('Example app listening on port 3000!');

	connection.query("select * from user",function(err,rows){
	   	rows = rows[0];
	    if(!err) {
	        console.log(rows.name);
	    }
	});
});