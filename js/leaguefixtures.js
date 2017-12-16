//
//		leaguefixtures.js
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
var fixturesurl = new String("").toString();	// holds string for URL for fixtures query
var teamurl = new String("").toString();		// holds information about team

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

	curteam = $('#teamname').val();     // get the team name from form
	curseason = currentSeason();   		// get the current value from todays date

	// Now create the URL's for the team and its fixtures
	teamurl = new String(baseurl + "?id=36&p1="+encodeURIComponent(curteam));
	fixturesurl = new String(baseurl + "?id=20&p1="+encodeURIComponent(curseason)+"&p2="+encodeURIComponent(curteam));

}

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display fixture list for a given team and season

function displayTeamFixtures(teamid, season) {

	var summarydata = new Object();

	// initialise summarydata
	summarydata.won = 0;
	summarydata.lost = 0;
	summarydata.drawn = 0;
	summarydata.points = 0;
	summarydata.notplayed = 0;
	summarydata.totalmatches = 0;
	summarydata.played = 0;

	// var eventsfound = false;
	$.getJSON(fixturesurl,function(data){

		// Need to accumulate summary data object here 
		// by looping through returned data


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
		$("#main").empty();   
		$("#main").append (theTemplate(fixturedata)); 

		// Now need to accumulate summary data from fixturedata
/*
		var json = [ 
 		 { 'red': '#f00' },
 		 { 'green': '#0f0' },
 		 { 'blue': '#00f' }
		 ];

		$.each(json, function () {
		   $.each(this, function (name, value) {
		      console.log(name + '=' + value);
		   });
		});

	summarydata.won = 0;
	summarydata.lost = 0;
	summarydata.drawn = 0;
	summarydata.points = 0;
	summarydata.notplayed = 0;
	summarydata.totalmatches = 0;
	summarydata.played = 0;

*/
		// Loop through fixturedata
		$.each(fixturedata, function () {
		   $.each(this, function () {
		   		summarydata.totalmatches += 1;
		   		if (this.hamptonresult == 0 && this.opponentresult == 0) {
		   			summarydata.notplayed += 1;
		   		}  
		   		if (this.hamptonresult > 0 && this.opponentresult == this.hamptonresult) {
		   			summarydata.drawn += 1;
		   		}  
		   		if (this.hamptonresult > this.opponentresult) {
		   			summarydata.won += 1;
		   		}  
		   		if (this.hamptonresult < this.opponentresult) {
		   			summarydata.lost += 1;
		   		}  
		   		if (this.hamptonresult > 0 || this.opponentresult > 0) {
		   			summarydata.played += 1;
		   		}  
		   		summarydata.points += this.hamptonresult;

		   });
		});
		summarydata.potentialpointstotal = (summarydata.notplayed * 4) + summarydata.points;

   		if (debugthis) {
			console.log('At end of loop for summary data ........................');
			console.log('Total matches is '+summarydata.totalmatches);
			console.log('Played so far is '+summarydata.played);
			console.log('Matches won so far is '+summarydata.won);
			console.log('Matches lost so far is '+summarydata.lost);
			console.log('Matches drawn so far is '+summarydata.drawn);
			console.log('Points so far is '+summarydata.points);
			console.log('Potential maximum points achievable is '+summarydata.potentialpointstotal);
   		}

		jsonstring = JSON.stringify(summarydata);

		jsonstring = new String("{fixtureSummary:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		summarydata = eval("(" + jsonstring + ")");

		//Get the HTML from the template   in the script tag
	    var summaryTemplateScript = $("#summary-template").html(); 

	   //Compile the template
	    var summaryTemplate = Handlebars.compile (summaryTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#summary").empty();   
		$("#summary").append (summaryTemplate(summarydata)); 


	});  // end of function(data)

}

// Display fixture list for a given team and season

function displayTeamHeader(teamname) {

	// var eventsfound = false;
	$.getJSON(teamurl,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{teamDetails:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var teamdata = eval("(" + jsonstring + ")");

		if (debugthis) {
			console.log('Before inside displayTeamHeader ........................');
			console.log('teamname is '+teamname);
			console.log('teamurl is '+teamurl);
			console.log('teamDetails.captain is '+teamdata.teamcaptain);
			console.log('teamDetails.division is '+teamdata.division);
		}

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#teamheader-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#teamheader").empty();   
		$("#teamheader").append (theTemplate(teamdata)); 


	});  // end of function(data)

}

// --------------  End of helper/utility functions ---------------------------

// Now do the document.ready stuff

$(document).ready(function() {
	
	// display Ladies 1st Team on initial load
	
	paramSetup();
	displayTeamHeader(curteam);
	displayTeamFixtures(curteam, curseason);
	
	$('#teamname').change( function(event) {
		event.preventDefault();
		if (debugthis) {
			console.log('Before paramSetup ........................');
			console.log('fixturesurl is '+fixturesurl);
			console.log('teamurl is '+teamurl);
			console.log('baseurl is '+baseurl);
			console.log('curseason is '+curseason);
		}

		paramSetup();

		if (debugthis) {
			console.log('After paramSetup .........................');
			console.log('fixturesurl is '+fixturesurl);
			console.log('teamurl is '+teamurl);
			console.log('baseurl is '+baseurl);
			console.log('curseason is '+curseason);
		}

		displayTeamHeader(curteam);
		displayTeamFixtures(curteam, curseason);

	});

	// Refresh all results if the Fetch button is pressed
	$('#mysubmit').click( function (event) {

		//  Prevent the default form submission
		event.preventDefault();
		if (debugthis) {
			console.log('Before paramSetup ........................');
			console.log('fixturesurl is '+fixturesurl);
			console.log('teamurl is '+teamurl);
			console.log('baseurl is '+baseurl);
			console.log('curseason is '+curseason);
		}

		paramSetup();

		if (debugthis) {
			console.log('After paramSetup .........................');
			console.log('fixturesurl is '+fixturesurl);
			console.log('teamurl is '+teamurl);
			console.log('baseurl is '+baseurl);
			console.log('curseason is '+curseason);
		}

		displayTeamHeader(curteam);
		displayTeamFixtures(curteam, curseason);

	});    // end of mysubmit.click

})  // end of document.ready



