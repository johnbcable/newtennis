//
//		googlemaps.js
//
<<<<<<< HEAD
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
=======

//Global map variable
var map;

// Create a single infoWindow

var infoWindow = new google.maps.InfoWindow();

var debugthis = false;   // set to false for production

// temporary variables used when calculating coords from postcode
var curLatitude = 0;
var curLongitude = 0;

var hamptonLatitude = 52.4290181;
var hamptonLongitude = -1.7017249;

// Utility functions

//		Using Handlebars and plugin code 
//
// Register Handlebars helpers


// End of Handlebars helpers

//Add a marker to the tennis club map
function addMarker(tennisclub) {
        
    var thisLatitude;
    var thisLongitude;

	// Convert to numbers for the Google maps call
	thisLatitude = new Number(tennisclub.latitude);
	thisLongitude = new Number(tennisclub.longitude);
    
    //Create the marker (#MarkerOptions)    
    var marker = new google.maps.Marker({
          
        //Position of marker
        position: new google.maps.LatLng(thisLatitude, thisLongitude),
        
        //Map
        map: map,                
        
        //Icon details
        icon: {
            
            //URL of the image
            url: '/img/clubicon.png',
            
            //Sets the image size
            size: tennisclub.iconsize,
            
            //Sets the origin of the image (top left)
            origin: new google.maps.Point(0,0),
            
            //Sets the anchor (middle, bottom)
            anchor: new google.maps.Point(12,25),
            
            //Scales the image
            scaledSize: tennisclub.iconsize
        },
        
        //Sets the title when mouse hovers
        title: tennisclub.tennisclub,
                               
    });

    if (debugthis) {
    	console.log("Inside addMarker, marker position = "+marker.position);
    }

    return marker;
}

//Associate an infowindow with the marker
function addInfoWindow(marker) {
     
    var details = marker.tennisclub;
        
    //Content string 
    var contentString = '<h5>'+details.clubname+'</h5>'+
        '<p>'+details.address1+'<br />';

    if (details.address2) {
    	contentString += details.address2+'<br />';
    }
    if (details.address3) {
    	contentString += details.address3+'<br />';
    }
    if (details.address4) {
    	contentString += details.address4+'<br />';
    }
    if (details.town) {
    	contentString += details.town+'<br />';
    }
    if (details.county) {
    	contentString += details.county+'<br />';
    }
    if (details.postcode) {
    	contentString += details.postcode+'</p>';
    }

    contentString += '<hr />';

    if (details.telephone) {
    	contentString += '<p>Telephone: '+details.telephone+'<br />';
    }

    var maptitle = new String("Location of "+details.clubname);
    contentString += '<a class="fullwidth centered small info button" href="javascript: showLocationMap(&quot;'+details.postcode+'&quot;,&quot;'+maptitle+'&quot;)">Show Location Map</a>';

    if (debugthis) {
    	console.log("Inside addInfoWindow, contentString = "+contentString);
    }

   //Add click event listener
    google.maps.event.addListener(marker, 'click', function(e) {
        
        infoWindow.close();

        infoWindow.setContent(contentString);

        //Open the infowindow on click
        infoWindow.open(map,marker);
    });
}

// Add commas to number
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}



