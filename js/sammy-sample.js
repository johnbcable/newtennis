
//  Define functions to be used in te main Sammy routes area

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});











// End of function definitions


// Main Sammy area
(function($) {

	// Set element with id="main" as where the action will be
	var app = $.sammy('#main', function() {

	// Define all the required routes

	// Home or start page   ----------------------------

	this.get('#/', function(context) { 
		// context.app.swap('');   // clears HTML content
		// Redisplay admin home page - blank with buttons
		context.app.swap('');

	});   // end get

	// Coaches home page   -----------------------------

	this.get('#/coaches', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayCoachList();


	});   // end get

	// Display single coach page for edit
	this.get('#/coaches/:id', function(context) {
		context.app.swap('');   // clears HTML content
		// this.item = this.items[context.params['id']];

		// Now edit this coach details
		editCoach(context.params['id']);

	});    // end get

	// -------------  End of Coaches  -------------------

	// Events home page  -------------------------------

	this.get('#/events', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayEventList();


	});   // end get

	// Display single event page for edit
	this.get('#/events/:id', function(context) {
		context.app.swap('');   // clears HTML content
		// this.item = this.items[context.params['id']];

		// Now edit this coach details
		editEvent(context.params['id']);

	});    // end get

	// -------------  End of Events  -------------------

	// Tournaments home page   -------------------------

	this.get('#/tournaments', function(context) { 

		context.app.swap('');   // clears HTML content

		// Redisplay coaches home page
		displayTournamentList();

	});   // end get

	// Display single tournament page for edit
	this.get('#/tournaments/:id', function(context) {

		context.app.swap('');   // clears HTML content
		// this.item = this.items[context.params['id']];

		// Now edit this coach details
		editTournament(context.params['id']);

	});    // end get

	// -------------  End of Tournaments  -------------------

	// -------------  Quick Message  ------------------------

	this.get('#/quickmessage', function(context) {

		context.app.swap('<p>Inside quick message area</p>');   // clears HTML content
		// this.item = this.items[context.params['id']];

		// Now edit this coach details
		//editTournament(context.params['id']);

	});    // end get

	// -------------  End of Quick Message  -----------------


});


	// End of route definition

$(function() { 

	// Set signed-in status
	setSignedIn();

	// Now run the main Sammy route
	app.run('#/');
}); 

})(jQuery);
