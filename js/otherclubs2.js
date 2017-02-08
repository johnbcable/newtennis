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

	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=21";
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


// --------------  End of helper/utility functions ---------------------------

$(document).ready(function() {

	// Display overview map
	displayOverviewMap();

	// Show club list
	displayClubList();

	// Blank out any prior map title
	// $('.map-title').html('');
	// $('#map-canvas').addClass('noshow');  // Make current map area invisible

})  // end of document.ready




