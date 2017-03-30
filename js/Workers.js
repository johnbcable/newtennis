//
//	Workers.js
//
//	All Javascript routines to generate all segments of a a Worker.dat
//	as separate files
//
//	Normally called from Workers.html
//

function getAnonymousWorkers() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		// var jsonstring = JSON.stringify(data);

		// jsonstring = new String("{allAnonymousWorkers:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		// var anonymousworkerdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		// $("#receivedjson").append(jsonstring);

		downloadDAT({ data: data, filename: "AnonymousWorker.dat" });

	});  // end of function(data)

}

// ============================================================================
function getLegislativeData() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		downloadDAT({ data: data, filename: "LegislativeData.dat" });

	});  // end of function(data)

}

// ============================================================================
function getWorkRelationship() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		downloadDAT({ data: data, filename: "WorkRelationship.dat" });

	});  // end of function(data)

}

// ============================================================================
function getWorkTerms() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		downloadDAT({ data: data, filename: "WorkTerms.dat" });

	});  // end of function(data)

}

// ============================================================================
function getPersonPhone() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		downloadDAT({ data: data, filename: "PersonPhone.dat" });

	});  // end of function(data)

}

// ============================================================================
function getPersonEmail() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		downloadDAT({ data: data, filename: "PersonEmail.dat" });

	});  // end of function(data)

}

// ============================================================================
function getPersonAddress() {

	var url = "https://hamptontennis.org.uk/jcJSON.asp?id=1";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		downloadDAT({ data: data, filename: "getPersonAddress.dat" });

	});  // end of function(data)

}

$(document).ready(function() {
	

})  // end of document.ready

