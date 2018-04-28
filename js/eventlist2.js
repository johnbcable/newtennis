$(document).ready(function() {
	
	var jsonstring = new String("");
	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=2";
	var prevdate = "ZZ/ZZ/ZZZZ";

	// var eventsfound = false;
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allEvents:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var eventdata = eval("(" + jsonstring + ")");

		// Loop through eventdata only leaving date when date changes

		$.each(eventdata, function () {
		   $.each(this, function () {
		   		if (this.dateofevent == prevdate)
		   				this.dateofevent = '';
		   		else
		   			prevdate = this.dateofevent;
		   });
		});

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#eventlist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#futureevents").append (theTemplate(eventdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)
})  // end of document.ready

