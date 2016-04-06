//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("http://hamptontennis.org.uk/fetchJSON.asp");

var curseason;  	// get the current value from the year

// Now create the required URL for the tournament results
var winnersurl;	// holds string for URL for tournament winners query

// Now set up local debugging flag
var debugthis = true;    	// Set to false for normal production use
//
// Define utility functions first
//
function fillTitlesList() {
	
	url = new String(baseurl+"?id=34").toString();

	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allTitles:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var titlesdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
        var theTemplateScript = $("#titleslist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#titleslist").empty();   
		$("#titleslist").append(theTemplate(titlesdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from '+url+' is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}

function paramSetup() {

	curtitle = $('#title').val();   // get the current value from the year

	// Now craete the URL's for the race details, the winners and then the runners
	winnersurl = new String(baseurl + "?id=33&p1="+encodeURIComponent(curtitle));

	if (debugthis) {
		console.log('At end of paramSetup, winnersurl is now ['+winnersurl+']');
	}
}

// Function to get the winners details for the currently chosen year
// 
function getTitleWinners(url) {

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
        var theTemplateScript = $("#titlewinners-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#titlewinnerstable").empty();   
		$("#titlewinnerstable").append(theTemplate(winnersdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from '+url+' is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}

function displayTitleWinners() {

	if (debugthis) {
		console.log('Inside displayTitleWinners before paramSetup');
		console.log('winnersurl is '+winnersurl);
		console.log('baseurl is '+baseurl);
		console.log('curseason is '+curseason);
	}

	paramSetup();

	if (debugthis) {
		console.log('Inside displayTitleWinners after paramSetup');
		console.log('winnersurl is '+winnersurl);
		console.log('baseurl is '+baseurl);
		console.log('curseason is '+curseason);
	}

	getTitleWinners(winnersurl);

}

// Now do the document.ready stuff

$(document).ready(function() {
	
	fillTitlesList();  // load distinct set of titles for drop down

	// Refresh all results if the Fetch button is pressed
	$('#mysubmit').click( function (event) {

		//  Prevent the default form submission
		event.preventDefault();

		// Now get the winners results and populate the winners table
		displayTitleWinners();

	});    // end of mysubmit.click

})  // end of document.ready

