// Common Scripts
// version 1.0
// created by: Robert Gilks
// date: 22/8/02
// modified:

var loadCommon = true; // used to verify script has loaded

var querySplit = String(window.location).split("?");
var loc = querySplit[1];
var framesetUrl = "http://minitennis.ltadev.co.uk/miniTennis/default.asp?"+loc;
if (window.name != 'content' && window.name != 'iFrameContent'
	&& String(window.location).indexOf('admin') == -1
	&& window.location != "http://minitennis.ltadev.co.uk/miniTennis/") {
	window.top.location = framesetUrl;
}


// determine object model
var isDom = document.getElementById ? true:false;
var isNN4 = document.layers ? true:false;
var isIE = document.all ? true:false;

// determine the platform
var browserVersion = parseFloat(navigator.appVersion);
var isOpera = (navigator.userAgent.indexOf("Opera") != -1);
var isMac = (navigator.appVersion.indexOf("Mac") != -1);
var isNetscape = (navigator.appName.indexOf("Netscape") != -1);

// Client-side Browser Check
var agt = navigator.userAgent.toLowerCase();
  	var version = parseFloat(navigator.appVersion);
var is_ie = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
var is_ie3 = (is_ie && (version < 4));
var is_ie4 = (is_ie && (version == 4) && (agt.indexOf("msie 5")==-1 && agt.indexOf("msie 6")==-1) );
var is_ie4up = (is_ie && (version >= 4));
var is_ie5 = (is_ie && (version == 4) && (agt.indexOf("msie 5.0")!=-1) );
   var is_ie5_5 = (is_ie && (version == 4) && (agt.indexOf("msie 5.5") !=-1));
   var is_ie5up = (is_ie && !is_ie3 && !is_ie4);
   var is_ie5_5up =(is_ie && !is_ie3 && !is_ie4 && !is_ie5);
var is_nav = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
              && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
              && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1));
var is_mac = (agt.indexOf("mac")!=-1);				
var is_nav6up = (is_nav && (version >= 5));
var is_ie4up  = (is_ie && (version >= 4));   

if (!(is_ie5up || is_nav6up || isOpera)) {
	window.top.location = "/upgrade/upgrade.htm";
}


// Detect if Macromedia Shockwave Flash version 5+ is present on the client
var flash5Installed = false;
var flash6Installed  = false;

if (navigator.plugins && navigator.plugins.length > 0) {
	if (navigator.plugins["Shockwave Flash"]) {
    	flashPlugin = true;	
	   	var words = navigator.plugins["Shockwave Flash"].description.split(" ");	
	   	for (var i = 0; i < words.length; ++i) {
			if (isNaN(parseInt(words[i]))) continue;
			if (words[i] == '5.0') flash5Installed = true;
			if (words[i] == '6.0') flash6Installed = true;
	   	}		
	}
} else if (navigator.userAgent && navigator.userAgent.indexOf("MSIE")>=0
	&& (navigator.userAgent.indexOf("Windows 95")>=0
		|| navigator.userAgent.indexOf("Windows 98")>=0
			|| navigator.userAgent.indexOf("Windows NT")>=0)) {
				document.write('<scr' + 'ipt language=VBScript\> \n');
				document.write('on error resume next \n');
				document.write('flash5Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.5")))\n');
				document.write('flash6Installed = (IsObject(CreateObject("ShockwaveFlash.ShockwaveFlash.6")))\n');
				document.write('</scr' + 'ipt\> \n');
}

// If the user does not have flash 5 or flash 6 go to the flashInstall page since
// Mini Tennis requires flash for the menu to work.
// Should probably put this into a function since it was causing me problems from home going to the install falsh page when not neccessary
setTimeout("if (!(flash5Installed || flash6Installed)) window.top.location = '/miniTennis/flashInstall/default.htm';",300);

// Deal with Netscape 4 page reload bug.
var winX = null;
var winY = null;
if (isNN4) {
	winX = window.innerWidth;
	winY = window.innerHeight;
}

function nn4Resize() {
	if (isNN4 && (winX != window.innerWidth || winY != window.innerHeight)) {
		history.go(0);
	}
}

// Open a window of the desired size in the centre of the screen.
function openWindow(target_file, width, height, hasScrollBars) {
	// ADD NAME FIELD and make sure it get's focus!!!
	var theWidth = width;
	var theHeight = height;
	var scrollBars = "scrollbars";
	if (hasScrollBars == false) scrollBars = "scrollbars=0";
	if ((theWidth == "")||(theWidth == null)) theWidth = 760;
	if ((theHeight == "")||(theHeight == null)) theHeight = 550;
	var theLeft = (screen.availWidth - theWidth)/2;
	var theTop = (screen.availHeight - theHeight)/2; 
	var popupWin = window.open(target_file, 'popUp', 'top='+theTop+',left='+theLeft+',fullscreen=no,screenX=0,screenY=0,menubar=0,toolbar=0,location=0,directories=0,status=0,'+scrollBars+',resizable,width='+theWidth+',height='+theHeight);
	popupWin.focus();
}


