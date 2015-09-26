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

setTimeout("if (!(flash5Installed || flash6Installed)) window.top.location = '/miniTennis/flashInstall/default.htm';",1000);
