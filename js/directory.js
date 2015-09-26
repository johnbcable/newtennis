

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
<<<<<<< HEAD
		var eventdata = eval("(" + jsonstring + ")");
=======
		var searchdata = eval("(" + jsonstring + ")");
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#directorysearch-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
<<<<<<< HEAD
		$("#directorysearchresults").append (theTemplate(eventdata)); 
=======

		// clear out existing content
		$('#directorysearchresults').html('');

		$("#directorysearchresults").append (theTemplate(searchdata)); 

		// Change results heading
		$('.resultsheading').html('Results - <small>surnames beginning with &quot;'+searchsurname+'&quot;</small>');
		
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}    // end of displayDirectorySearchResult

$(document).ready(function() {

	// Register onclick handlers for the searchbutton

	$( "#runsearch" ).click(function() {
<<<<<<< HEAD
		// clear out existing content
		$('#directorysearchresults').html('');
=======
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

	  	// alert( "Handler for runsearch.click() called." );
	  	
	  	displayDirectorySearchResults();

	  	// alert("Should be search results of some sort below");
	});	

<<<<<<< HEAD

=======
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
})  // end of document.ready

