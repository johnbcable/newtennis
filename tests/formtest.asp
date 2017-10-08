<%@language="JScript" CODEPAGE="65001"%>
<%
// First variables that need to be set for each page
var debugging = true; // set to true if debug output reqd
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Testing new submit-button class");
// Now for any variables local to this page
var myusername, myaddress;
var refurl;
var onwardurl;
var frmUserId, frmPassword;

// var debugging = current_debug_status();
// Set up default greeting strings
frmUserId = new String("").toString();
frmPassword = new String("").toString();
refurl = new String("").toString();

// End of page start up coding
refurl = new String(Request.Form("refurl")).toString();
if (refurl == "" || refurl=="null" || refurl == "undefined") {
	refurl = new String(Request.QueryString("d")).toString();
	if (refurl == "" || refurl=="null" || refurl == "undefined") {
		refurl = new String("").toString();
	}
}
onwardurl = new String(refurl).toString();

frmUserId = new String(Request.Form("frmUserId")).toString();
if (frmUserId == "" || frmUserId=="null" || frmUserId == "undefined") {
	frmUserId = new String(Request.QueryString("u")).toString();
	if (frmUserId == "" || frmUserId=="null" || frmUserId == "undefined") {
		frmUserId = new String("").toString();
	}
}
	

frmPassword = new String(Request.Form("frmPassword")).toString();
if (frmPassword == "" || frmPassword=="null" || frmPassword == "undefined") {
	frmPassword = new String(Request.QueryString("p")).toString();
	if (frmPassword == "" || frmPassword=="null" || frmPassword == "undefined") {
		frmPassword = new String("").toString();
	}
}
	

// Make sure we have a default onward URL if one not come in from form
if (onwardurl == "")
	onwardurl = new String("/members.html").toString();

if (debugging)
{
%>
		<p>
			<br />
			frmUserId was     [<%= frmUserId %>]<br />
			frmPassword was   [<%= frmPassword %>]<br />
			Ref URL was       [<%= refurl %>]<br />
			Onward URL was    [<%= onwardurl %>]<br />
		</p>
<%
}


%>
