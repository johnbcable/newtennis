//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("http://hamptontennis.org.uk/fetchJSON.asp");

var curseason;  	// get the current value from the year

// Now create the required URL for the tournament results
var winnersurl;	// holds string for URL for tournament winners query

//
// Define utility functions first
//
function paramSetup() {

	curseason = $('#year').val();   // get the current value from the year

	// Now craete the URL's for the race details, the winners and then the runners
	winnersurl = new String(baseurl + "?id=23&p1="+encodeURIComponent(curseason));

/*	
	alert('At end of paramSetup, winnersurl is now ['+winnersurl+']');
*/
}

// Function to get the winners details for the currently chosen year
// 
function getWinners(url) {

/*
	alert("Inside getWinners using URL "+url);
*/
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allWinners:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var winnersdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
        var theTemplateScript = $("#winners-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#winnerstable").empty();   
		$("#winnerstable").append(theTemplate(winnersdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from '+url+' is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}

function displayWinners() {

	paramSetup();

	getWinners(winnersurl);

}

// Now do the document.ready stuff

$(document).ready(function() {
	
	paramSetup();		// Setup parameters on first entry so can display default results

	getWinners(winnersurl);  // Get winners on initial load

/*
	// Refresh all results if the Fetch button is pressed
	$('#mysubmit').click( function (event) {

		//  Prevent the default form submission
		event.preventDefault();

		// Now pick up values from displayed form
		paramSetup();

		// Now get the winners results and populate the winners table
		getWinners(winnersurl);

	});    // end of mysubmit.click
*/

})  // end of document.ready

