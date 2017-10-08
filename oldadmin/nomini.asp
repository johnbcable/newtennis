<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "National Competition Framework - Adult";
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
		<div id="framework">
<!--#include file="cfmap.htm" -->	
		</div>
		<p>
			The National Competition Framework makes no explicit statement of a maximum age for taking part in this, supervised programme. It is
			expected, however, that by the age of 18 (and you are now <%= myageinyears %>) that your need for such a strongly supervised 
			programme at club coaching level will reduce - as you enjoy playing tennis and are able to make your own arrangements with regard to 
			external competitions that you may wish to enter.
		</p>
 		<h4>Ongoing Coaching Provision</h4>
		<div id="overlayboxquote" class="boxright" style="width:250px;">
			<h4 class="boxheader">Where do I fit in to this framework?</h4>
			<form action="cfdecide.asp" method="GET">
					<div id="mydateofbirth" style="padding-left:20px;">
						<label for="dob">My date of birth is:</label><br />
						<input type="text" name="dob" id="dob" size="12" maxlength="10" onBlur="javascript:checkdate(this)">
						<span>&nbsp;(dd/mm/yyyy)</span>
					</div>
					<div id="submitblock" align="right">
						<p style="margin-right:10px;">
							<input align="right" type="submit" value="Show me">
					</p>
				</div>
			</form>
		</div>
		<p>
			The club does recognise that adults who have recently taken up tennis and/or who have gone back to tennis after some periods 
			of neglect (due to pressures of career and family, for example) will wish to develop their game and enjoy tennis to a reasonable 
			standard, perhaps taking part in Hampton's league teams or continuing to enjoy the social tennis at the club. If you feel that 
			there would be sufficient demand for more structured adult coaching within the club, please contact the coach, Ian Poole (07968 451956) 
			to dicuss your requirements. In the past, the club has seen both individual coaching sessions and group adult coaching sessions 
			run by its coaching staff at various times.<br /><br />
			Take a look at our <a href="juniors/coaching.html">general coaching provision</a> and see what would be most use to you.
		</p>
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
