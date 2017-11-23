//
//    members.js
//

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

function signMeIn() {

    var userid = $('#frmUserId').val();
    var pin = $('#frmPassword').val();
    var refurl = $('#refurl').attr("value");

	console.log("Inside signMeIn");
	console.log("frmUserId = ["+userid+"]");
	console.log("frmPassword = ["+pin+"]");
	console.log("refurl = ["+refurl+"] - on entry to routine");

	alert("Ready to redirect to "+refurl);

	// $('#signin').submit();   // Try this way - refurl not being picked up

	return false;   // should now submit the signin form

}


$(document).ready(function() {


/*
	$('#testSubmit').click(function(){
		signMeIn();
	});
*/

 });    // document.ready


