//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("http://hamptontennis.org.uk/fetchJSON.asp");

var curtitle;  	// get the current value from the year

// Now create the required URL for the tournament results
var winnersurl;	// holds string for URL for tournament winners query

// Now set up local debugging flag
var debugthis = true;    	// Set to false for normal production use
//
// Define utility functions first
//
function paramSetup() {

	curtitle = $('#titlepicker').val();   // get the current value from the year
	if (!curtitle) {
		curtitle = new String('Mens Singles');
	}

	// Now craete the URL's for the race details, the winners and then the runners
	winnersurl = new String(baseurl + "?id=33&p1="+encodeURIComponent(curtitle));

	if (debugthis) {
		console.log('At end of paramSetup, winnersurl is now ['+winnersurl+']');
	}
}

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

// Function to get the winners details for the currently chosen title
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
		console.log('Inside displayWinners before paramSetup');
		console.log('winnersurl is '+winnersurl);
		console.log('baseurl is '+baseurl);
	}

	paramSetup();

	if (debugthis) {
		console.log('Inside displayWinners after paramSetup');
		console.log('winnersurl is '+winnersurl);
		console.log('baseurl is '+baseurl);
	}

	getTitleWinners(winnersurl);

}

// Now do the document.ready stuff

$(document).ready(function() {
	
	fillTitlesList();  // load distinct set of titles for drop down

	displayTitleWinners();  // Get winners on initial load

	// Refresh all results if the year changes
	// N.B.  As list generated from code need to do this in jQuery
	
	$(document.body).on('change','#titlepicker',function(){
	    // alert('Change Happened');
		displayTitleWinners();
	});

/*
	// ... rather than this 
	
 	$("#titlepicker").change( function(event) {
		alert("Change noted on titlepicker");
		// event.preventDefault();
		displayTitleWinners();
	});

	// Refresh all results if the Fetch button is pressed

	$('#mysubmit').click( function (event) {

		//  Prevent the default form submission
		event.preventDefault();

		// Now get the winners results and populate the winners table
		displayTitleWinners();

	});    // end of mysubmit.click
*/

})  // end of document.ready

