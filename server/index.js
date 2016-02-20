//some example module creation to systemize the code
var moduleexample = require("./lib/module-example.js");
var express = require('express');
var skyAPI = require("./lib/skyAPI");
var mysql = require('mysql');
var app = express();

var connection = mysql.createConnection({
		host     : "localhost",
		user     : "root",
		password : "barlad",
		database : "skybook"
});

connection.connect(function (err){
	
  if(!err) {
	    console.log("Database is connected ... nn");    
	} else {
	    console.log("Error connecting database ... nn");    
	}
});

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

app.listen(3000, function () {

	console.log('Example app listening on port 3000!');

	connection.query("select * from users",function (err,rows){
	   	rows = rows[0];
	    if(!err) {
	        console.log(rows);
	    }
	});
});