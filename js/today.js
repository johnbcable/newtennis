$(document).ready(function() {
	
	var jsonstring = new String("");
	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allToday:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var eventdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#todaysevents-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#todaysevents").append (theTemplate(eventdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)
})  // end of document.ready

