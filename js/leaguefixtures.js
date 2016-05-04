//
//		leaguefixtures.js
//
//		Using, Sammy, Handlebars and plugin code 
//
//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("http://hamptontennis.org.uk/fetchJSON.asp");

var curseason;  	// get the current value from the year

// Now create the required URLs for the team and its fixtures
var fixturesurl;	// holds string for URL for fixtures query
var teamurl;		// holds information about team

// Now set up local debugging flag
var debugthis = true;    	// Set to false for normal production use
//
// Define utility functions first
//
//==================================================
function currentYear()
{
	var today = new Date();
	var s = new String("").toString();
	s += today.getFullYear();
	return(s);
}
//==================================================
function currentMonth()
{
	var today = new Date();
	var month;
	var s = 0;
	month = today.getMonth()+1;
	if (month < 10)
		s+= "0";
	s += month;
	return(s);
}
//==================================================
function currentMonthAsString()
{
	var today = new Date();
	var month;
	var s = new String("").toString();
	month = today.getMonth()+1;
	if (month < 10)
		s+= "0";
	s += month;
	return(s);
}
//==================================================
function currentDate()
{
	var today = new Date();
	var day;
	var s = new String("").toString();
	day = today.getDate();
	if (day < 10)
		s += "0";
	s += day;
	return(s);
}
//==================================================
function currentSeason()
{
	var thisyear = currentYear();
	var thismonth = currentMonth();
	if (thismonth < 5)
		thisyear = thisyear - 1;
	return(thisyear);
}
//==================================================
function paramSetup() {

	curteam = $('#teamname');      // get the team name from form
	curseason = currentSeason();   // get the current value from the todays date

	// Now create the URL's for the team and its fixtures
	teamurl = new String(baseurl + "?id=")
	fixturesurl = new String(baseurl + "?id=20&p1="+encodeURIComponent(curseason)+"&p2="+encodeURIComponent(curteam));

	if (debugthis) {
		console.log('At end of paramSetup, fixturesurl is now ['+fixturesurl+']');
	}
}

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display fixture list for a given team and season

function displayTeamFixtures(teamid, season) {

	// var eventsfound = false;
	$.getJSON(fixturesurl,function(data){

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
		// $("#main").empty();   
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


