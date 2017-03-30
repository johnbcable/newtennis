
var debugthis = true;

$(document).ready(function() {

	var jsonstring = new String("");

	jsonstring = localStorage.getItem("tennissignin");

	if (debugthis) {
		console.log("Retrieved signin string is:    "+jsonstring);
	}

	if (jsonstring) {  // already signed in - go to members home page
		window.location.href = "/members.html";
	}
    
 });    // document.ready
