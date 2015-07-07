//
//		leagues.js
//
//		Using, Sammy, Handlebars and plugin code 
//

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display fixture list for a given team and season

function displayTeamFixtures(teamid, season) {

	var url = "http://hamptontennis.org.uk/admin/fetchJSON.asp?id=0";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allFixtures:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var fixturedata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#fixturelist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#main").append (theTemplate(fixturedata)); 

	});  // end of function(data)

}


// --------------  End of helper/utility functions ---------------------------

// Main Sammy area
(function($) {

	// Set element main as where the action will be
	var app = $.sammy('#main', function() {

	// this.element_selector = '#main';

	// Define all the required routes

	// Home or start page   ----------------------------

	this.get('#/', function(context) { 
		// context.app.swap('');   // clears HTML content
		// Redisplay admin home page - blank with buttons
		context.app.swap('');

	});   // end get

	// Mens 1st team  -----------------------------

	this.get('#/Mens/1/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(1,context.params['year']);


	});   // end get

	// Mens 2nd team  -----------------------------

	this.get('#/Mens/2/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(2,context.params['year']);


	});   // end get

	// Mens 3rd team  -----------------------------

	this.get('#/Mens/3/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(3,context.params['year']);


	});   // end get

	// Mens 4th team  -----------------------------

	this.get('#/Mens/4/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(39,context.params['year']);


	});   // end get

	// Mens 5th team  -----------------------------

	this.get('#/Mens/5/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(43,context.params['year']);


	});   // end get

	// -------------  End of Mens league teams  -------------------

	// -------------  Ladies league teams       -------------------

	// Ladies 1st team  -----------------------------

	this.get('#/Ladies/1/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(4,context.params['year']);


	});   // end get

	// Ladies 2nd team  -----------------------------

	this.get('#/Ladies/2/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(5,context.params['year']);


	});   // end get

	// Ladies 3rd team  -----------------------------

	this.get('#/Ladies/3/:year', function(context) { 
		context.app.swap('');   // clears HTML content
		// Display mens 1st team fixtures
		displayTeamFixtures(17,context.params['year']);


	});   // end get



});


	// End of route definition

$(function() { 

	// Set signed-in status
	// setSignedIn();
	// already done in sessions.js

	// Now run the main Sammy route
	app.run('#/');
}); 

})(jQuery);


