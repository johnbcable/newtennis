//
//  directory.js 	Javascript to handel members direcfory searching
//					Incorporating autocomplete on members names ()
//					Needs autocomplete.js loaded beforehand.
//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("http://hamptontennis.org.uk/fetchJSON.asp?id=14");
var memberspicklist = new Array();

var cursearch;   	// get the current value from the search term

// Now create the required URL for the tournament results
var searchurl;	// holds string for URL for tournament winners query

//
// Define utility functions first
//
function paramSetup() {

	cursearch = $('#searchsurname').val();   // get the current value from the search term

	// Now craete the URL's for the race details, the winners and then the runners
	searchurl = new String(baseurl + "&p1="+encodeURIComponent(cursearch));

/*	
	alert('At end of paramSetup, winnersurl is now ['+winnersurl+']');
*/
}

function getMembersList(all) {
	// Get full searchable members list
	all = all || false;		// Default to not including children

	var memberlisturl = new String("http://hamptontennis.org.uk/fetchJSON.asp?id=41");

	if (all) {
		// Make sure and include all members if boolean set.
		memberlisturl = new String("http://hamptontennis.org.uk/fetchJSON.asp?id=42");
	}

	var jsonstring = new String("");

	// console.log("Inside displayDirectorySearchResults, url = ["+url+"]");

	// var eventsfound = false;
	$.getJSON(memberslisturl,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allMembers:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var searchdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#directorysearch-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    

		// clear out existing content
		$('#directorysearchresults').html('');

		$("#directorysearchresults").append (theTemplate(searchdata)); 

		// Change results heading
		$('.resultsheading').html('Results - <small>surnames beginning with &quot;'+cursearch+'&quot;</small>');


}

function displayDirectorySearchResults () {
	var jsonstring = new String("");

	// console.log("Inside displayDirectorySearchResults, url = ["+url+"]");

	// var eventsfound = false;
	$.getJSON(searchurl,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allMembers:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var searchdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#directorysearch-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    

		// clear out existing content
		$('#directorysearchresults').html('');

		$("#directorysearchresults").append (theTemplate(searchdata)); 

		// Change results heading
		$('.resultsheading').html('Results - <small>surnames beginning with &quot;'+cursearch+'&quot;</small>');
		
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}    // end of displayDirectorySearchResult

$(document).ready(function() {

	// Make sure and fill up memberspicklist before first search

	getMembersList();   // Default to not including children

	// Register onclick handlers for the searchbutton

	$('#runsearch' ).click( function (event) {

		//  Prevent the default form submission
		event.preventDefault();

  	// alert( "Handler for runsearch.click() called." );
  	
	  	paramSetup();
	  	
	  	displayDirectorySearchResults();

	  	// alert("Should be search results of some sort below");
	});	

})  // end of document.ready

