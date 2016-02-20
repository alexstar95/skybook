var request = require('request');
var flightsArray = [];

module.exports.FlightsArray = flightsArray;
module.exports.carriers = undefined;
module.exports.places   = undefined;

var getPlaceNameFromID = function(id,source){
	
	for (var i=0; i < source.length; i++){
		if(source[i].PlaceId == id)
			return source[i].CityName;
	}
};

var getCarrierNameFromID = function(id, source){
	
	for (var i=0; i < source.length; i++){
		if(source[i].CarrierId == id)
			return source[i].Name;
	}
};

var fromQuotesToFlightData = function(quotes){
	
	for (var i=0; i < quotes.length; i++){
		
		var auxFlight={},
			auxFlight1={};

		auxFlight.name = quotes[i].OutboundLeg.CarrierIds;
		auxFlight.source = quotes[i].OutboundLeg.OriginId;
		auxFlight.destination = quotes[i].OutboundLeg.DestinationId;
		auxFlight.departureDate = quotes[i].OutboundLeg.DepartureDate;
		auxFlight.minPrice = quotes[i].MinPrice;

		auxFlight1.name = quotes[i].InboundLeg.CarrierIds;
		auxFlight1.source = quotes[i].InboundLeg.OriginId;
		auxFlight1.destination = quotes[i].InboundLeg.DestinationId;
		auxFlight1.departureDate = quotes[i].InboundLeg.DepartureDate;
		auxFlight1.minPrice = quotes[i].MinPrice;

		flightsArray.push(auxFlight);
		flightsArray.push(auxFlight1);
	}

	return flightsArray;
};

var modelateQuotes = function modelateQuotes(quotes){

	for (var i=0; i < quotes.length; i++){
		
		quotes[i].OutboundLeg.DestinationId = getPlaceNameFromID(quotes[i].OutboundLeg.DestinationId, places);
		quotes[i].InboundLeg.DestinationId = getPlaceNameFromID(quotes[i].InboundLeg.DestinationId, places);

		quotes[i].OutboundLeg.OriginId = getPlaceNameFromID(quotes[i].OutboundLeg.OriginId, places);
		quotes[i].InboundLeg.OriginId = getPlaceNameFromID(quotes[i].InboundLeg.OriginId, places);

		quotes[i].OutboundLeg.CarrierIds = getCarrierNameFromID(quotes[i].OutboundLeg.CarrierIds, carriers);
		quotes[i].InboundLeg.CarrierIds = getCarrierNameFromID(quotes[i].InboundLeg.CarrierIds, carriers);
	}

	return quotes;
};

var generateProperties = function generateProperties(url){
	
	var options = {
		
		uri: url,
		headers: {
			'Content-Type' : 'application/json'
		},
		method: "GET",
		timeout: 10000,
		followRedirect: true,
		maxRedirects: 10
	}

	return options;
}

exports.requestRoutes = function(callback) {

	var url = "http://partners.api.skyscanner.net/apiservices/browseroutes/v1.0/GB/GBP/en-GB/BUCH/UK/anytime/anytime?apiKey=ah493775065522640948616442382335";
	var options = generateProperties(url);

	request(options,function(error, response, body) {
		
		var validRoutesArray = [];
		
		response = response.body;
		response = JSON.parse(response);

		routes = response.Routes;
		quotes = response.Quotes;

		places   = response.Places;
		carriers = response.Carriers;

		for (var i=0; i < routes.length; i++){
			if(routes[i].QuoteIds) validRoutesArray.push(routes[i]);
		}

		for (var i=0; i < quotes.length; i++)
			if(quotes[i].OutboundLeg.CarrierIds.length == 0 || quotes[i].InboundLeg.CarrierIds.length == 0){
				quotes.splice(i,1);
				validRoutesArray.splice(i,1);
			}

		//From id's to  names
		quotes = modelateQuotes(quotes);

		//Building the array of simulated flights
		module.exports.FlightsArray = fromQuotesToFlightData(quotes);
		
		//a callback with the exported var, not really sure how this works for now
		callback(module.exports.FlightsArray);
	});
};

exports.getPlaces = function (callback) {

	var url = "http://partners.api.skyscanner.net/apiservices/browseroutes/v1.0/GB/GBP/en-GB/BUCH/UK/anytime/anytime?apiKey=ah493775065522640948616442382335";
	var options = generateProperties(url);

	request(options, function(error, response, body) {

		response = response.body;
		response = JSON.parse(response);

		var placess   = response.Places;
		module.exports.places = placess;

		callback(module.exports.places);
	});
};

exports.getCarriers = function (callback) {

	var url = "http://partners.api.skyscanner.net/apiservices/browseroutes/v1.0/GB/GBP/en-GB/BUCH/UK/anytime/anytime?apiKey=ah493775065522640948616442382335";
	var options = generateProperties(url);

	request(options,function(error, response, body) {

		response = response.body;
		response = JSON.parse(response);

		var carrierss   = response.Carriers;
		module.exports.carriers = carrierss;

		callback(module.exports.carriers);
	});
};

