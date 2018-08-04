//
//		homefixtures.js
//
//		Using Handlebars 
//
//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("https://hamptontennis.org.uk/fetchJSON.asp");
var curseason = 2016;  	// get the current value from the year

// Now create the required URLs for the team and its fixtures
var homefixturesurl = new String("").toString();	// holds string for URL for fixtures query

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
	if (thismonth < 4)
		thisyear = thisyear - 1;
	return(thisyear);
}
//==================================================
function paramSetup() {

	curseason = currentSeason();   		// get the current value from todays date

	// Now create the URL's for the team and its fixtures
	homefixturesurl = new String(baseurl + "?id=46&p1="+encodeURIComponent(curseason));

}

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display fixture list for a given team and season

function displayHomeFixtures(season) {


	// var eventsfound = false;
	$.getJSON(homefixturesurl,function(data){

		// Need to accumulate summary data object here 
		// by looping through returned data


		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allHomeFixtures:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var homefixturedata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;


		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#homefixtures-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#main").empty();   
		$("#main").append (theTemplate(homefixturedata)); 


	});  // end of function(data)

}


// --------------  End of helper/utility functions ---------------------------

// Now do the document.ready stuff

$(document).ready(function() {
	
	// display Ladies 1st Team on initial load
	
	paramSetup();
	displayHomeFixtures(curseason);
	

})  // end of document.ready