function displayOverviewMap() {

	// Function to display the top overview map for the Coventry League
	// Should only be called if we are not viewing on a smart phone (small)

	// Firstly, make sure that the DOM element is visible and cleared out	
	$('#map').empty().html('');
	$('#map').removeClass('noshow');

    //Set the map options
    var mapOptions = {

        //Zoom on load
        zoom: 11,

        //Map center - on Kenilworth as its eems central to most clubs
        center: new google.maps.LatLng(52.3756286,-1.7410995)
      
        //Set the map style
        // styles: shiftWorkerMapStyle 
    };

    //Get the id of the map container div
    var mapId = document.getElementById('map');

    // Clear out DOM node of previous contents
    $(mapId).empty().html();

    //Create the map
    map = new google.maps.Map(mapId,mapOptions);

    // JSON retrieval of other club data

	var url = "http://hamptontennis.org.uk/fetchJSON.asp?id=21";

	$.getJSON(url,function(tennisclubData) {

		// Loop hrough club data and plaec icons on map

	    for (var i=0; i<tennisclubData.length; i++) {

	        var tennisclub = tennisclubData[i];
/*
			if (debugthis) {
				console.log("Inside loop of tennisclubData at element "+i);
				console.log("Element "+i+" is "+JSON.stringify(tennisclub));
			}
*/
	        // Set the default icon size
	        tennisclub.iconsize = new google.maps.Size(24,25);

	        //Marker creation
	        var newMarker = addMarker(tennisclub);

	        newMarker.tennisclub = tennisclub;
	        
	        //Adds the infowindow
	        addInfoWindow(newMarker);

	    }    // end for loop

	});    // end getJSON call
     
}

function closeMap() {
	// Close the panel down that is displaying the detailed location map

	$('.map-title').empty().html('');

	// $('#map').toggle('slow');  // Make current map area invisible
	$('#map').addClass('noshow');  // Make current map area invisible

	// Now re-display the overview map
	displayOverviewMap();

}

// Display coach list
function showLocationMap(postcode,title) {

	var mypostcode = postcode || "B92 0DQ";  // Default to Hampton Sports Club postcode
	var mytitle = title || "Map of postcode "+mypostcode;
	var topbanner = new String("").toString();

	$('.map-title').html('');
	$('#map').addClass('noshow');  // Make current map area invisible

	if (debugthis) {
		console.log("Inside showLocationMap and postcode = "+mypostcode);
	}

	// setLatitudeLongitude(mypostcode);  // Determine latitude and longitude of the postcode

	displayMapUsingPostcode(mypostcode, 'map');

	// Put default title on the map
	topbanner = mytitle+'<span class="rhs"><a href="javascript: closeMap()">Close &#215;</a></span>';
	// topbanner += '<br /><small>'+address1}},&nbsp;{{address2}}
	$('.map-title').html(topbanner);

	$('#map').removeClass('noshow'); // Show the rendered map
	// $('#map-canvas').toggle('slow'); // Show the rendered map

	// move page to show map
    var new_position = $('#map-panel').offset();
    window.scrollTo(new_position.left,new_position.top);
	// window.location.hash="#map-panel";

}

function displayMapUsingPostcode(postcode,domid) {

  	//   var map;
	var address = postcode || "B92 0DQ";
  	var domnode = domid || 'map';
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
	var mypostcode;
  	var lat;
  	var lng;
  	var mycoords = new Object();

	// Re-initialise globals
	curLatitude = 0;
	curLongitude = 0;

<<<<<<< HEAD
	mypostcode = address.replace(' ','');
=======
	// Clear out the specified DOM node ready for new map
	$('#'+domnode).empty().html();

	mypostcode = address.replace(' ','');  // Remove any embedded spaces
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

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

<<<<<<< HEAD
=======
	    //Create the marker on the map for the club's coordinates    
	    var marker = new google.maps.Marker({
	          
	        //Position of marker
	        position: new google.maps.LatLng(curLatitude, curLongitude),
	        
	        //Map
	        map: map,                
	        
	        //Icon details
	        icon: {
	            
	            //URL of the image
	            url: '/img/clubicon.png',
	            
	            //Sets the image size
	            size: new google.maps.Size(32,33),
	            
	            //Sets the origin of the image (top left)
	            origin: new google.maps.Point(0,0),
	            
	            //Sets the anchor (middle, bottom)
	            anchor: new google.maps.Point(12,25),
	            
	            //Scales the image
	            scaledSize: new google.maps.Size(32,33)
	        },
	        
	        //Sets the title when mouse hovers
	        title: new String("Club").toString()
	                               
	    });
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
	});

}









