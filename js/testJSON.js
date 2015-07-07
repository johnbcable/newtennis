

$(document).ready(function() {


	$('#testSubmit').click(function() {

		var url = "http://hamptontennis.org.uk/testJSON4.asp";
		var goodJSON = "N";

		console.log(url);

		$.getJSON(url,function(alldata) {

			console.log("Inside getJSON");
			goodJSON = (alldata.length > 0) ? "Y" : "N";
			console.log("Inside getJSON - goodJSON = "+goodJSON);
	
			console.log("Value of query is ["+(alldata.result) ? "true" : "false"+"]");
			console.log("Value of successmessages is ["+alldata.successmessages+"]");
			console.log("Value of errormessages is ["+alldata.errormessages+"]");
			console.log("Value of debugmessages is ["+alldata.debugmessages+"]");
			console.log("Value of errordetails is ["+alldata.errodetails+"]");
			console.log("Value of DB query or update string is ["+alldata.dbstring+"]");
			console.log("Value of data is ["+alldata.data+"]");

			alert("Check console log");

		});  // end of function(data)	  	

	});    // testsubmit.click

 });    // document.ready
