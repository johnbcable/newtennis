//
//    members.js
//

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});


function displayTodaysEvents() {
	
	var jsonstring = new String("");
	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		var jsonstring = JSON.stringify(data);
		var myToday = new Date();
		var days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
		var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
		var myDate = myToday.getDate();
		var myMonth = myToday.getMonth();
		var myYear = myToday.getFullYear();
		var myDay = myToday.getDay();
		var myDateTime = new String(myYear+"-"+myMonth+"-"+myDate);

		var strMonth = new String(months[myMonth]).toString();
		var strDay = new String(days[myDay]).toString();

		jsonstring = new String("{allToday:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var eventdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		// Make sure and set the correct information for the calendar icon display
		$('time.icon').attr("datetime",myDateTime);
		$('time.icon em').text(strDay);
		$('time.icon strong').text(strMonth);
		$('time.icon span').text(myDate);

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#todaysevents-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#todaysevents").append (theTemplate(eventdata)); 
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}


$(document).ready(function() {

	// Need to check if this person is signed-in and
	// display the loginModal if not

	// Display calendar icon + todays events
	displayTodaysEvents();



	// Show my upcoming court bookings in the My Club area
	// displayMyCourtBookings();

	// Show my box league involvements in the My Club area
	// displayMyBoxleagues();



})  // end of document.ready

