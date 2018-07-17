//
//		admin.js
//
//		Using, Sammy, Handlebars and plugin code 
//

// Utility functions

// Register Handlebars helpers - may use swag instead

/*
Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});
*/

/*

    Sample function

// Display coach list
function displayCoachList() {

	var url = "https://hamptontennis.org.uk/admin/fetchJSON.asp?id=0";
	// var eventsfound = false;
	$.getJSON(url,function(data){

		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allCoaches:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var coachdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;

		//Get the HTML from the template   in the script tag
	   var theTemplateScript = $("#coachlist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html());    
		$("#main").append (theTemplate(coachdata)); 

	});  // end of function(data)

}
*/

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

	this.get('/', function(context) { 
		// context.app.swap('');   // clears HTML content
		// Redisplay admin home page - blank with buttons
		context.app.swap('');

	}); 

	// Membersahip pages   -----------------------------

	this.get('/membership', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Membership - top level');


	});   

	// Display single coach page for edit
	this.get('/membership/benefits', function(context) {
		context.app.swap('');   // clears HTML content
		// this.item = this.items[context.params['id']];

		// Now edit this coach details
		displayDummyText('Membership benefits');

	});    

	this.get('/membership/packages', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Membership packages - automatically links across to ClubSpark');


	});   // end get

	this.get('/othersports', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Other sports incl. links to other club web sites');


	});   // end get

	// -------------  End of Membership pages  -------------------

	// Playing pages   -----------------------------

	this.get('/playing', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Playing - top level');


	});   


	// -------------  End of Playing pages  -----------------


	// Coaching pages   -----------------------------

	this.get('/coaching', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Coaching - top level');


	});   


	// -------------  End of Coaching pages  -----------------


	// Holiday Camps   -----------------------------

	this.get('/holidayclubs', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('Holiday Clkubs - top level');


	});   


	// -------------  End of Holiday Clubs pages  -----------------

	// News and events pages   -----------------------------

	this.get('/news', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('News and events - top level');


	});   


	// -------------  End of news and events pages  -----------------

	// About us pages   -----------------------------

	this.get('/about', function(context) { 
		context.app.swap('');   // clears HTML content
		// Redisplay coaches home page
		displayDummyText('About Us - top level');


	});   


	// -------------  End of Playing pages  -----------------






});


	// End of route definition

$(function() { 

	// Set signed-in status
	setAdminSignedIn();

	// Now run the main Sammy route
	app.run('#/');
}); 

})(jQuery);


