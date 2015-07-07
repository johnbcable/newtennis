
function showTodaysMatches(domid) {

	var jsonstring = new String("");
	var mydomid = domid || "#whatcanisee";
	var url = "http://hamptontennis.org.uk/fetchJSON.asp?id=22";
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


$(document).ready(function() {
	
	showTodaysMatches("#whatcanisee");

})  // end of document.ready
