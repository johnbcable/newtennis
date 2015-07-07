//
//    members.js
//

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display my court bookings
function displayMyCourtBookings() {

	var url = "http://hamptontennis.org.uk/mycourtbookings.asp";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		// Add name on front if missing
		// jsonstring = new String("{allCoaches:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var bookingsdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#bookingslist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#mycourtbookings").append (theTemplate(bookingsdata)); 

	});  // end of function(data)

}

// Display my box league involvement
function displayMyBoxleagues() {

	var url = "http://hamptontennis.org.uk/myboxleagues.asp";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allBoxLeagues:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var boxleaguedata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#boxleagues-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#myboxleagues").append (theTemplate(boxleaguedata)); 

		// Uncomment following line for debugging
		// $("#receivedjson").html('JSON received back from testboxleagues.asp is <br /><br />'+jsonstring+'<br /><hr />');

	});  // end of function(data)

}

function displayTodaysEvents() {
	
	var jsonstring = new String("");
	var url = "http://hamptontennis.org.uk/fetchJSON.asp?id=1";
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

