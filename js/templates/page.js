//
//  Template for page-specific Javascript file
//
//  Needs to set up variables and do 
//
var signedin = new String("N").toString();  // define globally so can use the $.Deferred() jQuery construct
var debugthis = true;      // set to true to get console output
var myMemberID = new String("").toString();         // set to memberid of petrson who has signed in

$(document).ready(function() {

	setSignedIn();   // from sessions.js
    

	$( '#loginmenu' ).click(function() {
		$('#frmUserId').focus();
	});


	$('#loginSubmit').click(logMeIn);  // logMeIn is defined in sessions.js


 });    // document.ready

