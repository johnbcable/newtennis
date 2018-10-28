
function displayDummyText(message) {

	$("#main").append(message);

}

function consoleText(message) {

	console.log(message);

}
// --------------  End of helper/utility functions ---------------------------

// Main Sammy area
(function($) {

	// Set element main as where the action will be
	var app = $.sammy('#main', function() {

	// this.element_selector = '#main';

	// Define all the required routes


	// Membersahip pages   -----------------------------

	// Display single coach page for edit
	this.get('#/membership/benefits', function(context) {
		context.app.swap('');   // clears HTML content
		// this.item = this.items[context.params['id']];

		// Now edit this coach details
		consoleText('Membership benefits');

	});    

	this.get('#/membership/packages', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Membership packages - automatically links across to ClubSpark');


	});   // end get

	this.get('#/membership', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Membership - top level');


	});   

	this.get('#/othersports', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Other sports incl. links to other club web sites');


	});   // end get

	// -------------  End of Membership pages  -------------------

	// Playing pages   -----------------------------

	this.get('#/playing', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Playing - top level');


	});   

	this.get('#/socialtennis', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Social tennis');


	});   

	this.get('#/boxleagues', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Box Leagues');


	});   

	this.get('#/teams', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Team tennis');


	});   

		this.get('#/tournaments', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Tournaments');


	});   

	this.get('#/bookacourt', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Book a court');


	});   

	// -------------  End of Playing pages  -----------------


	// Coaching pages   -----------------------------

	this.get('#/coaching/adults', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Adult coaching');


	});   

	this.get('#/coaching/juniors', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Junior coaching');


	});   

	this.get('#/coaching/coaches', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Coaches');


	});   


	this.get('#/coaching', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Coaching - top level');


	});   

	// -------------  End of Coaching pages  -----------------


	// Holiday Camps   -----------------------------

	this.get('#/holidayclubs', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Holiday Clubs - top level');


	});   


	// -------------  End of Holiday Clubs pages  -----------------

	// News and events pages   -----------------------------

	this.get('#/news', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('News and events - top level');


	});   


	this.get('#/events', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Events calendar');


	});   


	this.get('#/social', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Social events - top level');


	});   

	this.get('#/photos', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('Photo gallery');


	});   



	// -------------  End of news and events pages  -----------------

	// About us pages   -----------------------------


	this.get('#/about/location', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('About Us - location');


	});   



	this.get('#/about/policies', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('About Us - policies');


	});   



	this.get('#/about/committee', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('About Us - know your committee');


	});   


	this.get('#/about/awards', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('About Us - awards etc.');


	});   


	this.get('#/about', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		consoleText('About Us - top level');


	});   

	// -------------  End of About Us pages  -----------------


	// Home or start page   ----------------------------

	this.get('#/', function(context) { 
		// context.app.swap('');   // clears HTML content
		// Redisplay admin home page - blank with buttons
		context.app.swap('');
		consoleText('Site home page');
		window.location.href = 'https://hamptontennis.org.uk/oldindex.html';

	}); 




});


	// End of route definition

$(function() { 

	// Set signed-in status
	// setAdminSignedIn();

	// Now run the main Sammy route
	app.run('#/');
}); 

})(jQuery);


