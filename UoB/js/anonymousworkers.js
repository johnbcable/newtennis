

function getAnonymousWorkers() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allCoachDates:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var anonymousworkerdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		// $("#receivedjson").append(jsonstring);

		downloadDAT({ data: data, filename: "AnonymousWorker.dat" });

	});  // end of function(data)

}


$(document).ready(function() {
	

})  // end of document.ready

