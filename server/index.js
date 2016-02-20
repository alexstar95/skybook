//some example module creation to systemize the code
var moduleexample = require("./lib/module-example.js");
var express = require('express');
var app = express();


app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.listen(3000, function () {
  	console.log('Example app listening on port 3000!');
	//login to that database
	var mysql      = require('mysql');
	var connection = mysql.createConnection({
  		host     : "localhost",
  		user     : "root",
  		password : "barlad",
  		database : "skybook"
	});
	connection.connect();

	console.log("dadasdas");

  //This is just an example of how modules work 
  //IGNORE !!!
  var text = moduleexample.sayHello();
  console.log(text);
});