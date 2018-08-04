
function displayDummyText(message) {

	$("#main").append(message);

}

// --------------  End of helper/utility functions ---------------------------

// Main Sammy area
(function($) {

	// Set element main as where the action will be
	var app = $.sammy('#main', function() {

	// this.element_selector = '#main';

	// Define all the required routes

	// Home or start page   ----------------------------

	this.get('#/', function(context) { 
		// context.app.swap('');   // clears HTML content
		// Redisplay admin home page - blank with buttons
		context.app.swap('');

	}); 

	// Membersahip pages   -----------------------------

	this.get('#/membership', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Membership - top level');


	});   

	// Display single coach page for edit
	this.get('#/membership/benefits', function(context) {
		context.app.swap('');   // clears HTML content
		// this.item = this.items[context.params['id']];

		// Now edit this coach details
		displayDummyText('Membership benefits');

	});    

	this.get('#/membership/packages', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Membership packages - automatically links across to ClubSpark');


	});   // end get

	this.get('#/othersports', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Other sports incl. links to other club web sites');


	});   // end get

	// -------------  End of Membership pages  -------------------

	// Playing pages   -----------------------------

	this.get('#/playing', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Playing - top level');


	});   

	this.get('#/socialtennis', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Social tennis');


	});   

	this.get('#/boxleagues', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Box Leagues');


	});   

	this.get('#/teams', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Team tennis');


	});   

		this.get('#/tournaments', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Tournaments');


	});   

	this.get('#/bookacourt', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Book a court');


	});   

	// -------------  End of Playing pages  -----------------


	// Coaching pages   -----------------------------

	this.get('#/coaching', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Coaching - top level');


	});   

	this.get('#/coaching/adults', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Adult coaching');


	});   

	this.get('#/coaching/juniors', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Junior coaching');


	});   

	this.get('#/coaching/coaches', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Coaches');


	});   


	// -------------  End of Coaching pages  -----------------


	// Holiday Camps   -----------------------------

	this.get('#/holidayclubs', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Holiday Clkubs - top level');


	});   


	// -------------  End of Holiday Clubs pages  -----------------

	// News and events pages   -----------------------------

	this.get('#/news', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('News and events - top level');


	});   


	this.get('#/events', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Events calendar');


	});   


	this.get('#/social', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('News and events - top level');


	});   

	this.get('#/photos', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Photo gallery');


	});   



	// -------------  End of news and events pages  -----------------

	// About us pages   -----------------------------

	this.get('#/about', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('About Us - top level');


	});   


	this.get('#/about/location', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('About Us - location');


	});   



	this.get('#/about/policies', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('About Us - policies');


	});   



	this.get('#/about/committee', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('About Us - know your committee');


	});   


	this.get('#/about/awards', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('About Us - awards etc.');


	});   

	// -------------  End of About Us pages  -----------------






});


	// End of route definition

$(function() { 

	// Set signed-in status
	// setAdminSignedIn();

	// Now run the main Sammy route
	app.run('#/');
}); 

})(jQuery);


