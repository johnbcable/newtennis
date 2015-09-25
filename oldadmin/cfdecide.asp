<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "National Competition Framework";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
//
// Now get the dob from the form (or query string) and
// calculate which bit of the competition framework to 
// redirect to
//
var mydob = new String(Request.Form("dob")).toString();
if (mydob == "" || mydob == "null" || mydob == "undefined")
{
	mydob = new String(Request.QueryString("dob")).toString();
	if (mydob == "" || mydob == "null" || mydob == "undefined")
		mydob = new String("");
}
var debug = new String(Request.Form("debug")).toString();
if (debug == "" || debug == "null" || debug == "undefined")
{
	debug = new String(Request.QueryString("debug")).toString();
	if (debug == "" || debug == "null" || debug == "undefined")
		debug = new String("N");
}
var debugging = (debug == "Y");
if (mydob == "")
	Response.Redirect("juniors/minitennis.html");
var dobday, dobmonth, dobyear;
var dobparts = mydob.split("/");
if (dobparts.length != 3)
	Response.Redirect("juniors/minitennis.html");
dobday = new Number(dobparts[0]).toString();
dobmonth = new Number(dobparts[1]).toString();
dobyear = new Number(dobparts[2]).toString();
var dobdate = new Date(dobparts[2],dobparts[1],dobparts[0]);
var today = new Date();
var todayday = today.getDate();
var todaymonth = today.getMonth()+1;
var todayYear = today.getFullYear();
var yearage = todayYear - dobyear;
if ( todaymonth > dobmonth)
{
	myageinyears = yearage;
}
else
{
	if ( todaymonth < dobmonth)
	{
		myageinyears = yearage - 1;
	}
	else
	{
		if (todayday < dobday)
		{
			myageinyears = yearage -1;
		}
		else
		{
			if (todayday == dobday)
				myageinyears = yearage;
			else
				myageinyears = yearage - 1;
		}
	}
}
var myageinms = today-dobdate;
var oneMinute = 60 * 1000  // milliseconds in a minute
var oneHour = oneMinute * 60
var oneDay = oneHour * 24
var oneWeek = oneDay * 7
var myageinweeks = Math.round((myageinms/oneWeek));
var ydummy = Math.round(myageinweeks % 52);
// var myageinyears = Math.round(myageinweeks/52);
// if (ydummy > 0)
//	myageinyears = myageinyears - 1;
//
// Age calculation done - now reroute to required cf page
//
if (myageinyears < 8)
	Response.Redirect("juniors/minired.html?dob="+mydob);
if (myageinyears > 18)
	Response.Redirect("nomini.asp?zz="+myageinyears+"&dob="+mydob);
if (myageinyears > 10)
	Response.Redirect("juniors/miniyellow.html?dob="+mydob);
if (myageinyears > 9)
	Response.Redirect("juniors/minigreen.html?dob="+mydob);
if (myageinyears > 8)
	Response.Redirect("juniors/miniorange.html?dob="+mydob);
if (myageinyears == 8)
	Response.Redirect("juniors/minired.html?dob="+mydob+"&transition=Y");
Response.Redirect("juniors/minitennis.html");
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">	<!-- content is everything to the right of the leftcolumn -->
		<h3><%= pagetitle %></h3>
<%
if (debugging)
{
%>
		My dob = <%= mydob %><br />
		today is <%= today %>; <br />
		my age today is <%= myageinms %>; <br />
		my age in weeks is <%= myageinweeks %>; <br />
		Birthdate:  day = <%= dobday %>, month = <%= dobmonth %>, year = <%= dobyear %><br />
		Today:      day = <%= todayday %>, month = <%= todaymonth %>, year = <%= todayYear %><br />
		my age in years is <%= myageinyears %>
<%
}
%>
</div>    <!-- end of content div -->
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->

</div>
<!--#include file="textnav.asp" -->
<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="jnewspanel.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>
