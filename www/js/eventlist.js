
function getFutureEvents() {


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

	    //  Now up collapsible management
	    $('.collapsible').collapsible({
	    });

	});  // end of function(data)	// Displays past tournaments from this year

}

$(document).ready(function() {
	
		getFutureEvents();

	    // Deal with Open/Close All links
	    // First - assign collapsible routines to functions
	    function openAll() {
	    	$('.collapsible').collapsible('openAll');
	    }
	    function closeAll() {
	    	$('.collapsible').collapsible('closeAll');
	    }
	    // Now, listen for user clicking Open/Close All
	    $('#closeAll').click(function() {
	    	event.preventDefault();
	    	closeAll();
	    });
	    $('#openAll').click(function() {
	    	event.preventDefault();
	    	openAll();
	    });
	    $('#closeAll2').click(function() {
	        event.preventDefault();
	        closeAll();
	    });
	    $('#openAll2').click(function() {
	        event.preventDefault();
	        openAll();
	    });




})  // end of document.ready

