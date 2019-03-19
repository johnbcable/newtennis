
function showTodaysMatches(domid) {

	var jsonstring = new String("");
	var mydomid = domid || "#whatcanisee";
	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=22";
	var mytitle = "<h4>To watch or take part in today at the club</h4>";

	// var eventsfound = false;
	$.getJSON(url,function(data){

		if ( data.length > 0 ) {

			var jsonstring = JSON.stringify(data);

			jsonstring = new String("{watchToday:"+jsonstring+"}");

			// var eventdata = $.parseJSON(jsonstring);
			var todaysdata = eval("(" + jsonstring + ")");

			// Set the boolean if we have data
			// if (eventdata.length > 1)
			//	eventsfound = true;

			//Get the HTML from the template   in the script tag
		    var theTemplateScript = $("#whatcanisee-template").html(); 

		   //Compile the template
		    var theTemplate = Handlebars.compile (theTemplateScript); 
			// Handlebars.registerPartial("description", $("#shoe-description").html());  

			// Show list of todays matches  
			$("#whatcanisee").append (theTemplate(todaysdata)); 
			
			// Show the title
			$("#watch-title").append(mytitle);

			// Re-display the info
			$('.seeanddotoday').removeClass('noshow');

			// jsonstring = JSON.stringify(data);
			// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
		}
	});  // end of function(data)

}

function displayTodaysEvents() {
	
	var url = "https://hamptontennis.org.uk/fetchJSON.asp?id=22";
	var willdebug = true;

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

		if (willdebug) {
			console.log("Inside getJSON in displayTodaysEvents .....");
			console.log("...... myToday = "+myToday);
			console.log("...... days = "+days);
			console.log("...... months = "+months);
			console.log("...... myDate = "+myDate);
			console.log("...... myMonth = "+myMonth);
			console.log("...... myYear = "+myYear);
			console.log("...... myDay = "+myDay);
			console.log("...... myDateTtime = "+myDateTime);
			console.log("...... strMonth = "+strMonth);
			console.log("...... strDay = "+strDay);
			console.log("End of logging");
		}

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

		// Make sure and set the correct information for the calendar icon display
		$('time.icon').attr("datetime",myDateTime);
		$('time.icon em').text(strDay);
		$('time.icon strong').text(strMonth);
		$('time.icon span').text(myDate);

		
		// jsonstring = JSON.stringify(data);
		// $("#receivedjson").html('JSON received back from fetchJSON.asp?id=2 is <br /><br />'+jsonstring+'<br /><hr />');
	});  // end of function(data)

}


$(document).ready(function() {
	
	showTodaysMatches("#whatcanisee");

})  // end of document.ready
