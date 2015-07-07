//
//		otherclubs.js
//
//		Using Handlebars and plugin code 
//
var debugthis = true;   // set to false for production

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});


// Display coach list
function displayClubList() {

	var url = "http://hamptontennis.org.uk/fetchJSON.asp?id=21";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allClubs:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var clubsdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#clublist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#clublist").append (theTemplate(clubsdata)); 

	});  // end of function(data)

}

function closeMap() {
	// Close the panel down that is displaying the map

	$('.map-title').html('');

	// $('#map-canvas').toggle('slow');  // Make current map area invisible
	$('#map-canvas').addClass('noshow');  // Make current map area invisible
}

// Display coach list
function showLocationMap(postcode,title) {

	var mypostcode = postcode || "B92 0DQ";  // Default to Hampton Sports Club postcode
	var mytitle = title || "Map of postcode "+mypostcode;
	var topbanner = new String("").toString();

	$('.map-title').html('');
	// $('#map-canvas').toggle('slow');  // Make current map area invisible
	$('#map-canvas').addClass('noshow');  // Make current map area invisible

	if (debugthis) {
		console.log("Inside showLocationMap and postcode = "+mypostcode);
	}

	// setLatitudeLongitude(mypostcode);  // Determine latitude and longitude of the postcode

	displayMapUsingPostcode(mypostcode, 'map-canvas');

	// Put default title on the map
	topbanner = mytitle+'<span class="rhs"><a href="javascript: closeMap()">Close</a></span>';
	$('.map-title').html(topbanner);

	$('#map-canvas').removeClass('noshow'); // Show the rendered map
	// $('#map-canvas').toggle('slow'); // Show the rendered map

	// move page to show map
    var new_position = $('#map-panel').offset();
    window.scrollTo(new_position.left,new_position.top);
	// window.location.hash="#map-panel";

}

// --------------  End of helper/utility functions ---------------------------

$(document).ready(function() {


	// Show club list
	displayClubList();

	// Blank out any prior map title
	$('.map-title').html('');
	$('#map-canvas').addClass('noshow');  // Make current map area invisible

})  // end of document.ready




