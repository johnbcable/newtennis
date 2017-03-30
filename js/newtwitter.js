// JQuery Twitter Feed. Coded by www.tom-elliott.net (2012) and modified from https://twitter.com/javascripts/blogger.js
//UPDATED TO AUTHENTICATE TO API 1.1

//
//  TwitterObject
//
//  Holds set of club tweets
//

function TwitterObject(name) {
	this.name = name;
	this.nameurl = "https://twitter.com/"+name;
	this.twitterlogo = new String("images/twitter-bird-light.png")
	this.tweets = new Array();
};

TwitterObject.prototype.addTweet = function(created, imageurl, text) {
	this.tweets.push(new Object({
		created_on: created,
		image: imageurl,
		tweet: text
	}));
};

var debugthis = true;   // set to false for production

// Utility functions

// Register Handlebars helpers

Handlebars.registerHelper('equalsTo', function(v1, v2, options) { 
    if(v1 == v2) { return options.fn(this); } 
    else { return options.inverse(this); } 
});


//Function modified from Stack Overflow
function addlinks(data) {
    //Add link to all http:// links within tweets
    data = data.replace(/((https?|s?ftp|ssh)\:\/\/[^"\s\<\>]*[^.,;'">\:\s\<\>\)\]\!])/g, function(url) {
        return '<a href="'+url+'" >'+url+'</a>';
    });
         
    //Add link to @usernames used within tweets
    data = data.replace(/\B@([_a-z0-9]+)/ig, function(reply) {
        return '<a href="http://twitter.com/'+reply.substring(1)+'" style="font-weight:lighter;" >'+reply.charAt(0)+reply.substring(1)+'</a>';
    });
    return data;
}
 
 
function relative_time(time_value) {
  var values = time_value.split(" ");
  time_value = values[1] + " " + values[2] + ", " + values[5] + " " + values[3];
  var parsed_date = Date.parse(time_value);
  var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
  var delta = parseInt((relative_to.getTime() - parsed_date) / 1000);
  var shortdate = time_value.substr(4,2) + " " + time_value.substr(0,3);
  delta = delta + (relative_to.getTimezoneOffset() * 60);
 
  if (delta < 60) {
    return '1m';
  } else if(delta < 120) {
    return '1m';
  } else if(delta < (60*60)) {
    return (parseInt(delta / 60)).toString() + 'm';
  } else if(delta < (120*60)) {
    return '1h';
  } else if(delta < (24*60*60)) {
    return (parseInt(delta / 3600)).toString() + 'h';
  } else if(delta < (48*60*60)) {
    //return '1 day';
	return shortdate;
  } else {
    return shortdate;
  }
}

//==================================================
function ddmmyyyy(d){
   var day, month, x;
   var s = new String("").toString();
   day = d.getDate();
	if (day < 10)
		s += "0";
	s += day+"/";
   month = (d.getMonth() + 1)
	if (month < 10)
		s+= "0";
	s += month + "/";
   s += d.getFullYear();
   return(new String(s).toString());
}

function fetchTweets(profilename) {

    var displaylimit = 4;
    var twitterprofile = new String(profilename).toString();
	var screenname = new String(profilename).toString();
    var showdirecttweets = false;
    var showretweets = true;
    var showtweetlinks = true;
    var showprofilepic = true;
	
	var headerHTML = '';
	var loadingHTML = '';

	var myTweets = new TwitterObject(profilename);
	var created, tweetImage, tweetText, dummy;                // What we show from a tweet

	var displaylimit = 3;
    var twitterprofile = "hamptontennis";
	var screenname = "hamptontennis";
	var headerHTML = '<a href="https://twitter.com/" ><img src="/images/twitter-bird-light.png" width="34" style="float:left;padding:3px 12px 0px 6px" alt="twitter bird" /></a>';
	headerHTML += '<h1>'+screenname+' <span style="font-size:13px"><a href="https://twitter.com/'+twitterprofile+'" >@'+twitterprofile+'</a></span></h1>';
	var loadingHTML = '<div id="loading-container"><img src="/images/ajax-loader.gif" width="32" height="32" alt="tweet loader" /></div>';
	
	$('#twitter-feed').html(headerHTML + loadingHTML);

    $.getJSON('/get-tweets.php', 
        function(feeds) {   
		   //alert(feeds);
		   var displayCounter = 1;
            for (var i=0; i<feeds.length; i++) {
				var tweetscreenname = feeds[i].user.name;
                var tweetusername = feeds[i].user.screen_name;
                var profileimage = feeds[i].user.profile_image_url_https;
                var status = feeds[i].text; 
				var isaretweet = false;
				var isdirect = false;
				var tweetid = feeds[i].id_str;
				
				//If the tweet has been retweeted, get the profile pic of the tweeter
				if(typeof feeds[i].retweeted_status != 'undefined'){
				   profileimage = feeds[i].retweeted_status.user.profile_image_url_https;
				   tweetscreenname = feeds[i].retweeted_status.user.name;
				   tweetusername = feeds[i].retweeted_status.user.screen_name;
				   tweetid = feeds[i].retweeted_status.id_str
				   isaretweet = true;
				 };
				 
				 
				 //Check to see if the tweet is a direct message
				 if (feeds[i].text.substr(0,1) == "@") {
					 isdirect = true;
				 }
				 
				//console.log(feeds[i]);
				 
				 if (((showretweets == true) || ((isaretweet == false) && (showretweets == false))) && ((showdirecttweets == true) || ((showdirecttweets == false) && (isdirect == false)))) { 
					if ((feeds[i].text.length > 1) && (displayCounter <= displaylimit)) {             
						if (showtweetlinks == true) {
							status = addlinks(status);
						}
						 
						// Add data into local tweet variables

						dummy = new Date(feeds[i].created_at);
						created = new String(ddmmyyyy(dummy)).toString();
						tweetImage = new String(profileimage).toString();
						tweetText = new String(status).toString();

						myTweets.addTweet(created,tweetImage,tweetText);

						if (debugthis) {
							console.log("myTweets now is: ("+JSON.stringify(myTweets)+")");
						}

						displayCounter++;

					}   
				 }
            }    // end for loop

			if (debugthis) {
				console.log("End of for loop, myTweets now is: ("+JSON.stringify(myTweets)+")");
			}

			var jsonstring = JSON.stringify(myTweets);

			jsonstring = new String("{allTweets:"+jsonstring+"}");

			if (debugthis) {
				console.log("stringified tweets after allTweets added: "+jsonstring);
			}

			// var eventdata = $.parseJSON(jsonstring);
			var tweetdata = eval("(" + jsonstring + ")");

			// Set the boolean if we have data
			// if (eventdata.length > 1)
			//	eventsfound = true;

			//Get the HTML from the template   in the script tag
		    var theTemplateScript = $("#tweet-template").html(); 

		   //Compile the template
		    var theTemplate = Handlebars.compile (theTemplateScript); 
			// Handlebars.registerPartial("description", $("#shoe-description").html());  
			$("#twitter-feed").html('');  
			$("#twitter-feed").append(headerHTML);  
			$("#twitter-feed").append (theTemplate(tweetdata)); 

             
    });

     
}


// --------------  End of helper/utility functions ---------------------------

$(document).ready(function() {


	// Show retrieved tweets
	fetchTweets("hamptontennis");


})  // end of document.ready


