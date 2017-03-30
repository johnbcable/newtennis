var debugthis = true;

function displayCoordinatesForPostcode () {

	var searchpostcode = $('#searchpostcode').val();
	var jsonstring = new String("");
	var url = "http://maps.googleapis.com/maps/api/geocode/json?address="+searchpostcode+"&amp;sensor=false";


	// console.log("Inside displayDirectorySearchResults, url = ["+url+"]");

	// var eventsfound = false;
	$.getJSON(url,function(data){

		var mygeometry = JSON.parse(JSON.stringify(data.results[0].geometry.location));

		// Now, get latitude and longitude out of googledata into globals

		if (debugthis) {
			console.log("URL used was: "+url);
			console.log("mygeometry is "+JSON.stringify(mygeometry));
		}

		var curLatitude = new Number(mygeometry["lat"]);
		var curLongitude = new Number(mygeometry["lng"]);

		// Create an object to return to the caller
		var myCoords = {
			postcode: searchpostcode,
			latitude: curLatitude,
			longitude: curLongitude
		};

		// jsonstring = JSON.stringify(myCoords);

		// jsonstring = new String("{allCoords:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		// var coorddata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		var resultHTML = new String("<p>Postcode: "+myCoords.postcode+"</p>");
		resultHTML += '<br /><p>latitude="'+myCoords.latitude+'", longitude="'+myCoords.longitude+'"';

		// clear out existing content
		$('#coordinateresults').html('');

		$("#coordinateresults").append(resultHTML); 

		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}    // end of displayDirectorySearchResult

$(document).ready(function() {

	// Register onclick handlers for the searchbutton

	$( "#getcoords" ).click(function() {

	  	// alert( "Handler for runsearch.click() called." );
	  	
	  	displayCoordinatesForPostcode();

	  	// alert("Should be search results of some sort below");
	});	

})  // end of document.ready

