//
//		rightgrade.js
//
//		Using Handlebars 
//
//
//  Variables
//
var jsonstring = new String("");
var baseurl = new String("https://hamptontennis.org.uk/fetchJSON.asp");
var curseason = 2016;  	// get the current value from the year

// Now create the required URLs for the team and its fixtures
var fixturesurl = new String("").toString();	// holds string for URL for fixtures query
var membersurl = new String("").toString();		// holds information about team

// Now set up local debugging flag
var debugthis = true;    	// Set to false for normal production use
//
// Define utility functions first
//
// Date functions
//==================================================
function currentYear()
{
	var today = new Date();
	var s = new String("").toString();
	s += today.getFullYear();
	return(s);
}
//==================================================
function currentMonth()
{
	var today = new Date();
	var month;
	var s = 0;
	month = today.getMonth()+1;
	if (month < 10)
		s+= "0";
	s += month;
	return(s);
}
//==================================================
function seasonAge(birthdate) {
   // birthDate must be a string in DD/MM/YYYY format
   var seasonStart;
   var age = 0;
   var dateArr = birthdate.split("/");
   var theyear = dateArr[2];
   var themonth = new Number(dateArr[1])-1;  // Month numbers start at zero in Javascript
   var theday = dateArr[0];
   var d = new Date(theyear,themonth,theday,0,0,0);
   var curyear = currentYear();
   var curmonth = currentMonth();
   curmonth = new Number(curmonth);

   // Needs to reflect current season not constant 2014
   if (curmonth < 4)
      curyear = curyear - 1;
   seasonStart = new Date(curyear, 3, 1, 0, 0, 0);  // So, April = 3 in JS
   
   age = Math.floor ( (seasonStart - d) / 31556952000 );
   return ( age );
}

//==================================================
function seasonGrade(age)
{
	var thegrade = new String("Adult").toString();
	var theage = new Number(age);
	if (theage < 7)
		thegrade = new String("Under 7").toString();
	if (theage > 6 && theage < 19 )
		thegrade = new String("Junior").toString();
	if (theage > 18 && theage < 26 )
		thegrade = new String("18-25s").toString();
	if (theage > 25 && theage < 65 )
		thegrade = new String("Adult").toString();
	if (theage > 64 )
		thegrade = new String("65-and-Over").toString();
	return (thegrade);

}

//==================================================
// Needs to change each fee year to reflect new fees
function feeForGrade(grade)
{
	var a = new String(grade).toString();

	// For 2016
	if (a == "Under 7") {
		return 0;
	}
	if (a == "Junior") {
		return 37;
	}
	if (a == "18-25s") {
		return 74;
	}
	if (a == "Adult") {
		return 180;
	}
	if (a == "65-and-Over") {
		return 74;
	}
	if (a == "Social") {
		return 42;
	}
}

//==================================================
function feesDifference(gradeondb, calculatedgrade)
{
	var a, b, c, d;
	a = new String(gradeondb).toString();
	b = new String(calculatedgrade).toString();

	if (a == b){
		return 0;
	}

	c = feeForGrade(a);
	d = feeForGrade(b);

	return ( c - d );

}
//==================================================
function paramSetup() {

	// Now create the URL's for the team and its fixtures
	membersurl = new String(baseurl + "?id=41");
}

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});

// Display fixture list for a given team and season

function displayAgeGradeComparison() {

	// var eventsfound = false;
	$.getJSON(membersurl,function(data){

		// Need to accumulate summary data object here 
		// by looping through returned data


		// console.log(url);

		var jsonstring = JSON.stringify(data);

		jsonstring = new String("{allMembers:"+jsonstring+"}");

		// var eventdata = $.parseJSON(jsonstring);
		var memberdata = eval("(" + jsonstring + ")");

		// Set the boolean if we have data
		// if (eventdata.length > 1)
		//	eventsfound = true;


		//Get the HTML from the template   in the script tag
	    var theTemplateScript = $("#memberlist-template").html(); 

	   //Compile the template
	    var theTemplate = Handlebars.compile (theTemplateScript); 
		// $("#main").append (theTemplate(fixturedata)); 

		// Loop through memberdata
		var seasonstartage = 0;
		var seasongrade = new String("").toString();
		var feesmismatch = 0;
		$.each(memberdata, function () {
		   $.each(this, function () {
		   		seasongrade = new String("Unknown").toString();
		   		feesmismatch = 0;
		   		this.seasongrade = "UNKNOWN";
		   		this.feesmismatch = 0;
		   		// Calculate age at start of season for this person
		   		seasonstartage = seasonAge(this.printabledob);
		   		if (seasonstartage) {
		   			this.seasonage = seasonstartage
		   		} else {
		   			this.seasonage = -1;
		   		}
		   		// get correct grade for this season based on season age
		   		if (!(this.seasonage == -1)) {
		   			if (! (this.membergrade == "Social")) {
			   			seasongrade = seasonGrade(this.seasonage);
				   		// Now get financial difference between actual and calculated grades
				   		feesmismatch = feesDifference(this.membergrade, seasongrade);
		   			} else {
		   				seasongrade = new String("Social").toString();
		   			}
		   		}
		   		this.seasongrade = seasongrade;
		   		this.feesmismatch = feesmismatch;
		   });
		});

		// jsonstring = JSON.stringify(memberdata);

		// var eventdata = $.parseJSON(jsonstring);
		// memberdata = eval("(" + jsonstring + ")");

		//Get the HTML from the template   in the script tag
	    // var memberTemplateScript = $("#summary-template").html(); 

	   //Compile the template
	    // var memberTemplate = Handlebars.compile (memberTemplateScript); 
		// Handlebars.registerPartial("description", $("#shoe-description").html()); 
		$("#main").empty();   
		$("#main").append (theTemplate(memberdata)); 


	});  // end of function(data)

}

// Display fixture list for a given team and season


// --------------  End of helper/utility functions ---------------------------

// Now do the document.ready stuff

$(document).ready(function() {
	
	// display Ladies 1st Team on initial load
	
	paramSetup();

	// Refresh all results if the Fetch button is pressed

	displayAgeGradeComparison();


})  // end of document.ready



