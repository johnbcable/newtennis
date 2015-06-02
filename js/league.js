//
//		league.js
//
//		Using Handlebars and plugin code 
//

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display coach list
function displayLeagueTeamList() {

	var url = "http://hamptontennis.org.uk/fetchJSON.asp?id=17";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allLeagueTeams:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var leagueteamdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#leagueteamlist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#teamlist").append (theTemplate(leagueteamdata)); 

	});  // end of function(data)

}


// --------------  End of helper/utility functions ---------------------------

$(document).ready(function() {

	// Need to check if this person is signed-in and
	// display the loginModal if not


	// Show league team list
	displayLeagueTeamList();


})  // end of document.ready




