<%
//
//  TwitterObject
//
//  Holds set of club tweets
//

function TwitterObject(name) {
	this.name = name;
	this.nameurl = "https://twitter.com/"+name;
	this.tweets = new Array();
};

TwitterObject.prototype.addTweet = function(created, imageurl, text) {
	this.tweets.push(new Object({
		created_on: created,
		image: imageurl,
		tweet: text
	}));
};

%>
