//
//    members.js
//

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display my court bookings
function displayMyCourtBookings() {

	var url = "http://hamptontennis.org.uk/mycourtbookings.asp";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		// Add name on front if missing
		// jsonstring = new String("{allCoaches:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var bookingsdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#bookingslist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#mycourtbookings").append (theTemplate(bookingsdata)); 

	});  // end of function(data)

}

// Display my box league involvement
function displayMyBoxleagues() {

	var url = "http://hamptontennis.org.uk/myboxleagues.asp";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allBoxLeagues:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var boxleaguedata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#boxleagues-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#myboxleagues").append (theTemplate(boxleaguedata)); 

		// Uncomment following line for debugging
		// $("#receivedjson").html('JSON received back from testboxleagues.asp is <br /><br />'+jsonstring+'<br /><hr />');

	});  // end of function(data)

}




$(document).ready(function() {

	// Need to check if this person is signed-in and
	// display the loginModal if not


	// Show my upcoming court bookings in the My Club area
	displayMyCourtBookings();

	// Show my box league involvements in the My Club area
	displayMyBoxleagues();



})  // end of document.ready