// test if regular expressions are supported
var regExpSupported = false;
if (window.RegExp) {
	var tempStr = "a";
	var tempReg = new RegExp(tempStr);
	if (tempReg.test(tempStr)) regExpSupported = true;
}

// Test that a string could be a valid e-mail address 
function isEmail(str) {
	if (regExpSupported) {
		var r1 = new RegExp("(@.*@)|(\\.\\.)|(@\\.)|(^\\.)");
		var r2 = new RegExp("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,4}|[0-9]{2,4})(\\]?)$");
		return (!r1.test(str) && r2.test(str));
	} else {
		return (str.indexOf(".") > 2) && (str.indexOf("@") > 0);
	}
}

//This function replaces double quotes with single quotes.
//To be used for field that reqire confirmboxes to put up on other pages
// eg when deleteing a document/advert/user. If not used may cause javascript error!
function rplQuote(theForm, theField){
	var objField;
	if (isNN4) {
		objField = eval('document.layers["pageBody"].'+theForm + "." + theField);
	} else {
		objField = eval(theForm + "." + theField);
	}
	var tempString = objField.value
	while (tempString.indexOf('"')!= -1){
		tempString = tempString.replace('"',"'");
	}
	objField.value = tempString
}

// Test that the fields specified in theArr (nested array)
// are filled in theForm ( reference to a HTML form within a document )
// if not filled pop-up an alert and focus on the unfilled field.
// var theArr = new Array( new Array('FIELD NAME','message'), new Array('FIELD NAME','message')...);
function checkFieldsFilled(theForm, theArr) {
	for (var i in theArr) {			
		if (typeof(theArr[i]) == 'object') {
			// CHECK IN NN4 !!
			if (isNN4) {
				if (eval('document.layers["pageBody"].'+theForm+'.'+theArr[i][0]+'.value == ""')){
					alert(theArr[i][1]); 
					if (theArr[i][2] != "noFocus") eval('document.layers["pageBody"].'+theForm+'.'+theArr[i][0]+'.focus()');
					return false;
				}
			} else {
			if (eval(theForm+'.'+theArr[i][0]+'.value == ""')){
				alert(theArr[i][1]); 
				if (theArr[i][2] != "noFocus") eval(theForm+'.'+theArr[i][0]+'.focus()');
				return false;
			}
			}
			checkFieldsFilled(theArr[i]);					
		}									
	}
	return true;					
}

// Test that a string could be a valid e-mail address 
function isEmail(str) {
	if (regExpSupported) {
		var r1 = new RegExp("(@.*@)|(\\.\\.)|(@\\.)|(^\\.)");
		var r2 = new RegExp("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,4}|[0-9]{2,4})(\\]?)$");
		return (!r1.test(str) && r2.test(str));
	} else {
		return (str.indexOf(".") > 2) && (str.indexOf("@") > 0);
	}
}

function checkValidEmail(theForm, fieldName, message) {		
	// CHECK IN NN4 !!
	if (isNN4) {
		if (eval('document.layers["pageBody"].'+theForm+'.'+fieldName+'.value') == "") {
			// no email address is valid
			return true;
		}
		if (!isEmail(eval('document.layers["pageBody"].'+theForm+'.'+fieldName+'.value')))	{
			alert(message)
			eval('document.layers["pageBody"].'+theForm+'.'+fieldName+'.focus()');
			return false;
		}
	} else {
	if (eval(theForm+'.'+fieldName+'.value') == "") {
		// no email address is valid
		return true;
	}
	if (!isEmail(eval(theForm+'.'+fieldName+'.value')))	{
		alert(message)
		eval(theForm+'.'+fieldName+'.focus()');
		return false;
	}
	}
	return true;
}

function goBack(strPage) {	
	history.back();
}

function downloadScreensaver() {	
	if (isMac) {
		window.location = "http://minitennis.totaltennis.net/miniTennis/screensaver/Install_MTscreensaverMAC";
	} else {
		window.location = "http://minitennis.totaltennis.net/miniTennis/screensaver/Minitennis_Screensaver_Installer.exe";
		/*
		if (flash6Installed) {
			window.location = "http://minitennis.totaltennis.net/miniTennis/screensaver/Minitennis_Screensaver_Installer.exe";
		} else {
			alert("You need to install the latest version of Flash before installing the Minitennis Screensaver.");
			window.top.location = "http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash";
		}
		*/
	}
}
	
