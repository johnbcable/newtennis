function toHex(str) {
	var hex = '';
	for(var i=0;i<str.length;i++) {
		hex += '|'+str.charCodeAt(i).toString(16);
	}
	return hex;
}
function toOct(str) {
	var oct = '';
	for(var i=0;i<str.length;i++) {
		oct += '|'+str.charCodeAt(i).toString(8);
	}
	return oct;
}
function toDec(str) {
	var dec = '';
	for(var i=0;i<str.length;i++) {
		dec += '|'+str.charCodeAt(i).toString(10);
	}
	return dec;
}
function toChars(str) {
	var chars = '';
	for(var i=0;i<str.length;i++) {
		chars += '|'+str.substr(i,1).toString();
	}
	return chars;
}
