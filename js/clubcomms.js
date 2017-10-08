
// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) {
    if(v1 == v2) { return options.fn(this); }
    else { return options.inverse(this); }
});


//
//  displayClubCommunications
//
function displayClubCommunications() {

	var jsonstring = new String("");
	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=15";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allCommunications:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var eventdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#clubcomms-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#clubcommunications").append (theTemplate(eventdata)); 
		// jsonstring = JSON.stringify(data);
		
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=15 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}

//
//  displaylubNewsList
//
function displayClubNewsList() {

	var jsonstring = new String("");
	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=24";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allNews:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var newsdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#clubnews-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#clubnews").append (theTemplate(newsdata)); 
		// jsonstring = JSON.stringify(data);
		
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=15 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}


$(document).ready(function() {

	displayClubCommunications();

	displayClubNewsList();
	
})  // end of document.ready

