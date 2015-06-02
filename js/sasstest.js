//
//    members.js
//

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});




$(document).ready(function() {

	// Need to check if this person is signed-in and
	// display the loginModal if not

	// Display calendar icon + todays events
	// displayTodaysEvents();



	// Show my upcoming court bookings in the My Club area
	// displayMyCourtBookings();

	// Show my box league involvements in the My Club area
	// displayMyBoxleagues();



})  // end of document.ready

