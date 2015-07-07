//
//		googlemaps.js
//
//		Using Handlebars and plugin code 
//
var debugthis = true;   // set to false for production

var curLatitude = 0;
var curLongitude = 0;

// Utility functions

// Register Handlebars helpers

function displayMapUsingPostcode(postcode,domid) {

  	var map;
	var address = postcode || "B92 0DQ";
  	var domnode = domid || 'map-canvas';
	var mypostcode;
  	var lat;
  	var lng;
  	var mycoords = new Object();

	// Re-initialise globals
	curLatitude = 0;
	curLongitude = 0;

	mypostcode = address.replace(' ','');

	var url = "http://maps.googleapis.com/maps/api/geocode/json?address="+mypostcode+"&amp;sensor=false";

	$.getJSON(url,function(data){

		// console.log(url);

		// var jsonstring = JSON.stringify(data);
		var mygeometry = JSON.parse(JSON.stringify(data.results[0].geometry.location));

		// jsonstring = new String("{allGoogleData:"+jsonstring+"}");

		// var googledata = eval("(" + jsonstring + ")");

		// Now, get latitude and longitude out of googledata into globals

		if (debugthis) {
			console.log("URL used was: "+url);
			console.log("mygeometry is "+mygeometry);
		}

		curLatitude = new Number(mygeometry["lat"]);
		curLongitude = new Number(mygeometry["lng"]);

		if (debugthis) {
			console.log("Retrieved latitude and longitude for "+postcode+" is "+curLatitude+","+curLongitude);
			console.log("Passed-in domid : "+domid);
			console.log("Passed-in postcode : "+postcode);
			console.log("Resolved latitude : "+curLatitude);
			console.log("Resolved longitude : "+curLongitude);
			console.log("Resolved domid : "+domnode);
			console.log("Resolved postcode : "+mypostcode);
	  	}

		var mapOptions = {
		  zoom: 16,
		  center: new google.maps.LatLng(curLatitude, curLongitude)
		};

		if (debugthis) {
			console.log("Inside displayMap - mapOptions = "+JSON.stringify(mapOptions));
			console.log("DOM node to be overwritten = "+domnode);
		}

		map = new google.maps.Map(document.getElementById(domnode),
		    mapOptions);

	});

}









