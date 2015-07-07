

function displayDirectorySearchResults () {
	var jsonstring = new String("");
	var url = "http://hamptontennis.org.uk/fetchJSON.asp?id=14";

	var searchsurname = $('#searchsurname').val();

	url += "&p1="+searchsurname;

	// console.log("Inside displayDirectorySearchResults, url = ["+url+"]");

	// var eventsfound = false;
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allMembers:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var eventdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#directorysearch-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#directorysearchresults").append (theTemplate(eventdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}    // end of displayDirectorySearchResult

$(document).ready(function() {

	// Register onclick handlers for the searchbutton

	$( "#runsearch" ).click(function() {
		// clear out existing content
		$('#directorysearchresults').html('');

	  	// alert( "Handler for runsearch.click() called." );
	  	
	  	displayDirectorySearchResults();

	  	// alert("Should be search results of some sort below");
	});	


})  // end of document.ready

