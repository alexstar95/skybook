var moduleexample = require("./lib/module-example.js");
var express = require('express');
var skyAPI = require("./lib/skyAPI");
var mysql = require('mysql');
var path  = require('path'); 
var app = express();
var bodyParser = require('body-parser');
var crypto = require('crypto');

var connection = mysql.createConnection({
		host     : "localhost",
		user     : "root",
		password : "barlad",
		database : "skybook"
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + '/../frontend'));

connection.connect(function (err){
	
  if(!err) {
	    console.log("Database is connected ... nn");    
	} else {
	    console.log("Error connecting database ... nn");    
	}
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get('/flights', function (req, res) {

  var createFlight = "INSERT INTO flights(source, dest, price, company_id, from_date, to_date) VALUES(?,?,?,?,?,?)";
  var getCompanyID = "SELECT company_id FROM company WHERE name LIKE ?";
  var companyID;

	skyAPI.requestRoutes(function (){
    
    var flights = skyAPI.FlightsArray;
    res.send(flights);

    flights.forEach(function(item) {

      connection.query(getCompanyID, [item.name], function (err, rows) {

        for(entry in rows) {
          companyID = rows[entry].company_id;

          if(companyID !== undefined) {
            
            connection.query(createFlight, 
              [item.source, item.destination, item.minPrice, companyID, item.departureDate, item.departureDate],
                function (err, rows) {});
          }
          break;
        }
      });
    });
	});
});

app.get('/places', function (req, res) {
  
  var createCountry = "INSERT INTO countries(name) VALUES(?)";
  var getCountryID  = "SELECT country_id FROM countries WHERE name LIKE ?";
  var createCity    = "INSERT INTO cities(name, country_id) VALUES(?,?)";

  var countryID;

  skyAPI.getPlaces(function () {
  
    var places = skyAPI.places;
    res.send(places);

    places.forEach(function (item) {

      connection.query(createCountry, [item.CountryName], function (err, rows) {});
    });
    
    places.forEach(function (item) {

      connection.query(getCountryID, [item.CountryName], function (err, rows) {
          
          for (var entry in rows) {
            countryID = rows[entry].country_id;
            
            if(countryID !== undefined) {
              connection.query(createCity, [item.CityName, countryID], function (err, rows) {});
            }
            break;
          }
      });
    }); 
  });
});

app.get('/carriers', function (req, res) {
  
  var inQuery = "INSERT INTO company(name) VALUES(?)";

  skyAPI.getCarriers(function () {
  
    var carriers = skyAPI.carriers;

    carriers.forEach(function (item) {
      connection.query(inQuery, [item.Name], function (err, rows) {});
    });
  });
});

app.get('/signup', function (req, res) {

  res.sendFile(path.join(__dirname, '/../frontend/signup.html'));
});

app.post('/signupHandle', function (req, res) {

  if(req.body.pass1 === req.body.pass2) {
    
    if(!userExists(req.body.username)) {
      
      var hashedPass = crypto.createHmac('sha1', req.body.pass1).digest('hex');
      var createUser = "INSERT INTO users(username, password, first_name, last_name, picture_id) VALUES(?,?,?,?, 1)";
      
      connection.query(createUser, 
        [req.body.username, hashedPass, req.body.firstName, req.body.lastName],
          
          function (err, rows) {
            if(rows !== undefined) {
              res.sendFile(path.join(__dirname, '/../frontend/userSignedUp.html'));
            }
        });
    }
  }
});

app.get('/login',function(req,res){
  res.sendFile(path.join(__dirname, '/../frontend/login.html'));
});

app.post('/login',function(req, res){
  req = req.body;
  var username = req.user;
  var password = req.password;

  connection.query("select * from users where username = ? and password = ?",[username, password], function (err,rows){
      size = rows.length;
      rows = rows[0];
      
      if(size == 1)
        res.sendFile(path.join(__dirname, 'userlogged.html'));
      else if(size > 1 ) console.log('Suspect behaviour !!!');
        else console.log('Wrong credentials');

      if(!err) {
          console.log(rows);
      }
  });
});

function userExists (username) {

  var query  = "SELECT user_id FROM users WHERE username LIKE ?";
  var userId = undefined;

  connection.query(query, [username], function (err, rows) {
    
    for (var entry in rows) {
      userId = rows[entry];
      break;
    }
  });

  return userId ? true : false;
}

app.listen(3000, function () {

	console.log('Example app listening on port 3000!');

	/*connection.query("select * from users",function (err,rows){
	   	rows = rows[0];
	    if(!err) {
	        console.log(rows);
	    }
	});*/
});